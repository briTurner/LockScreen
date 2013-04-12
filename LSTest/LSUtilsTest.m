//
//  LSUtilsTest.m
//  LockScreen
//
//  Created by Brian Turner on 4/12/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSUtilsTest.h"
#import "LSUtils.h"
#import "LSPassword.h"
#import "LSPasswordCharacter.h"

@interface LSUtilsTest () {
    LSPassword *masterPassword;
}

@end

@implementation LSUtilsTest

- (void)setUp {
    masterPassword = [[LSPassword alloc] init];
 
    LSPasswordCharacter *red = [[LSPasswordCharacter alloc] initWithCharacterAttributes:LSPasswordCharacterAttributeColorRed];
    LSPasswordCharacter *blueHouse = [[LSPasswordCharacter alloc] initWithCharacterAttributes:(LSPasswordCharacterAttributeColorBlue | LSPasswordCharacterAttributeShapeHouse)];
    LSPasswordCharacter *mediumTriamgle = [[LSPasswordCharacter alloc] initWithCharacterAttributes:(LSPasswordCharacterAttributeSizeMedium | LSPasswordCharacterAttributeShapeTriangle)];
    
    [masterPassword addPasswordCharacter:red];
    [masterPassword addPasswordCharacter:blueHouse];
    [masterPassword addPasswordCharacter:mediumTriamgle];
    
    
}

- (void)testPasswordCharactersToMeetMasterPassword {
    NSString *failDescription = @"passwordCharacersToMeetMasterPassword:count: not working correctly";
    int count = 9;
    NSArray *characters = [LSUtils passwordCharactersToMeetMasterPassword:masterPassword count:count];

    STAssertTrue([characters count] == count, failDescription);
    int numberOfPassingChars = 0;
    for (LSPasswordCharacter *character in [masterPassword passwordCharacters]) {
        for (LSPasswordCharacter *characterToCompare in characters) {
            if ([characterToCompare meetsRequirmentsOfCharacter:character])
                numberOfPassingChars++;
        }
    }
    STAssertTrue(numberOfPassingChars >= [[masterPassword passwordCharacters] count], [NSString stringWithFormat:@"needed %i but only %i passed", [[masterPassword passwordCharacters] count], numberOfPassingChars]);
}

@end
