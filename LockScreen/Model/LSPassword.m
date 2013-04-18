//
//  LSPassword.m
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import "LSPassword.h"
#import "LSPasswordCharacter.h"

@interface LSPassword () {
    
}

@end

@implementation LSPassword

- (id)init {
    self = [super init];
    if (self) {
        _passwordCharacters = [NSMutableArray array];
    }
    return self;
}

- (void)addPasswordCharacter:(LSPasswordCharacter *)passwordChar {
    [_passwordCharacters addObject:passwordChar];
}

- (void)removeLastPasswordCharacter {
    [_passwordCharacters removeLastObject];
}

- (void)setPasswordCharacter:(LSPasswordCharacter *)passwordCharacter atIndex:(NSInteger)index {
    if (index == [[self passwordCharacters] count])
        [self addPasswordCharacter:passwordCharacter];
    else if (index < [[self passwordCharacters] count])
        [_passwordCharacters replaceObjectAtIndex:index withObject:passwordCharacter];
    else
        NSLog(@"attempting to set a character at a range outside the passwords index");
}

- (BOOL)meetsRequirmentsOfPassword:(LSPassword *)password {
    if ([[self passwordCharacters] count] != [[password passwordCharacters] count])
        return NO;
    for (int i = 0; i < [[self passwordCharacters] count]; i++) {
        LSPasswordCharacter *charA = [[self passwordCharacters] objectAtIndex:i];
        LSPasswordCharacter *charB = [[password passwordCharacters] objectAtIndex:i];
        if (![charA meetsRequirmentsOfCharacter:charB])
            return NO;
    }
    return YES;
}


@end
