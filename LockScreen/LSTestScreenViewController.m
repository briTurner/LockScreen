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
#import "LSPassword.h"
#import "LSUtils.h"
@interface LSTestScreenViewController () {
    NSArray *_passwordCharacters;
    LSPassword *_masterPassword;
    LSPassword *_enteredPassword;
}

@end

@implementation LSTestScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _masterPassword = [[LSPassword alloc] init];
        [_masterPassword addPasswordCharacter:[[LSPasswordCharacter alloc] initWithCharacterAttributes:(LSPasswordCharacterAttributeColorBlue)]];
        [_masterPassword addPasswordCharacter:[[LSPasswordCharacter alloc] initWithCharacterAttributes:(LSPasswordCharacterAttributeColorBlue | LSPasswordCharacterAttributeShapeCircle)]];
        [_masterPassword addPasswordCharacter:[[LSPasswordCharacter alloc] initWithCharacterAttributes:(LSPasswordCharacterAttributeSizeLarge)]];
        
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
            UIImage *image = [LSImageFactory imageForPasswordCharacter:passwordChar];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:image forState:UIControlStateNormal];
            [button setFrame:CGRectMake(100 * x, 100 * y, 100, 100)];
            [button setTag:index];
            [button addTarget:self action:@selector(passwordButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [[self view] addSubview:button];
            index++;
        }
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Clear" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(20, 320, 150, 44)];
    [button addTarget:self action:@selector(clearButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:button];
}

- (void)clearButtonPressed:(id)sender {
    _enteredPassword = nil;
    
}

- (void)passwordButtonPressed:(id)sender {
    int index = [sender tag];
    LSPasswordCharacter *passwordChar = [_passwordCharacters objectAtIndex:index];
    
    if (!_enteredPassword)
        _enteredPassword = [[LSPassword alloc] init];
    
    [_enteredPassword addPasswordCharacter:passwordChar];
    
    if ([_enteredPassword meetsRequirmentsOfPassword:_masterPassword]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UNLOCKED!" message:@"YOU FIGUREDO UT THE PASSWORD" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        _enteredPassword = nil;
    }
}


@end
