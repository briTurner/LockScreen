//
//  LSTestScreenViewController.m
//  LockScreen
//
//  Created by Brian Turner on 4/17/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSLockScreenViewController.h"
#import "LSPasswordCharacter.h"
#import "LSImageFactory.h"
#import "LSDropZoneView.h"
#import "LSPassword.h"
#import "LSUtils.h"

#import <QuartzCore/QuartzCore.h>

@interface LSLockScreenViewController () {
    NSArray *_passwordCharacters;
    NSMutableArray *_buttons;
    
    LSPassword *_enteredPassword;
    
    IBOutlet LSDropZoneView *_dropZoneView;
}

@end

@implementation LSLockScreenViewController

- (id)initWithMasterPassword:(LSPassword *)mPassword failureBlock:(void (^)(void))fBlock successBlock:(void (^)(void))sBlock {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _masterPassword = mPassword;
        _successBlock = sBlock;
        _failureBlock = fBlock;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"either use initWithMasterPassword:failureBlock:successBlock: or ensure to set the coresponding properties");
    return [self initWithMasterPassword:nil failureBlock:nil successBlock:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self generatePasswordButtons];
}

- (void)generatePasswordButtons {
    _buttons = [NSMutableArray array];
    _passwordCharacters = [LSUtils passwordCharactersToMeetMasterPassword:_masterPassword count:9];
    int index = 0;
    for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 3; x++) {
            LSPasswordCharacter *passwordChar = [_passwordCharacters objectAtIndex:index];
            UIImage *image = [passwordChar imageForPasswordCharacter];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:image forState:UIControlStateNormal];
            [button setFrame:CGRectMake(10 + 100 * x, 100 * y, 100, 100)];
            [button setTag:index];
            [button addTarget:self action:@selector(passwordButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [[self view] addSubview:button];
            [[self view] sendSubviewToBack:button];
            [_buttons addObject:button];
            index++;
        }
    }
}

- (void)clearScreen {
    for (UIButton *button in _buttons) {
        [button removeFromSuperview];
    }
}

- (IBAction)backspaceButtonPressed:(id)sender {
    [_dropZoneView removeLastCharacter];
    [_enteredPassword removeLastPasswordCharacter];
}

- (IBAction)enterButtonPressed:(id)sender {
    [self checkPasswordMatch];
}


- (void)checkPasswordMatch {
    if ([_enteredPassword meetsRequirmentsOfPassword:_masterPassword]) {
        if ([self successBlock])
            [self successBlock]();
    } else {
        [self clearScreen];
        [self generatePasswordButtons];
        if ([self failureBlock])
            [self failureBlock]();
    }
    _enteredPassword = nil;
    [_dropZoneView removeAllCharacters];
}

- (void)passwordButtonPressed:(id)sender {
    int index = [sender tag];
    LSPasswordCharacter *passwordChar = [_passwordCharacters objectAtIndex:index];
    
    if (!_enteredPassword)
        _enteredPassword = [[LSPassword alloc] init];
    
    [_enteredPassword addPasswordCharacter:passwordChar];
    [_dropZoneView addCharacter:passwordChar fromRect:[[self view] convertRect:[sender frame] toView:_dropZoneView]];
}


@end
