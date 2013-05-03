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
    
    UIImage *_sizeImageNone;
    UIImage *_sizeImageSmall;
    UIImage *_sizeImageMedium;
    UIImage *_sizeImageLarge;
    
    UIImage *_shapeImageNone;
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
        [self setup];
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    _color = LSPasswordCharacterColorNone;
    _size = LSPasswordCharacterSizeNone;
    _shape = LSPasswordCharacterShapeNone;
    
    _sizeImageNone = [UIImage imageNamed:@"sizeNone"];
    _sizeImageSmall = [UIImage imageNamed:@"sizeSmall"];
    _sizeImageMedium = [UIImage imageNamed:@"sizeMedium"];
    _sizeImageLarge = [UIImage imageNamed:@"sizeLarge"];
    
    _shapeImageNone = [UIImage imageNamed:@"shapeNone"];
    _shapeImageTriangle = [UIImage imageNamed:@"shapeTriangle"];
    _shapeImageSquare = [UIImage imageNamed:@"shapeSquare"];
    _shapeImageCircle = [UIImage imageNamed:@"shapeCircle"];
    
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

- (void)setSize:(LSPasswordCharacterSize)size {
    _size = size;
    switch (_size) {
        case LSPasswordCharacterSizeNone:
            [_sizeButton setBackgroundImage:_sizeImageNone forState:UIControlStateNormal];
            break;
        case LSPasswordCharacterSizeSmall:
            [_sizeButton setBackgroundImage:_sizeImageSmall forState:UIControlStateNormal];
            break;
        case LSPasswordCharacterSizeMedium:
            [_sizeButton setBackgroundImage:_sizeImageMedium forState:UIControlStateNormal];
            break;
        case LSPasswordCharacterSizeLarge:
            [_sizeButton setBackgroundImage:_sizeImageLarge forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (void)setShape:(LSPasswordCharacterShape)shape  {
    _shape = shape;
    switch (_shape) {
        case LSPasswordCharacterShapeNone:
            [_shapeButton setBackgroundImage:_shapeImageNone forState:UIControlStateNormal];
            break;
        case LSPasswordCharacterShapeCircle:
            [_shapeButton setBackgroundImage:_shapeImageCircle forState:UIControlStateNormal];
            break;
        case LSPasswordCharacterShapeTriangle:
            [_shapeButton setBackgroundImage:_shapeImageTriangle forState:UIControlStateNormal];
            break;
        case LSPasswordCharacterShapeSquare:
            [_shapeButton setBackgroundImage:_shapeImageSquare forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (IBAction)buttonPressed:(id)sender {
    [self buttonSelectionBlock](self, [sender tag]);
}


@end
