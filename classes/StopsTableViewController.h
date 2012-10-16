//
//  StopsTableViewController.h
//  BBB
//
//  Created by Jie Zhao on 5/11/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StopsTableViewController : UITableViewController

@property (nonatomic, copy) NSString *stringShiftId;
@property (nonatomic, copy) NSString *stringDay;
@property (nonatomic, copy) NSString *stringLine;
@property (nonatomic, retain) NSMutableArray *arrayStops;

-(IBAction) moreAction:(id)sender;

@end
