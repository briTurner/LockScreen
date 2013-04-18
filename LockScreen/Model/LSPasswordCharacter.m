//
//  LSCharacter.m
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import "LSPasswordCharacter.h"

@interface LSPasswordCharacter () {
    
}

@end

@implementation LSPasswordCharacter

+ (id)randomCharacter {
    LSPasswordCharacterColor color = (arc4random() % 3) + 1;
    LSPasswordCharacterShape shape = (arc4random() % 3) + 1;
    LSPasswordCharacterSize size = (arc4random() % 3) + 1;
    
    LSPasswordCharacter *character = [self characterWithCharacterColor:color size:size shape:shape];
    return character;
}

+ (id)characterWithCharacterColor:(LSPasswordCharacterColor)color size:(LSPasswordCharacterSize)size shape:(LSPasswordCharacterShape)shape {
    return [[self alloc] initWithCharacterColor:color size:size shape:shape];
}

+ (id)characterWhichMeetsRequirmentsOfCharacter:(LSPasswordCharacter *)masterCharacter {
    LSPasswordCharacter *minimumCharacter = [[LSPasswordCharacter alloc] init];
    [minimumCharacter setShape:[masterCharacter shape] ? [masterCharacter shape] : (arc4random() % 3) + 1];
    [minimumCharacter setSize:[masterCharacter size] ? [masterCharacter size] : (arc4random() % 3) + 1];
    [minimumCharacter setColor:[masterCharacter color] ? [masterCharacter color] : (arc4random() % 3) + 1];
    return minimumCharacter;
}

- (id)initWithCharacterColor:(LSPasswordCharacterColor)color size:(LSPasswordCharacterSize)size shape:(LSPasswordCharacterShape)shape {
    self = [super init];
    if (self) {
        _color = color;
        _size = size;
        _shape = shape;
    }
    return self;
}

-(id)init {
    return [self initWithCharacterColor:LSPasswordCharacterColorNone size:LSPasswordCharacterSizeNone shape:LSPasswordCharacterShapeNone];
}

- (BOOL)meetsRequirmentsOfCharacter:(LSPasswordCharacter *)passwordCharacter {
    if ([passwordCharacter color]) {
        if ([passwordCharacter color] != [self color])
            return NO;
    }
    if ([passwordCharacter size]) {
        if ([passwordCharacter size] != [self size])
            return NO;
    }
    if ([passwordCharacter shape]) {
        if ([passwordCharacter shape] != [self shape])
            return NO;
    }
    return YES;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ Color: %i, Shape: %i, Size: %i", [super description], [self color], [self shape], [self size]];
}


@end
