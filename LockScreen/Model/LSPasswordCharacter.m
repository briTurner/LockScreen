//
//  LSCharacter.m
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import "LSPasswordCharacter.h"

static int numberOfAttributes = 3;

@interface LSPasswordCharacter () {
    
}

@end

@implementation LSPasswordCharacter

+ (id)randomCharacter {
    int offset = arc4random() % numberOfAttributes;
    LSPasswordCharacterAttribute attributeColor = 1 << offset;
    offset = (arc4random() % numberOfAttributes) + numberOfAttributes;
    LSPasswordCharacterAttribute attributeSize = 1 << offset;
    offset = (arc4random() % numberOfAttributes) + numberOfAttributes * 2;
    LSPasswordCharacterAttribute attributeShape = 1 << offset;
    LSPasswordCharacter *character = [LSPasswordCharacter characterWithAttributes:(attributeColor | attributeShape | attributeSize)];
    return character;
}

+ (id)characterWithAttributes:(LSPasswordCharacterAttribute)characterAttributes {
    return [[self alloc] initWithCharacterAttributes:characterAttributes];
}

- (id)initWithCharacterAttributes:(LSPasswordCharacterAttribute)characterAttributes {
    self = [super init];
    if (self) {
        _characterAttributes = characterAttributes;
    }
    return self;
}

-(id)init {
    return [self initWithCharacterAttributes:LSPasswordCharacterAttributeNone];
}

- (void)addCharacterAttribute:(LSPasswordCharacterAttribute)attribute {
    _characterAttributes = _characterAttributes | attribute;
}

- (BOOL)meetsRequirmentsOfCharacter:(LSPasswordCharacter *)passwordCharacter {
    return ([self characterAttributes] | [passwordCharacter characterAttributes]) == [self characterAttributes];
}

- (LSPasswordCharacterAttribute)size {
    LSPasswordCharacterAttribute size = ([self characterAttributes] & (LSPasswordCharacterAttributeSizeLarge | LSPasswordCharacterAttributeSizeMedium | LSPasswordCharacterAttributeSizeSmall));
    return size;
}

- (LSPasswordCharacterAttribute)sizeOrRandom {
    LSPasswordCharacterAttribute size = [self size];
    if (size == LSPasswordCharacterAttributeNone)
        size = [self randomSize];
    return size;
}

- (LSPasswordCharacterAttribute)shape {
    LSPasswordCharacterAttribute shape = ([self characterAttributes] & (LSPasswordCharacterAttributeShapeCircle | LSPasswordCharacterAttributeShapeSquare | LSPasswordCharacterAttributeShapeTriangle));
    return shape;
}

- (LSPasswordCharacterAttribute)shapeOrRandom {
    LSPasswordCharacterAttribute shape = [self shape];
    if (shape == LSPasswordCharacterAttributeNone)
        shape = [self randomShape];
    return shape;
}

- (LSPasswordCharacterAttribute)color {
    LSPasswordCharacterAttribute color = ([self characterAttributes] & (LSPasswordCharacterAttributeColorBlue | LSPasswordCharacterAttributeColorGreen | LSPasswordCharacterAttributeColorRed));
    if (color == LSPasswordCharacterAttributeNone)
        color = [self randomColor];
    return color;
}

- (LSPasswordCharacterAttribute)colorOrRandom {
    LSPasswordCharacterAttribute color = [self color];
    if (color == LSPasswordCharacterAttributeNone)
        color = [self randomColor];
    return color;
}

- (LSPasswordCharacterAttribute)randomSize {
    return [@[[NSNumber numberWithInt:LSPasswordCharacterAttributeSizeLarge], [NSNumber numberWithInt:LSPasswordCharacterAttributeSizeMedium], [NSNumber numberWithInt:LSPasswordCharacterAttributeSizeSmall]][arc4random() % 3] intValue];
}

- (LSPasswordCharacterAttribute)randomShape {
    return [@[[NSNumber numberWithInt:LSPasswordCharacterAttributeShapeSquare], [NSNumber numberWithInt:LSPasswordCharacterAttributeShapeCircle], [NSNumber numberWithInt:LSPasswordCharacterAttributeShapeTriangle]][arc4random() % 3] intValue];
}

- (LSPasswordCharacterAttribute)randomColor {
    return [@[[NSNumber numberWithInt:LSPasswordCharacterAttributeColorBlue], [NSNumber numberWithInt:LSPasswordCharacterAttributeColorGreen], [NSNumber numberWithInt:LSPasswordCharacterAttributeColorRed]][arc4random() % 3] intValue];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ Color: %i, Shape: %i, Size: %i", [super description], [self color], [self shape], [self size]];
}


@end
