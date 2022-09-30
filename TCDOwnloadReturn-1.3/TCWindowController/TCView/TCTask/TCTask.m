//
//  TCTask.m
//  TCDOwnloadReturn-1.3
//
//  Created by Mattia Leggieri on 28/09/22.
//

#import "TCTask.h"

@implementation TCTask

- (void)downloadFromArray:(NSArray *)array {
    
    NSString *path = @"/tmp/data_script.sh";
    
    //NSData *data_script = [my_script dataUsingEncoding:NSUTF8StringEncoding];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:@"/tmp/data_script.sh"]) {
        if ([manager removeItemAtPath:@"/tmp/data_script.sh" error:nil])
            NSLog(@"File rimosso!");
    }
    
    //[manager createFileAtPath:[NSString stringWithFormat:@"/tmp/data_script.sh"] contents:data_script attributes:nil];
    
    for (int i = 0; i<array.count; i++) {
        NSLog(@"item = %@", array[i]);
        //sleep(1);
    }
    
}

@end
