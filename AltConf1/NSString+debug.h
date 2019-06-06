//
//  NSString+debug.h
//  AltConf1
//
//  Created by Liviu Romascanu on 24/05/2019.
//  Copyright © 2019 Applicaster. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Debug)

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id  _Nullable *)buffer count:(NSUInteger)len;

@end

NS_ASSUME_NONNULL_END
