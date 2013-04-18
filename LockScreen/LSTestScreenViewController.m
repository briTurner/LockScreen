//
//  LSTestScreenViewController.m
//  LockScreen
//
//  Created by Brian Turner on 4/17/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSTestScreenViewController.h"
#import "LSPasswordCharacter.h"
#import "LSImageFactory.h"
#import "LSDropZoneView.h"
#import "LSPassword.h"
#import "LSUtils.h"

#import <QuartzCore/QuartzCore.h>

@interface LSTestScreenViewController () {
    NSArray *_passwordCharacters;
    LSPassword *_masterPassword;
    LSPassword *_enteredPassword;
    LSDropZoneView *dropZoneView;
}

@end

@implementation LSTestScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _masterPassword = [[LSPassword alloc] init];
        [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorBlue
                                                                                          size:LSPasswordCharacterSizeSmall
                                                                                         shape:LSPasswordCharacterShapeTriangle]];
        
        [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorBlue
                                                                                          size:LSPasswordCharacterSizeMedium
                                                                                         shape:LSPasswordCharacterShapeTriangle]];
        
        [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorGreen
                                                                                          size:LSPasswordCharacterSizeSmall
                                                                                         shape:LSPasswordCharacterShapeTriangle]];
        
        [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorGreen
                                                                                          size:LSPasswordCharacterSizeMedium
                                                                                         shape:LSPasswordCharacterShapeTriangle]];
        
        _passwordCharacters = [LSUtils passwordCharactersToMeetMasterPassword:_masterPassword count:9];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int index = 0;
    for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 3; x++) {
            LSPasswordCharacter *passwordChar = [_passwordCharacters objectAtIndex:index];
            UIImage *image = [passwordChar imageForPasswordCharacter];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:image forState:UIControlStateNormal];
            [button setFrame:CGRectMake(100 * x, 100 * y, 100, 100)];
            [button setTag:index];
            [button addTarget:self action:@selector(passwordButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [[self view] addSubview:button];
            index++;
        }
    }
    
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clearButton setTitle:@"Backspace" forState:UIControlStateNormal];
    [clearButton setFrame:CGRectMake(20, 330, 135, 22)];
    [clearButton addTarget:self action:@selector(clearButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:clearButton];
    
    UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [enterButton setTitle:@"Enter" forState:UIControlStateNormal];
    [enterButton setFrame:CGRectMake(165, 330, 135, 22)];
    [enterButton addTarget:self action:@selector(enterButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:enterButton];
    
    dropZoneView = [[LSDropZoneView alloc] initWithFrame:CGRectMake(0, 360, 320, 100)];
    [dropZoneView setBackgroundColor:[UIColor grayColor]];
    [[self view] addSubview:dropZoneView];
}

- (void)clearButtonPressed:(id)sender {
    [dropZoneView removeLastCharacter];
    [_enteredPassword removeLastPasswordCharacter];
}

- (void)enterButtonPressed:(id)sender {
    [self checkPasswordMatch];
}


- (void)checkPasswordMatch {
    if ([_enteredPassword meetsRequirmentsOfPassword:_masterPassword]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UNLOCKED!" message:@"YOU FIGURED OUT THE PASSWORD" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        _enteredPassword = nil;
        [dropZoneView removeAllCharacters];
    }
}
- (void)passwordButtonPressed:(id)sender {
    int index = [sender tag];
    LSPasswordCharacter *passwordChar = [_passwordCharacters objectAtIndex:index];
    
    if (!_enteredPassword)
        _enteredPassword = [[LSPassword alloc] init];
    
    [_enteredPassword addPasswordCharacter:passwordChar];
    
    [dropZoneView addCharacter:passwordChar];
}

//- (void)animateImage:(UIImage *)image fromFrame:(CGRect)frame {
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    [imageView setFrame:frame];
//    [[self view] addSubview:imageView];
//
//    [UIView animateWithDuration:1.0 animations:^{
//        [imageView setFrame:CGRectMake(150, 450, 100, 100)];
//    } completion:^(BOOL finished) {
//
//    }];
//}


@end
