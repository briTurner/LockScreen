//
//  LSPasswordPickerCell.h
//  LockScreen
//
//  Created by Brian Turner on 5/3/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSPasswordCharacter.h"

typedef enum {
    LSPasswordPickerCellAttributeColor,
    LSPasswordPickerCellAttributeSize,
    LSPasswordPickerCellAttributeShape,
}LSPasswordPickerCellAttribute;


@interface LSPasswordPickerCell : UITableViewCell

@property (nonatomic) LSPasswordCharacterColor color;
@property (nonatomic) LSPasswordCharacterShape shape;
@property (nonatomic) LSPasswordCharacterSize size;

@property (nonatomic, copy) void(^buttonSelectionBlock)(LSPasswordPickerCell *cell, LSPasswordPickerCellAttribute attribute);

- (IBAction)buttonPressed:(id)sender;

@end