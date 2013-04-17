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

@implementation LSUtils

+ (NSArray *)passwordCharactersToMeetMasterPassword:(LSPassword *)password count:(int)count {
    NSMutableArray *passwordCharacters = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        [passwordCharacters addObject:[LSPasswordCharacter randomCharacter]];
    }
    for (LSPasswordCharacter *character in [password passwordCharacters]) {
        int index = arc4random() % count;
        [passwordCharacters replaceObjectAtIndex:index withObject:[LSPasswordCharacter characterWhichMeetsRequirmentsOfCharacter:character]];
    }
    return passwordCharacters;
}
@end
