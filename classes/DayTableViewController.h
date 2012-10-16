//
//  DayTableViewController.h
//  BBB
//
//  Created by Jie Zhao on 5/17/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTableViewController.h"

@protocol MainTableDelegate;

@interface DayTableViewController : UITableViewController

@property (nonatomic, retain) NSArray *arrayDay;
@property (nonatomic, assign) id<MainTableDelegate> delegate;

@end
