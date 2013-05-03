//
//  LSPasswordPickerViewController.m
//  LockScreen
//
//  Created by Brian Turner on 5/3/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSPasswordPickerViewController.h"
#import "LSPasswordPickerCell.h"
#import "LSPassword.h"

NSString * const LSPasswordPickerCellID = @"LSPasswordPickerCellID";

@interface LSPasswordPickerViewController () {
    LSPassword *_password;
}

@end

@implementation LSPasswordPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self initWithPassword:nil];
}

- (id)initWithPassword:(LSPassword *)password {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _password = password ? password : [[LSPassword alloc] init];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [[self tableView] registerNib:[UINib nibWithNibName:@"LSPasswordPickerCell" bundle:nil] forCellReuseIdentifier:LSPasswordPickerCellID];
}

- (IBAction)addButtonPressed:(id)sender {
    [[self tableView] beginUpdates];
    [[self tableView] insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[[_password passwordCharacters] count] inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
        [_password addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorNone size:LSPasswordCharacterSizeNone shape:LSPasswordCharacterShapeNone]];
    [[self tableView] endUpdates];
}


- (void)presentActionSheetForAttribute:(LSPasswordPickerCellAttribute)attribute forCellAtIndexPath:(NSIndexPath *)indexPath {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Attribute" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"sometihng", @"something else", nil];
    [actionSheet showInView:[self view]];
}

#pragma mark - TableView Datasource/Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = [[_password passwordCharacters] count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSPasswordPickerCell *cell = (LSPasswordPickerCell *)[tableView dequeueReusableCellWithIdentifier:LSPasswordPickerCellID];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setButtonSelectionBlock:^(LSPasswordPickerCell *cell, LSPasswordPickerCellAttribute attribute) {
        [self presentActionSheetForAttribute:attribute forCellAtIndexPath:[tableView indexPathForCell:cell]];
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}



@end
