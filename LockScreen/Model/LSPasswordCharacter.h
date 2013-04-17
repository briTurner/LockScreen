//
//  LSCharacter.h
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    LSPasswordCharacterColorNone,
    LSPasswordCharacterColorRed,
    LSPasswordCharacterColorGreen,
    LSPasswordCharacterColorBlue,
} LSPasswordCharacterColor;

typedef enum {
    LSPasswordCharacterShapeNone,
    LSPasswordCharacterShapeCircle,
    LSPasswordCharacterShapeTriangle,
    LSPasswordCharacterShapeSquare,
}LSPasswordCharacterShape;

typedef enum {
    LSPasswordCharacterSizeNone,
    LSPasswordCharacterSizeSmall,
    LSPasswordCharacterSizeMedium,
    LSPasswordCharacterSizeLarge,
} LSPasswordCharacterSize;



@interface LSPasswordCharacter : NSObject
@property (nonatomic) LSPasswordCharacterSize size;
@property (nonatomic) LSPasswordCharacterColor color;
@property (nonatomic) LSPasswordCharacterShape shape;

+ (id)randomCharacter;
+ (id)characterWithCharacterColor:(LSPasswordCharacterColor)color size:(LSPasswordCharacterSize)size shape:(LSPasswordCharacterShape)shape;
+ (id)characterWhichMeetsRequirmentsOfCharacter:(LSPasswordCharacter *)masterCharacter;
//DI
- (id)initWithCharacterColor:(LSPasswordCharacterColor)color size:(LSPasswordCharacterSize)size shape:(LSPasswordCharacterShape)shape;
- (BOOL)meetsRequirmentsOfCharacter:(LSPasswordCharacter *)passwordCharacter;


@end
