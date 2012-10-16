//
//  EndStationTableViewController.h
//  BBB
//
//  Created by Jie Zhao on 5/17/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTableViewController.h"

@protocol MainTableDelegate;

@interface EndStationTableViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *arrayEndStations;
@property (nonatomic, assign) id<MainTableDelegate> delegate;
@property (nonatomic, assign) BOOL isStartStation;

@end
