//
//  DayTableViewController.m
//  BBB
//
//  Created by Jie Zhao on 5/17/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import "DayTableViewController.h"


@implementation DayTableViewController

@synthesize arrayDay = _arrayDay;
@synthesize delegate = _delegate;

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayDay count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [self.arrayDay objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [[self tableView] cellForRowAtIndexPath:indexPath];
    [self.delegate didReceiveDaySelection:cell.textLabel.text];
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"Sunday schedules are operated on the following holidays: New Year's Day, Memorial Day, Independence Day, Labor Day, Thanksgiving Day, Christmas Day.";
}

- (void)dealloc {
    [_arrayDay release];
    [super dealloc];
}

@end
