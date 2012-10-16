//
//  StopsListTableViewController.m
//  BBB
//
//  Created by Jie Zhao on 5/15/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import "StopsListTableViewController.h"
#import <sqlite3.h>

NSString *g_stringAllStops = @"";

static int MyCallback(void *context, int count, char **values, char **columns)
{
    for (int i=0; i < count; i++) {
        const char *str = values[i];
        g_stringAllStops = [NSString stringWithUTF8String:str];
    }
    return SQLITE_OK;
}

@implementation StopsListTableViewController

@synthesize stringShiftId = _stringShiftId;
@synthesize arrayAllStops = _arrayAllStops;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *query = [NSString stringWithFormat:@"SELECT all_stops FROM bus_shift_table where shift_id=%@",self.stringShiftId];
    NSString *file = [[NSBundle mainBundle] pathForResource:@"bbb_schedule_db" ofType:@"sqlite"];
    sqlite3 *database = NULL;
    if (sqlite3_open([file UTF8String], &database) == SQLITE_OK) {
        sqlite3_exec(database, [query UTF8String], MyCallback, NULL, NULL);
    }
    sqlite3_close(database);

    self.arrayAllStops = [[NSArray alloc] initWithArray:[g_stringAllStops componentsSeparatedByString:@";"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayAllStops count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [self.arrayAllStops objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dealloc {
    [_arrayAllStops release];
    [_stringShiftId release];
    [super dealloc];
}

@end
