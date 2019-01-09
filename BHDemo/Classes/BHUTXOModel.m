//
//  BHUTXOModel.m
//  BHDemo
//
//  Created by QBH on 2019/1/9.
//  Copyright © 2019 QiaoBaHui. All rights reserved.
//

#import "BHUTXOModel.h"

@implementation BHUTXOModel

+ (instancetype)utxoModelWithData:(NSDictionary *)data {
	BHUTXOModel *utxoModel = [BHUTXOModel new];
	utxoModel.money = [data decimalForKey:@"money"];
	utxoModel.size = [data decimalForKey:@"size"];
	
	return utxoModel;
}

@end
