

#import "AppDelegate.h"
#import "SearchTableViewController.h"

@interface AppDelegate()

@property (nonatomic, retain) UITabBarController *tabBarController;

@end

@implementation AppDelegate;

@synthesize window;
@synthesize navSearch;
@synthesize navMore;
@synthesize tabBarController;

- (void)dealloc
{
    [navSearch release];
    [navMore release];
    [tabBarController release];
	[window release];
	
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // create window and set up table view controller
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];

    self.navSearch = [[[UINavigationController alloc] init] autorelease];
    UITabBarItem *itemSearch = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
    self.navSearch.tabBarItem = itemSearch;
    [itemSearch release];

    self.navMore = [[[UINavigationController alloc] init] autorelease];
    UITabBarItem *itemMore = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
    self.navMore.tabBarItem = itemMore;
    [itemMore release];
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navSearch, navMore, nil];

    SearchTableViewController *routeViewController = [[[SearchTableViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
    routeViewController.title = @"Big Blue Bus";
    [self.navSearch pushViewController:routeViewController animated:NO];

    MoreInfoTableViewController *moreInfoController = [[MoreInfoTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navMore pushViewController:moreInfoController animated:NO];

    [moreInfoController release];
    [self.window setRootViewController:self.tabBarController];
	[self.window addSubview:tabBarController.view];
	[self.window makeKeyAndVisible];
}

@end
