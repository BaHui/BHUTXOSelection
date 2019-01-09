//
//  BHExampleViewController.h
//  BHDemo
//
//  Created by QiaoBaHui on 2019/1/9.
//  Copyright © 2019年 QiaoBaHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHExampleViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *allUtxoModels;
@property (nonatomic, strong) NSMutableArray *willUsedUtxoModels;

@property (nonatomic, strong) NSDecimalNumber *totalMoney;

@property (nonatomic, strong) NSDecimalNumber *totalSize;
@property (nonatomic, strong) NSDecimalNumber *totalTransferAndSize;
@property (nonatomic, strong) NSDecimalNumber *willUsedUtxosMoney;
@property (nonatomic, assign) NSInteger willUsedUtxoCount;

@property (weak, nonatomic) IBOutlet UITextField *transferMoneyTextField;

@property (weak, nonatomic) IBOutlet UITextField *totalSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *totalTransferAndSizeTextField;

@property (weak, nonatomic) IBOutlet UITextField *willUsedUtxosMoneyTextField;
@property (weak, nonatomic) IBOutlet UITextField *willUsedUtxoCountTextField;

+ (instancetype)create;

@end
