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
    __weak IBOutlet UIButton *_colorButton;
    __weak IBOutlet UIButton *_sizeButton;
    __weak IBOutlet UIButton *_shapeButton;
    
    UIImage *_sizeImageSmall;
    UIImage *_sizeImageMedium;
    UIImage *_sizeImageLarge;
    
    UIImage *_shapeImageCircle;
    UIImage *_shapeImageSquare;
    UIImage *_shapeImageTriangle;
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

- (void)setColor:(LSPasswordCharacterColor)color {
    _color = color;
    switch (_color) {
        case LSPasswordCharacterColorNone:
            [_colorButton setBackgroundColor:[UIColor clearColor]];
            break;
        case LSPasswordCharacterColorBlue:
            [_colorButton setBackgroundColor:[UIColor blueColor]];
            break;
        case LSPasswordCharacterColorGreen:
            [_colorButton setBackgroundColor:[UIColor greenColor]];
            break;
        case LSPasswordCharacterColorRed:
            [_colorButton setBackgroundColor:[UIColor redColor]];
            break;
        default:
            break;
    }
}

- (IBAction)buttonPressed:(id)sender {
    [self buttonSelectionBlock](self, [sender tag]);
}


@end
