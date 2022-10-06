//
//  TCViewController.m
//  TCDOwnloadReturn-1.3
//
//  Created by Mattia Leggieri on 29/09/22.
//

#import "TCViewController.h"

@implementation TCViewController

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification {
    NSComboBox *box = [notification object];
    
    NSLog(@"last = %@", box.objectValue);
    NSLog(@"selected = %@", box.objectValueOfSelectedItem);
}

- (void)textDidChange:(NSNotification *)notification {
    
    TCTextView *text = [notification object];
    text.font = [NSFont systemFontOfSize:12.0];
    
    NSLog(@"_controller = %@", text.string);
    
    if (text.myId == 1) {
        [text setFrameSize: NSMakeSize(_controller.window.frame.size.width/100*50-20, text.frame.size.height)];
        [text setFrameOrigin: NSMakePoint(10, _controller.window.frame.size.height-30-10-text.frame.size.height)];
    } else if (text.myId == 2) {
        [text setFrameSize: NSMakeSize(_controller.window.frame.size.width/100*50-10, text.frame.size.height)];
        [text setFrameOrigin: NSMakePoint(_controller.window.frame.size.width-text.frame.size.width-10, _controller.window.frame.size.height-30-10-text.frame.size.height)];
    }
    
}

@end
