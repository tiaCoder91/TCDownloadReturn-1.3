//
//  TCWindowController.h
//  TCDOwnloadReturn-1.3
//
//  Created by Mattia Leggieri on 28/09/22.
//


#import "TCWindow.h"

@interface TCWindowController : NSObject <NSWindowDelegate>
@property (nonatomic, strong) TCWindow *window;
@property (nonatomic, strong) TCView *mainView;
@property (nonatomic, strong) TCTextView *textViewL, *textViewR;
@property (nonatomic, strong) TCButton *ok, *cancel;
- (NSSize)displayPixelSize;
@end

