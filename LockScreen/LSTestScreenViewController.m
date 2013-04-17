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

@interface LSTestScreenViewController ()

@end

@implementation LSTestScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    LSPasswordCharacter *passwordChar = [[LSPasswordCharacter alloc] initWithCharacterAttributes:(LSPasswordCharacterAttributeSizeLarge)];
    
    UIImage *image = [LSImageFactory imageForPasswordCharacter:passwordChar];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(0, 0, 100, 100)];
    
    [[self view] addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
