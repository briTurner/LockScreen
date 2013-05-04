//
//  BTHomeViewController.m
//  LockScreenSimpleDemo
//
//  Created by Brian Turner on 5/4/13.
//  Copyright (c) 2013 Turning Development. All rights reserved.
//

#import "BTHomeViewController.h"


@interface BTHomeViewController () {
    LSPassword *_masterPassword;
    __weak IBOutlet UIButton *lockScreenButton;
    
}
- (IBAction)setPasswordButtonPressed:(id)sender;
- (IBAction)launchLockScreenButtonPressed:(id)sender;

@end

@implementation BTHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (![[_masterPassword passwordCharacters] count] > 0) {
        [lockScreenButton setEnabled:NO];
    }
}

- (IBAction)setPasswordButtonPressed:(id)sender {
    LSPasswordPickerViewController *vc = [[LSPasswordPickerViewController alloc] initWithPassword:_masterPassword];
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)launchLockScreenButtonPressed:(id)sender {
    LSLockScreenViewController *vc = [[LSLockScreenViewController alloc] initWithMasterPassword:_masterPassword failureBlock:^{
        
    } successBlock:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - LSPasswordPickerViewController

- (void)passwordPickerViewController:(LSPasswordPickerViewController *)passwordPicker returnedWithPassword:(LSPassword *)password {
    _masterPassword = password;
    if ([[_masterPassword passwordCharacters] count] > 0) {
        [lockScreenButton setEnabled:YES];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
