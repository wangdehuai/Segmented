//
//  RootViewController.m
//  Segmented
//
//  Created by wangdehuai on 14/12/12.
//  Copyright (c) 2014年 wangdehuai. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSegmented];
}

-(void)createSegmented
{
    _segmented = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"标题一",@"标题二",@"标题三", nil]];
    [_segmented setFrame:CGRectMake(0, 44, SCREEN_WIDTH, 44)];
    [self.navigationController.navigationBar addSubview:_segmented];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
