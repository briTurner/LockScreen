//
//  LSAppDelegate.m
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import "LSAppDelegate.h"


@implementation LSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];


    [self.window makeKeyAndVisible];
    return YES;
}

@end
