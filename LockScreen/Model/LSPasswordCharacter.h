//
//  LSCharacter.h
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>


//Available colors
typedef enum {
    LSPasswordCharacterColorNone,
    LSPasswordCharacterColorRed,
    LSPasswordCharacterColorGreen,
    LSPasswordCharacterColorBlue,
} LSPasswordCharacterColor;

//Available shapes
typedef enum {
    LSPasswordCharacterShapeNone,
    LSPasswordCharacterShapeCircle,
    LSPasswordCharacterShapeTriangle,
    LSPasswordCharacterShapeSquare,
}LSPasswordCharacterShape;

//Available sizes
typedef enum {
    LSPasswordCharacterSizeNone,
    LSPasswordCharacterSizeSmall,
    LSPasswordCharacterSizeMedium,
    LSPasswordCharacterSizeLarge,
} LSPasswordCharacterSize;



@interface LSPasswordCharacter : NSObject
//Character properties
@property (nonatomic) LSPasswordCharacterSize size;
@property (nonatomic) LSPasswordCharacterColor color;
@property (nonatomic) LSPasswordCharacterShape shape;

//Generates a character with a random shape, size, and color
+ (id)randomCharacter;

//Class method which returns a character with attributes which meet the requirments of the provided master character
//This will select random attributes for those not required by the master character
+ (id)characterWhichMeetsRequirmentsOfCharacter:(LSPasswordCharacter *)masterCharacter;

//Class method which returns a character with the provided attributes
+ (id)characterWithCharacterColor:(LSPasswordCharacterColor)color size:(LSPasswordCharacterSize)size shape:(LSPasswordCharacterShape)shape;


//DI
- (id)initWithCharacterColor:(LSPasswordCharacterColor)color size:(LSPasswordCharacterSize)size shape:(LSPasswordCharacterShape)shape;

//Checks to see if this character meets the requirements 
- (BOOL)meetsRequirmentsOfCharacter:(LSPasswordCharacter *)passwordCharacter;

//returns a UIImage which represents the character based on the character attributes. 
- (UIImage *)imageForPasswordCharacter;

@end
