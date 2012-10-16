//
//  WebViewController.m
//  BBB
//
//  Created by Jie Zhao on 5/22/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

@synthesize webView = _webView;
@synthesize activityIndicator = _activityIndicator;
@synthesize stringURL = _stringURL;

#pragma mark - View lifecycle

-(void)loadView {
    UIView *contentView = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	self.view = contentView;	
    
	CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
	webFrame.origin.y = 0.0f;
	self.webView = [[UIWebView alloc] initWithFrame:webFrame];
	self.webView.backgroundColor = [UIColor blueColor];
	self.webView.scalesPageToFit = YES;
	self.webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	self.webView.delegate = self;
	[self.view addSubview: self.webView];
	[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.stringURL]]];
    
	self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	self.activityIndicator.frame = CGRectMake(0.0, 0.0, 30.0, 30.0);
	self.activityIndicator.center = self.view.center;
	[self.view addSubview: self.activityIndicator];
}

- (void)viewDidUnload {
    [self.webView stopLoading];
    self.webView = nil;
    self.activityIndicator = nil;
    
    [super viewDidUnload];
}


#pragma mark WEBVIEW Methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// starting the load, show the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	// finished loading, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[self.activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	// load error, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
	// report the error inside the webview
	NSString* errorString = [NSString stringWithFormat:
							 @"<html><center><br /><br /><font size=+5 color='red'>Error<br /><br />Your request %@</font></center></html>",
							 error.localizedDescription];
	[self.webView loadHTMLString:errorString baseURL:nil];
}

- (void)dealloc {
    self.webView.delegate = nil;
    [_webView release];
    [_activityIndicator release];
    [_stringURL release];
    
    [super dealloc];
}

@end
