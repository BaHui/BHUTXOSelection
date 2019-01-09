//
//  BHUTXOModel.h
//  BHDemo
//
//  Created by QBH on 2019/1/9.
//  Copyright © 2019 QiaoBaHui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDictionary+BHUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface BHUTXOModel : NSObject

@property (nonatomic, strong) NSDecimalNumber *money;
@property (nonatomic, strong) NSDecimalNumber *size;

+ (instancetype)utxoModelWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
