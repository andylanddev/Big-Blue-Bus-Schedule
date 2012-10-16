//
//  CustomerServiceViewController.m
//  BBB
//
//  Created by Jie Zhao on 5/22/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import "CustomerServiceViewController.h"


@implementation CustomerServiceViewController

@synthesize customerTextView = _customerTextView;
@synthesize adminInfoTextView = _adminInfoTextView;
@synthesize phoneTextView = _phoneTextView;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customerTextView.editable = NO;
    self.customerTextView.dataDetectorTypes = UIDataDetectorTypeAll;
    self.adminInfoTextView.editable = NO;
    self.adminInfoTextView.dataDetectorTypes = UIDataDetectorTypeAll;
}

- (void)viewDidUnload {
    self.customerTextView = nil;
    self.adminInfoTextView = nil;
    self.phoneTextView = nil;
    
    [super viewDidUnload];
}

- (void)dealloc {
    [_customerTextView release];
    [_adminInfoTextView release];
    [_phoneTextView release];
    [super dealloc];
}

@end
