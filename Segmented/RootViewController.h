//
//  RootViewController.h
//  Segmented
//
//  Created by wangdehuai on 14/12/12.
//  Copyright (c) 2014年 wangdehuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property(nonatomic,retain)UIView *segmentedBG;
@property(nonatomic,retain)UISegmentedControl *segmented;
@property(nonatomic,retain)NSArray *titlesArray;
@property(nonatomic,retain)UIScrollView *scrollV;
@property(nonatomic,retain)UITableView *tableV;

@end
