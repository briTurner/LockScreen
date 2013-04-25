//
//  LSAppDelegate.m
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import "LSAppDelegate.h"
#import "LSLockScreenViewController.h"
#import "LSPassword.h"
#import "LSPasswordCharacter.h"

@implementation LSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    LSPassword *_masterPassword = [[LSPassword alloc] init];
    [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorNone
                                                                                      size:LSPasswordCharacterSizeSmall
                                                                                     shape:LSPasswordCharacterShapeNone]];
    
    [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorBlue
                                                                                      size:LSPasswordCharacterSizeNone
                                                                                     shape:LSPasswordCharacterShapeNone]];
    
    [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorNone
                                                                                      size:LSPasswordCharacterSizeNone
                                                                                     shape:LSPasswordCharacterShapeTriangle]];
    
    [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorGreen
                                                                                      size:LSPasswordCharacterSizeMedium
                                                                                     shape:LSPasswordCharacterShapeTriangle]];
    
    LSLockScreenViewController *vc = [[LSLockScreenViewController alloc] initWithMasterPassword:_masterPassword failureBlock:^{
        NSLog(@"failed to login");
    } successBlock:^{
        [[[UIAlertView alloc] initWithTitle:@"SUCCESS" message:@"You logged in successfully" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }];
    [[self window] setRootViewController:vc];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
