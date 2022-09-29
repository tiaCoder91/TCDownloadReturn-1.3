//
//  TCThread.h
//  TCDOwnloadReturn-1.3
//
//  Created by Mattia Leggieri on 28/09/22.
//

#import "../../TCWindowController.h"

@interface TCThread : NSThread
@property (nonatomic, strong, nullable) TCWindowController *controller;
- (instancetype _Nullable)initWithController:(TCWindowController * _Nullable)controller;
@end

