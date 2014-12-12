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
    [self setTitle:@"导航栏标题"];
    
    _titlesArray = [NSArray arrayWithObjects:@"标题一",@"标题二",@"标题三", nil];
    
    [self createSegmented];
    [self createScrollV];
}

-(void)createSegmented
{
    _segmentedBG = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 44)];
    [_segmentedBG setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_segmentedBG];
    
    _segmented = [[UISegmentedControl alloc] initWithItems:_titlesArray];
    [_segmented setFrame:CGRectMake(0, 0, _segmentedBG.frame.size.width, _segmentedBG.frame.size.height)];
    [_segmented setSelectedSegmentIndex:0];
    [_segmented addTarget:self action:@selector(segmentedClick:) forControlEvents:UIControlEventValueChanged];
    [_segmentedBG addSubview:_segmented];
}

-(void)createScrollV
{
    _scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _segmentedBG.frame.size.height + _segmentedBG.frame.origin.y, SCREEN_WIDTH, SCREEN_HEIGHT-_segmentedBG.frame.size.height)];
    [_scrollV setContentSize:CGSizeMake(_scrollV.frame.size.width*_titlesArray.count, _scrollV.frame.size.height)];
    [_scrollV setBackgroundColor:[UIColor redColor]];
    [_scrollV setDirectionalLockEnabled:YES];
    [_scrollV setPagingEnabled:YES];
    [_scrollV setShowsHorizontalScrollIndicator:NO];
    [_scrollV setShowsVerticalScrollIndicator:NO];
    [_scrollV setDelegate:self];
    [self.view addSubview:_scrollV];
    
    for (int i=1; i<=[_titlesArray count]; i++) {
        _tableV = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*(i-1), 0, _scrollV.frame.size.width, _scrollV.frame.size.height) style:UITableViewStylePlain];
        [_tableV setDelegate:self];
        [_tableV setDataSource:self];
        [_scrollV addSubview:_tableV];
    }
}

-(void)segmentedClick:(UISegmentedControl *)segmented
{
    [_scrollV setContentOffset:CGPointMake(SCREEN_WIDTH*segmented.selectedSegmentIndex, 0) animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _segmented.selectedSegmentIndex = (scrollView.contentOffset.x + SCREEN_WIDTH/_titlesArray.count)/SCREEN_WIDTH;
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cellname";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    [cell.textLabel setText:@"jcasdfadsf"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
