//
//  LSUtils.m
//  LockScreen
//
//  Created by Brian Turner on 4/12/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSUtils.h"
#import "LSPasswordCharacter.h"
#import "LSPassword.h"

static NSMutableArray *arrayOfUsedIndexes;

@implementation LSUtils

+ (NSArray *)passwordCharactersToMeetMasterPassword:(LSPassword *)password count:(int)count {

    NSMutableArray *passwordCharacters = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        [passwordCharacters addObject:[LSPasswordCharacter randomCharacter]];
    }
    arrayOfUsedIndexes = [NSMutableArray array];
    for (LSPasswordCharacter *character in [password passwordCharacters]) {
        int index = [self randomIndexWithLimit:count];
        [arrayOfUsedIndexes addObject:[NSNumber numberWithInt:index]];
        [passwordCharacters replaceObjectAtIndex:index withObject:[LSPasswordCharacter characterWhichMeetsRequirmentsOfCharacter:character]];
    }
    return passwordCharacters;
}


//this is used to ensure that we are not replacing one character required for the password with
//another character required for the password
+ (int)randomIndexWithLimit:(int)limit {
    int index = arc4random() % limit;
    if ([arrayOfUsedIndexes containsObject:[NSNumber numberWithInt:index]]) {
        index = [self randomIndexWithLimit:limit];
    }
    return index;
}
@end
