//
//  NSDecimalNumber+BHUtility.h
//  BHDemo
//
//  Created by QBH on 2019/1/9.
//  Copyright © 2019 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (BHUtility)

+ (NSDecimalNumber *)zeroNumber;

// Conversion
+ (NSString *)formatToStringWithDecimal:(NSDecimalNumber *)decimal;
+ (NSDecimalNumber *)formatToDecimalWithString:(NSString *)aString;

// Calculate
- (NSDecimalNumber *)addingWithDecimal:(NSDecimalNumber *)decimal;
- (NSDecimalNumber *)subtractingWithDecimal:(NSDecimalNumber *)decimal;
- (NSDecimalNumber *)multiplyingWithDecimal:(NSDecimalNumber *)decimal;
- (NSDecimalNumber *)dividingWithDecimal:(NSDecimalNumber *)decimal;

// Compare
- (BOOL)isMoreThanDecimal:(NSDecimalNumber *)decimal;
- (BOOL)isEqualDecimal:(NSDecimalNumber *)decimal;
- (BOOL)isLessThanDecimal:(NSDecimalNumber *)decimal;
- (BOOL)isMoreOrEqualThanDecimal:(NSDecimalNumber *)decimal;
- (BOOL)isLessOrEqualThanDecimal:(NSDecimalNumber *)decimal;

@end

NS_ASSUME_NONNULL_END
