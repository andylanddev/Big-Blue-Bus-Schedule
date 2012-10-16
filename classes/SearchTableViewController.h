//
//  RouteSearchTableViewController.h
//  BBB
//
//  Created by Jie Zhao on 5/17/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainTableDelegate
- (void)didReceiveLineSelection:(NSString *)line;
- (void)didReceiveDaySelection:(NSString *)day;
- (void)didReceiveFromSelection:(NSString *)from withUpdate:(NSString *)to;
- (void)didReceiveToSelection:(NSString *)to withUpdate:(NSString *)from;
@end


@interface SearchTableViewController : UITableViewController <MainTableDelegate>

@property (nonatomic, retain) UIButton *searchButton;

@property (nonatomic, retain) NSArray *arrayBusRoutes; 
@property (nonatomic, retain) NSArray *arrayBusStops;
@property (nonatomic, retain) NSArray *arrayDate;
@property (nonatomic, retain) NSMutableArray *arrayLines;
@property (nonatomic, retain) NSMutableArray *arrayDirection;

@property (nonatomic, copy) NSString *stringLine;
@property (nonatomic, copy) NSString *stringFrom;
@property (nonatomic, copy) NSString *stringTo;
@property (nonatomic, copy) NSString *stringDay;

-(IBAction) searchAction:(id)sender;

@end




