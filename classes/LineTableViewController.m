//
//  LineTableViewController.m
//  BBB
//
//  Created by Jie Zhao on 5/17/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import "LineTableViewController.h"


@implementation LineTableViewController

@synthesize arrayLines = _arrayLines;
@synthesize delegate = _delegate;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayLines count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [self.arrayLines objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate didReceiveLineSelection:[self.arrayLines objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [_arrayLines release];
    [super dealloc];
}

@end
