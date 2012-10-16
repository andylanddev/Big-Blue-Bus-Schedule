//
//  EndStationTableViewController.m
//  BBB
//
//  Created by Jie Zhao on 5/17/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import "EndStationTableViewController.h"


@implementation EndStationTableViewController

@synthesize arrayEndStations = _arrayEndStations;
@synthesize delegate = _delegate;
@synthesize isStartStation = _isStartStation;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.isStartStation)
        self.title = @"Bus From";
    else
        self.title = @"Bus To";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayEndStations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [self.arrayEndStations objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    int selected = indexPath.row;
    int other = (selected == 0)? 1: 0;
    
    UITableViewCell *cell_selected = [[self tableView] cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selected inSection:0]];
    UITableViewCell *cell_other = [[self tableView] cellForRowAtIndexPath:[NSIndexPath indexPathForRow:other inSection:0]];
    NSString *stringSelected = cell_selected.textLabel.text;
    NSString *stringOther = cell_other.textLabel.text;

    if (self.isStartStation)
        [self.delegate didReceiveFromSelection:stringSelected withUpdate:stringOther];
    else
        [self.delegate didReceiveToSelection:stringSelected withUpdate:stringOther];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [_arrayEndStations release];
    [super dealloc];
}

@end
