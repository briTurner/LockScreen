//
//  LSHomeViewController.m
//  LockScreen
//
//  Created by Brian Turner on 5/3/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSHomeViewController.h"
#import "LSLockScreenViewController.h"
#import "LSPassword.h"

@interface LSHomeViewController () {
    LSPassword *_masterPassword;
}
- (IBAction)setPasswordButtonPressed:(id)sender;
- (IBAction)testLockScreenButtonPressed:(id)sender;

@end

@implementation LSHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}



- (IBAction)setPasswordButtonPressed:(id)sender {
    LSPasswordPickerViewController *vc = [[LSPasswordPickerViewController alloc] initWithPassword:_masterPassword];
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

- (IBAction)testLockScreenButtonPressed:(id)sender {
    
    LSLockScreenViewController *vc = [[LSLockScreenViewController alloc] initWithMasterPassword:_masterPassword failureBlock:^{
        NSLog(@"failed to login");
    } successBlock:^{
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}


#pragma mark LSPasswordPickerViewControllerDelegate Methods

- (void)passwordPickerViewController:(LSPasswordPickerViewController *)passwordPicker returnedWithPassword:(LSPassword *)password {
    NSLog(@"returned");
}
@end
