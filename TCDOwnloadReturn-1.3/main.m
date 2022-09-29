//
//  main.m
//  TCDOwnloadReturn-1.3
//
//  Created by Mattia Leggieri on 28/09/22.
//

#import "TCWindowController/TCWindowController.h"
#import "TCWindowController/TCView/TCThread/TCThread.h"
#import "TCWindowController/TCView/TCViewController.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {

#pragma mark - NSApplication
        
        NSApplication *app = [NSApplication sharedApplication];

#pragma mark - TCWindowController
        
        TCWindowController *controller = [[TCWindowController alloc] init];
        
#pragma mark - TCWindow
        
        NSSize displayPixelSize = [controller displayPixelSize];
        NSSize winSize = NSMakeSize(700, 500);
        
        NSRect frame = NSMakeRect(displayPixelSize.width/2-winSize.width/2, displayPixelSize.height/2-winSize.height/2, winSize.width, winSize.height);
        
        controller.window = [[TCWindow alloc] initWithFrame:frame];
        
        [controller.window setTitle:@"TCDownloadReturn"];
        [controller.window setMinSize:NSMakeSize(700, 530)];
        [controller.window setDelegate: controller];
        
        [controller.window makeKeyAndOrderFront:NSApp];
        
#pragma mark - TCView
        
        NSRect viewFrame = NSMakeRect(0, 0, winSize.width, winSize.height+30);
        controller.mainView = [[TCView alloc] initWithFrame: viewFrame];
        
        [controller.window.contentView addSubview: controller.mainView];
        
#pragma mark - TCTextView ( textViewL )
        
        NSRect textViewLRect = NSMakeRect(
               10,
               controller.window.frame.size.height-30-10-controller.window.frame.size.height/100*12,
               controller.window.frame.size.width/100*45,
               controller.window.frame.size.height/100*12
        );
        
        controller.textViewL = [[TCTextView alloc] initWithFrame: textViewLRect];
        
        [controller.textViewL setMaxSize:NSMakeSize(displayPixelSize.width, 200)];
        [controller.textViewL setString:@"Hi Mattia!"];
        [controller.textViewL setMyId:1];
        
        [controller.mainView addSubview: controller.textViewL];
        
#pragma mark - TCTextView ( textViewR )
        
        NSRect textViewRRect = NSMakeRect(
               controller.window.frame.size.width-controller.window.frame.size.width/100*45-10,
               controller.window.frame.size.height-30-10-controller.window.frame.size.height/100*12,
               controller.window.frame.size.width/100*45,
               controller.window.frame.size.height/100*12
        );
        
        controller.textViewR = [[TCTextView alloc] initWithFrame: textViewRRect];
        
        [controller.textViewR setMaxSize:NSMakeSize(displayPixelSize.width, 200)];
        [controller.textViewR setString:@"Questo sarà il log per ora."];
        [controller.textViewR setMyId:2];
        
        [controller.mainView addSubview: controller.textViewR];
        
#pragma mark - TCButton ( ok )
        
        controller.ok = [[TCButton alloc] initWithRect: NSMakeRect(controller.window.frame.size.width-90-10, 10, 90, 40)];
        controller.ok.title = @"Ok";
        
        [controller.mainView addSubview: controller.ok];
        
#pragma mark - TCButton ( cancel )
        
        controller.cancel = [[TCButton alloc] initWithRect: NSMakeRect(10, 10, 90, 40)];
        controller.cancel.title = @"Cancel";
        
        [controller.mainView addSubview: controller.cancel];
      
#pragma mark - TCViewController
        
        TCViewController *viewController = [[TCViewController alloc] init];
        viewController.controller = controller;
        [controller.textViewL setDelegate: viewController];
        [controller.textViewR setDelegate: viewController];
        
#pragma mark - TCThread
        
        TCThread *thread = [[TCThread alloc] initWithController:controller];
        thread.myId = 1;
        
        [thread myThread: ^{
            [controller.ok setTarget: thread];
            [controller.ok setAction: @selector(okButton)];
            [controller.mainView addSubview: controller.ok];
        }];
        
        [app run];
    }
    return 0;
}
