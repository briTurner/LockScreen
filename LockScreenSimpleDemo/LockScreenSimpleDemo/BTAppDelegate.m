//
//  BTAppDelegate.m
//  LockScreenSimpleDemo
//
//  Created by Brian Turner on 5/4/13.
//  Copyright (c) 2013 Turning Development. All rights reserved.
//

#import "BTAppDelegate.h"
#import "BTHomeViewController.h"

@implementation BTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    BTHomeViewController *vc = [[BTHomeViewController alloc] initWithNibName:nil bundle:nil];
    [[self window] setRootViewController:vc];
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
