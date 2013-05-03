//
//  LSPasswordPickerCell.m
//  LockScreen
//
//  Created by Brian Turner on 5/3/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSPasswordPickerCell.h"


@interface LSPasswordPickerCell () {
    LSPasswordPickerCellAttribute _currentAttribute;
}

@end

@implementation LSPasswordPickerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (IBAction)buttonPressed:(id)sender {
    [self buttonSelectionBlock](self, [sender tag]);
}


@end
