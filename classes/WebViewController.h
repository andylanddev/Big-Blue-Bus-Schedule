//
//  WebViewController.h
//  BBB
//
//  Created by Jie Zhao on 5/22/11.
//  Copyright 2011 Zeiga. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, copy) NSString *stringURL;

@end
