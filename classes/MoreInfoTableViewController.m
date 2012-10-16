//
//  MoreInfoTableViewController.m
//  BBB
//
//  Created by Jie Zhao on 5/19/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import "MoreInfoTableViewController.h"
#import "WebViewController.h"
#import "CustomerServiceViewController.h"


@implementation MoreInfoTableViewController

@synthesize arrayExternalLinks = _arrayExternalLinks;
@synthesize arrayContactInfo = _arrayContactInfo;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.title = @"Ride Blue, Go Green";
    self.arrayContactInfo = [[NSArray alloc] initWithObjects:@"BBB Customer Service", nil];
    self.arrayExternalLinks = [[NSArray alloc] initWithObjects:@"Big Blue Bus homepage",@"Fares & Pass",@"BBB Routes on Google Map", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return 1;
    else if (section == 1)
        return [self.arrayExternalLinks count];
    else
        return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0)
        return @"Contact Information";
    else 
        return @"External links";
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    if (section == 0)
        return @"";
    else if (section == 1)
        return @"Thank you for purchasing Big Blue Bus Schedule. This app was developed as a volunteer effort to provide a free service for BBB riders. The developer has no affiliation with Big Blue Bus. ";
    else
        return @"";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = [self.arrayContactInfo objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = [self.arrayExternalLinks objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0)
    {
        CustomerServiceViewController *customerServiceController = [[CustomerServiceViewController alloc] init];
        [self.navigationController pushViewController:customerServiceController animated:YES];
        [customerServiceController release];
    }
    else if (indexPath.section == 1)
    {
        WebViewController *webViewController = [[WebViewController alloc] init];
        webViewController.hidesBottomBarWhenPushed = YES;
        switch (indexPath.row) {
            case 0:
                webViewController.stringURL = @"http://www.bigbluebus.com";
                break;
            case 1:
                webViewController.stringURL = @"http://www.bigbluebus.com/fares/New-Fares.pdf";
                break;
            case 2:
                webViewController.stringURL = @"http://maps.google.com/maps/ms?ie=UTF8&hl=en&msa=0&msid=114786430104940626993.0004387cf4abfe3471976&z=11"; 
                break;
            default:
                break;
        }
        
        [self.navigationController pushViewController:webViewController animated:YES];
        [webViewController release];
    }
}

- (void)dealloc {
    [_arrayContactInfo release];
    [_arrayExternalLinks release];
    [super dealloc];
}

@end
