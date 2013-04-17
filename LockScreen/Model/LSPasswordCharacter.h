//
//  LSCharacter.h
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef enum {
    LSPasswordCharacterAttributeNone = 0,
    //Colors
    LSPasswordCharacterAttributeColorRed = 1 << 0,
    LSPasswordCharacterAttributeColorGreen = 1 << 1,
    LSPasswordCharacterAttributeColorBlue = 1 << 2,
    //Sizes
    LSPasswordCharacterAttributeSizeSmall = 1 << 3,
    LSPasswordCharacterAttributeSizeMedium = 1 << 4,
    LSPasswordCharacterAttributeSizeLarge = 1 << 5,
    //Shapes
    LSPasswordCharacterAttributeShapeSquare = 1 << 6,
    LSPasswordCharacterAttributeShapeTriangle = 1 << 7,
    LSPasswordCharacterAttributeShapeCircle = 1 << 8,
} LSPasswordCharacterAttribute;

@interface LSPasswordCharacter : NSObject {
}
@property (nonatomic, readonly) LSPasswordCharacterAttribute characterAttributes;
+ (id)randomCharacter;
+ (id)characterWithAttributes:(LSPasswordCharacterAttribute)characterAttributes;
//DI
- (id)initWithCharacterAttributes:(LSPasswordCharacterAttribute)characterAttributes;

- (void)addCharacterAttribute:(LSPasswordCharacterAttribute)attribute;
- (BOOL)meetsRequirmentsOfCharacter:(LSPasswordCharacter *)passwordCharacter;

- (LSPasswordCharacterAttribute)size;
- (LSPasswordCharacterAttribute)shape;
- (LSPasswordCharacterAttribute)color;

- (LSPasswordCharacterAttribute)shapeOrRandom;
- (LSPasswordCharacterAttribute)sizeOrRandom;
- (LSPasswordCharacterAttribute)colorOrRandom;

@end
