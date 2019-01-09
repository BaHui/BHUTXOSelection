//
//  NSDictionary+BHUtility.h
//  BHDemo
//
//  Created by QiaoBaHui on 2019/1/9.
//  Copyright © 2019 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDecimalNumber+BHUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (BHUtility)

- (NSDecimalNumber *)decimalForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
