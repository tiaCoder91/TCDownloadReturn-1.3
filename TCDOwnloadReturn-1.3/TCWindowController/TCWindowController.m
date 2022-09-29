//
//  TCWindowController.m
//  TCDOwnloadReturn-1.3
//
//  Created by Mattia Leggieri on 28/09/22.
//

#import "TCWindowController.h"

@implementation TCWindowController

#pragma mark - Inizializzazioni e settaggi 

- (TCView *)mainView {
    [_mainView setWantsLayer:YES];
    [_mainView setNeedsDisplay:YES];
    _mainView.layer.backgroundColor = [[NSColor yellowColor] CGColor];
    return _mainView;
}

- (NSSize)displayPixelSize {
    NSScreen *screen = [NSScreen mainScreen];
    NSDictionary *description = [screen deviceDescription];
    NSSize displayPixelSize = [[description objectForKey:NSDeviceSize] sizeValue];
    return displayPixelSize;
}

#pragma mark - Metodi per modificare la vista

- (void)windowDidResize:(NSNotification *)notification {

    TCWindow *window = notification.object;
    
// TODO: Modifiche posizione e misure degli oggetti
    
    NSSize viewSize = NSMakeSize(window.frame.size.width+30, window.frame.size.height);
    [_mainView setFrameSize: viewSize];
    
    NSPoint buttonOrigin = NSMakePoint(window.frame.size.width-90-10, 10);
    [_ok setFrameOrigin: buttonOrigin];
    
    [_textViewL setFrameSize: NSMakeSize(window.frame.size.width/100*45, _textViewL.frame.size.height)];
    [_textViewL setFrameOrigin: NSMakePoint(10, window.frame.size.height-30-10-_textViewL.frame.size.height)];
    
    [_textViewR setFrameSize: NSMakeSize(window.frame.size.width/100*45, _textViewR.frame.size.height)];
    [_textViewR setFrameOrigin: NSMakePoint(window.frame.size.width-_textViewR.frame.size.width-10, window.frame.size.height-30-10-_textViewR.frame.size.height)];
    
}


- (void)windowWillClose:(NSNotification *)notification {
    NSLog(@"Application closed!");
    exit(0);
}

@end
