//
//  NSDictionary+BHUtility.m
//  BHDemo
//
//  Created by QiaoBaHui on 2019/1/9.
//  Copyright © 2019 QiaoBaHui. All rights reserved.
//

#import "NSDictionary+BHUtility.h"

@implementation NSDictionary (BHUtility)

- (NSDecimalNumber *)decimalForKey:(NSString *)key {
	id value = [self valueForKey:key];
	if ([NSNull null] == value) {
		return nil;
	}
	return [NSDecimalNumber decimalNumberWithDecimal:[value decimalValue]];
}

@end
