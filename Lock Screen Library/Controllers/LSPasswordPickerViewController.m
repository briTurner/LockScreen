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
    LSPasswordPickerCellAttribute _attribute;
    NSIndexPath *_indexPathForCell;
    
    IBOutlet UIView *_headerView;
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
    [[self tableView] setTableHeaderView:_headerView];
}

- (IBAction)addButtonPressed:(id)sender {
    [[self tableView] beginUpdates];
    [[self tableView] insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[[_password passwordCharacters] count] inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    [_password addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorNone size:LSPasswordCharacterSizeNone shape:LSPasswordCharacterShapeNone]];
    [[self tableView] endUpdates];
}

- (IBAction)doneButtonPressed:(id)sender {
    [[self delegate] passwordPickerViewController:self returnedWithPassword:_password];
}


- (void)presentActionSheetForAttribute:(LSPasswordPickerCellAttribute)attribute forCellAtIndexPath:(NSIndexPath *)indexPath {
    _indexPathForCell = indexPath;
    _attribute = attribute;
    switch (attribute) {
        case LSPasswordPickerCellAttributeColor: {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Attribute" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"No Color", @"Red", @"Green", @"Blue", nil];
            [actionSheet showInView:[self view]];
            break;
        }
        case LSPasswordPickerCellAttributeShape: {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Attribute" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"No Shape", @"Circle", @"Triangle", @"Square", nil];
            [actionSheet showInView:[self view]];
            break;
        }
        case LSPasswordPickerCellAttributeSize: {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Attribute" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"No Size", @"Small", @"Medium", @"Large", nil];
            [actionSheet showInView:[self view]];
            break;
        }
        default:
            break;
    }
}

#pragma mark - TableView Datasource/Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = [[_password passwordCharacters] count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSPasswordPickerCell *cell = (LSPasswordPickerCell *)[tableView dequeueReusableCellWithIdentifier:LSPasswordPickerCellID];
    LSPasswordCharacter *character = [[_password passwordCharacters] objectAtIndex:[indexPath row]];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setButtonSelectionBlock:^(LSPasswordPickerCell *cell, LSPasswordPickerCellAttribute attribute) {
        [self presentActionSheetForAttribute:attribute forCellAtIndexPath:[tableView indexPathForCell:cell]];
    }];
    [[cell orderLabel] setText:[NSString stringWithFormat:@"%i", [indexPath row]]];
    [cell setColor:[character color]];
    [cell setSize:[character size]];
    [cell setShape:[character shape]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}


#pragma mark - Action Sheet Delegate Methods 

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    LSPasswordCharacter *character = [[_password passwordCharacters] objectAtIndex:[_indexPathForCell row]];
    switch (_attribute) {
        case LSPasswordPickerCellAttributeSize:
            [character setSize:(LSPasswordCharacterSize)buttonIndex];
            break;
        case LSPasswordPickerCellAttributeShape:
            [character setShape:(LSPasswordCharacterShape)buttonIndex];
            break;
        case LSPasswordPickerCellAttributeColor:
            [character setColor:(LSPasswordCharacterColor)buttonIndex];
            break;
        default:
            break;
    }
    [[self tableView] reloadRowsAtIndexPaths:@[_indexPathForCell] withRowAnimation:UITableViewRowAnimationNone];
}


@end
