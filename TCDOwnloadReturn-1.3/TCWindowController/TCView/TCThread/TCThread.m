//
//  TCThread.m
//  TCDOwnloadReturn-1.3
//
//  Created by Mattia Leggieri on 28/09/22.
//

#import "TCThread.h"

@implementation TCThread

- (instancetype)initWithController:(TCWindowController *)controller {
    if (self = [super init]) {
        _controller = controller;
    }
    return self;
}


- (void)okButton {
    _thread = [[TCThread alloc] initWithTarget:self selector:@selector(callScript) object:nil];
    _thread.name = @"Script thread";
        
    [_thread start];
}


- (void)callScript {
    
    for (int i = 0; i<10; i++) {
        dispatch_queue_t miaGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
        
        dispatch_async(miaGlobalQueue,
        ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            dispatch_async(dispatch_get_main_queue(),
            ^{
                if (i == 1) {
                    
                    _interprete = [[Interprete alloc] init];
                    NSArray *listTask = [_interprete decode: _controller.textViewL.string];
                    
                    _thread = [[TCThread alloc] initWithBlock: ^{
                        _controller.task = [[TCTask alloc] init];
                        [_controller.task downloadFromArray:listTask];
                    }];
                    
                    [_thread start];
                    
                    NSLog(@"listTask = %@", listTask);
                    
                    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:_controller.textViewL.string];
                    
                    [_controller.textViewR.textStorage setAttributedString: attrStr];
                    [_controller.textViewR setTextColor: [NSColor blackColor]];
                    _controller.textViewR.font = [NSFont systemFontOfSize:12.0];
                    
                    [_controller.textViewL setFrameSize: NSMakeSize(_controller.window.frame.size.width/100*50-20, _controller.textViewL.frame.size.height)];
                    [_controller.textViewL setFrameOrigin: NSMakePoint(10, _controller.window.frame.size.height-30-10-_controller.textViewL.frame.size.height)];
                    
                    [_controller.textViewR setFrameSize: NSMakeSize(_controller.window.frame.size.width/100*50-10, _controller.textViewR.frame.size.height)];
                    [_controller.textViewR setFrameOrigin: NSMakePoint(_controller.window.frame.size.width-_controller.textViewR.frame.size.width-10, _controller.window.frame.size.height-30-10-_controller.textViewR.frame.size.height)];
                }
                NSLog(@"TCThread %@", _controller.textViewR.string);
            });
            dispatch_semaphore_signal(semaphore);
            dispatch_release(miaGlobalQueue);
        });
        sleep(1);
    }
}

@end
