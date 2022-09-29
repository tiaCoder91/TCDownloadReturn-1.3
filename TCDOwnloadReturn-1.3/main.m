//
//  main.m
//  TCDOwnloadReturn-1.3
//
//  Created by Mattia Leggieri on 28/09/22.
//

#import "TCWindowController/TCWindowController.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
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
        
#pragma mark - TCTextView
        
        
        
        [app run];
    }
    return 0;
}
