//
//  StopsListTableViewController.h
//  BBB
//
//  Created by Jie Zhao on 5/17/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StopsListTableViewController : UITableViewController

@property (nonatomic, copy) NSString *stringShiftId;
@property (nonatomic, retain) NSArray *arrayAllStops;

@end
