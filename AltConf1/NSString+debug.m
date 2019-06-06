//
//  NSString+debug.m
//  AltConf1
//
//  Created by Liviu Romascanu on 24/05/2019.
//  Copyright © 2019 Applicaster. All rights reserved.
//

#import "NSString+debug.h"

@implementation NSString (Debug)

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id  _Nullable *)buffer count:(NSUInteger)len {
    NSLog(@"We shouldn't have reached this - string value :%@", self);
    return 0;
}


@end
