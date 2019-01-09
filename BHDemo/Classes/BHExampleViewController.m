//
//  BHExampleViewController.m
//  BHDemo
//
//  Created by QiaoBaHui on 2019/1/9.
//  Copyright © 2019年 QiaoBaHui. All rights reserved.
//

#import "BHExampleViewController.h"
#import "BHUTXOModel.h"

@interface BHExampleViewController ()

@end

static NSString *const DEMO_VIEWS_STORYBOARD_NAME = @"DemoViews";


@implementation BHExampleViewController

+ (instancetype)create {
  UIStoryboard *demoViewsStoryboard = [UIStoryboard storyboardWithName:DEMO_VIEWS_STORYBOARD_NAME bundle:nil];
  return [demoViewsStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([BHExampleViewController class])];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
	[self initAllUtxoModels];
}

#pragma mark - IBAction Methods

- (IBAction)startSelectButtonClicked:(id)sender {
	if ([self canSelect]) {
		NSDecimalNumber *money = [NSDecimalNumber formatToDecimalWithString:self.transferMoneyTextField.text];
		[self selectWillUsedUtxosWithMoney:money];
		[self updateViews];
	} else {
		NSLog(@"请输入正确的转账金额!!!");
	}
}

#pragma mark - Filter Will Used Utxos

- (void)selectWillUsedUtxosWithMoney:(NSDecimalNumber *)money {
	self.willUsedUtxoModels = [NSMutableArray new];
	
	// 初步筛选出满足转账金额的
	NSDecimalNumber *countMoney = [NSDecimalNumber zeroNumber];
	for (BHUTXOModel *utxoModel in self.allUtxoModels) {
		if ([countMoney isLessOrEqualThanDecimal:money]) {
			countMoney = [countMoney addingWithDecimal:utxoModel.money];
			[self.willUsedUtxoModels addObject:utxoModel];
		} else {
			break;
		}
	}
	self.willUsedUtxosMoney = countMoney;
	self.willUsedUtxoCount = [self.willUsedUtxoModels count];
	
	
	// 计算初步筛选出来的费用
	NSDecimalNumber *countSize = [NSDecimalNumber zeroNumber];
	for (BHUTXOModel *utxoModel in self.willUsedUtxoModels) {
		countSize = [countSize addingWithDecimal:utxoModel.size];
	}
	self.totalSize = countSize;
	
	
	// 转账金额+费用 与 筛选出来的总值 比较
	NSDecimalNumber *needMoney = [countSize addingWithDecimal:money];
	if ([needMoney isLessThanDecimal:countMoney]) {
		[self selectWillUsedUtxosWithMoney:needMoney];
		return;
	} else {
		self.totalTransferAndSize = [[self transferDecimalMoney] addingWithDecimal:countSize];
	}
	
	// 转出全部
	if ([needMoney isMoreThanDecimal:self.totalMoney]) {
		NSDecimalNumber *canTransfer = [[self transferDecimalMoney] subtractingWithDecimal:[needMoney subtractingWithDecimal:self.totalMoney]];
		self.transferMoneyTextField.text = [canTransfer stringValue];
	}
}

#pragma mark - Private Methods

- (NSDecimalNumber *)transferDecimalMoney {
	return [NSDecimalNumber formatToDecimalWithString:self.transferMoneyTextField.text];
}

- (BOOL)canSelect {
	return [[self transferDecimalMoney] isMoreThanDecimal:[NSDecimalNumber zeroNumber]]
	&& [[self transferDecimalMoney] isLessOrEqualThanDecimal:self.totalMoney];
}

- (void)updateViews {
	self.totalSizeTextField.text = [self.totalSize stringValue];
	self.totalTransferAndSizeTextField.text = [self.totalTransferAndSize stringValue];
	
	self.willUsedUtxosMoneyTextField.text = [self.willUsedUtxosMoney stringValue];
	self.willUsedUtxoCountTextField.text = [NSString stringWithFormat:@"%ld", (long)self.willUsedUtxoCount];
}

- (void)initAllUtxoModels {
	self.totalMoney = [NSDecimalNumber zeroNumber];
	
	self.allUtxoModels = [NSMutableArray new];
	NSArray *utxoDatas = @[@{@"money" : @"1.1",
													 @"size" : @"0.2"
													 },
												 @{@"money" : @"1.2",
													 @"size" : @"0.4"
													 },
												 @{@"money" : @"2.8",
													 @"size" : @"0.2"
													 },
												 @{@"money" : @"2.1",
													 @"size" : @"0.5"
													 },
												 @{@"money" : @"3",
													 @"size" : @"0.2"
													 },
												 @{@"money" : @"4.8",
													 @"size" : @"0.7"
													 },
												 @{@"money" : @"5",
													 @"size" : @"0.8"
													 }
												 ];
	
	for (NSDictionary *utxoData in utxoDatas) {
		BHUTXOModel *utxoModel = [BHUTXOModel utxoModelWithData:utxoData];
		self.totalMoney = [self.totalMoney addingWithDecimal:utxoModel.money];
		
		[self.allUtxoModels addObject:utxoModel];
	}
}

#pragma mark - Touches Responder

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[self.view endEditing:YES];
}

@end
