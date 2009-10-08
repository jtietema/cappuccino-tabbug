/*
 * AppController.j
 * tabbug
 *
 * Created by You on October 8, 2009.
 * Copyright 2009, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPTabView tabView;
    CPTabViewItem tabItem;
    CPTabViewItem secondtabItem;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    tabView = [[CPTabView alloc] initWithFrame:[contentView bounds]];
        
    tabItem = [[CPTabViewItem alloc] initWithIdentifier:@"1"];
    [tabItem setLabel:@"First tab"];
    [tabItem setView:[[CPView alloc] initWithFrame:[tabView contentRect]]];
    [tabView addTabViewItem:tabItem];
    
    secondtabItem = [[CPTabViewItem alloc] initWithIdentifier:@"1"];
    [secondtabItem setLabel:@"Second tab"];
    [secondtabItem setView:[[CPView alloc] initWithFrame:[tabView contentRect]]];
    [tabView addTabViewItem:secondtabItem];
    
    var timer = [CPTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(removeTab) userInfo:nil repeats:NO];
    
    [contentView addSubview:tabView];

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

- (void)removeTab
{
    [tabView removeTabViewItem:secondtabItem];
}

@end
