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

@end
