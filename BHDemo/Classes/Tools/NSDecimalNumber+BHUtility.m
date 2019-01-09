//
//  NSDecimalNumber+BHUtility.m
//  BHDemo
//
//  Created by QiaoBaHui on 2019/1/9.
//  Copyright © 2019 QiaoBaHui. All rights reserved.
//

#import "NSDecimalNumber+BHUtility.h"

static const NSInteger SCALE = 6;

@implementation NSDecimalNumber (BHUtility)

+ (NSDecimalNumber *)zeroNumber {
	return [[NSDecimalNumber alloc] initWithDouble:0.0];
}

- (NSDecimalNumber *)floorFormatScale {
	return [self addingWithDecimal:[NSDecimalNumber zeroNumber]];
}

#pragma mark - Conversion Methods

+ (NSString *)formatToStringWithDecimal:(NSDecimalNumber *)decimal {
	return [[decimal addingWithDecimal:[NSDecimalNumber zeroNumber]] stringValue];
}

+ (NSDecimalNumber *)formatToDecimalWithString:(NSString *)aString {
	return [[NSDecimalNumber decimalNumberWithString:aString] addingWithDecimal:[NSDecimalNumber zeroNumber]];
}

#pragma mark - Calculate Decimal Methods

- (NSDecimalNumber *)addingWithDecimal:(NSDecimalNumber *)decimal {
	return [self decimalNumberByAdding:decimal withBehavior:[NSDecimalNumber decimalScale:SCALE]];
}

- (NSDecimalNumber *)subtractingWithDecimal:(NSDecimalNumber *)decimal {
	return [self decimalNumberBySubtracting:decimal withBehavior:[NSDecimalNumber decimalScale:SCALE]];
}

- (NSDecimalNumber *)multiplyingWithDecimal:(NSDecimalNumber *)decimal {
	return [self decimalNumberByMultiplyingBy:decimal withBehavior:[NSDecimalNumber decimalScale:SCALE]];
}

- (NSDecimalNumber *)dividingWithDecimal:(NSDecimalNumber *)decimal {
	return [self decimalNumberByDividingBy:decimal withBehavior:[NSDecimalNumber decimalScale:SCALE]];
}

#pragma mark - Compare Decimal Methods

- (BOOL)isMoreThanDecimal:(NSDecimalNumber *)decimal {
	return [self compare:decimal] == NSOrderedDescending;
}

- (BOOL)isEqualDecimal:(NSDecimalNumber *)decimal {
	return [self compare:decimal] == NSOrderedSame;
}

- (BOOL)isLessThanDecimal:(NSDecimalNumber *)decimal {
	return [self compare:decimal] == NSOrderedAscending;
}

- (BOOL)isMoreOrEqualThanDecimal:(NSDecimalNumber *)decimal {
	return ([self compare:decimal] == NSOrderedDescending) || ([self compare:decimal] == NSOrderedSame);
}

- (BOOL)isLessOrEqualThanDecimal:(NSDecimalNumber *)decimal {
	return ([self compare:decimal] == NSOrderedAscending) || ([self compare:decimal] == NSOrderedSame);
}

#pragma mark - Private Methods

+ (NSDecimalNumberHandler *)decimalScale:(NSInteger)scale {
	return [NSDecimalNumberHandler
					decimalNumberHandlerWithRoundingMode:NSRoundDown
					scale:scale
					raiseOnExactness:NO
					raiseOnOverflow:NO
					raiseOnUnderflow:NO
					raiseOnDivideByZero:YES];
}

@end
