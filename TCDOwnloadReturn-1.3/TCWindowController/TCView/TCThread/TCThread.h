//
//  TCThread.h
//  TCDOwnloadReturn-1.3
//
//  Created by Mattia Leggieri on 28/09/22.
//

#import "../../TCWindowController.h"
#import "../Interprete-1.1/Interprete-1.1.h"

@interface TCThread : NSThread
@property (nonatomic, strong, nullable) Interprete *interprete;
@property (nonatomic, strong, nullable) TCWindowController *controller;
@property (nonatomic, strong, nullable) TCThread *thread;
@property (nonatomic) int myId;
- (instancetype _Nullable)initWithController:(TCWindowController * _Nullable)controller;
- (void)okButton;
//- (void)myThread:(void * _Nonnull)block;
@end

