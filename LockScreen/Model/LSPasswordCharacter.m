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

+ (NSArray *)sizes {
    return @[@"Small", @"Medium", @"Large"];
}

+ (NSArray *)colors {
    return @[@"Red", @"Green", @"Blue"];
}

+ (NSArray *)shapes {
    return @[@"Square", @"Triangle", @"House"];
}

@end
