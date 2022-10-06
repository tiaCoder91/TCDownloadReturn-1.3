//
//  TCViewController.h
//  TCDOwnloadReturn-1.3
//
//  Created by Mattia Leggieri on 29/09/22.
//

#import "../TCWindowController.h"

@interface TCViewController : NSObject <NSTextViewDelegate, NSComboBoxDelegate>
@property (nonatomic, strong) TCWindowController *controller;
@end

