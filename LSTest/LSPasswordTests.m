//
//  LSPasswordTests.m
//  LockScreen
//
//  Created by Brian Turner on 4/11/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSPasswordTests.h"
#import "LSPassword.h"
#import "LSPasswordCharacter.h"

@interface LSPasswordTests () {
    LSPassword *password;
    
    LSPasswordCharacter *redHouse;
    LSPasswordCharacter *blue;
    LSPasswordCharacter *mediumGreen;
}

@end

@implementation LSPasswordTests

- (void)setUp {
        [super setUp];
    password = [[LSPassword alloc] init];
    
    
    redHouse = [[LSPasswordCharacter alloc] init];
    [redHouse addCharacterAttribute:LSPasswordCharacterAttributeColorRed];
    [redHouse addCharacterAttribute:LSPasswordCharacterAttributeShapeHouse];
    
    blue = [[LSPasswordCharacter alloc] init];
    [blue addCharacterAttribute:LSPasswordCharacterAttributeColorBlue];
    
    mediumGreen = [[LSPasswordCharacter alloc] init];
    [mediumGreen addCharacterAttribute:LSPasswordCharacterAttributeSizeMedium];
    [mediumGreen addCharacterAttribute:LSPasswordCharacterAttributeColorGreen];
}


- (void)testAddPasswordCharacter {
    STAssertTrue([[password passwordCharacters] count] == 0, @"password characters are not starting off as nothing");
    [password addPasswordCharacter:redHouse];
    STAssertTrue([[password passwordCharacters] objectAtIndex:0] == redHouse, @"password character addiction failing");
    [password addPasswordCharacter:blue];
    STAssertTrue([[password passwordCharacters] objectAtIndex:0] == redHouse, @"password character addiction failing");
    STAssertTrue([[password passwordCharacters] objectAtIndex:1] == blue, @"password character addiction failing");
}

- (void)testSetPasswordCharacterAtIndex {
    STAssertTrue([[password passwordCharacters] count] == 0, @"password characters are not starting off as nothing");
    [password setPasswordCharacter:redHouse atIndex:0];
    STAssertTrue([[password passwordCharacters] objectAtIndex:0] == redHouse, @"password character set failing");
    [password setPasswordCharacter:blue atIndex:0];
    STAssertTrue([[password passwordCharacters] objectAtIndex:0] == blue, @"password character set failing");
    [password setPasswordCharacter:redHouse atIndex:1];
    NSArray *characterArray = @[blue, redHouse];
    STAssertTrue([[password passwordCharacters] isEqualToArray:characterArray], @"password character set failing");
}

- (void)testPasswordMatch {
    
    [password addPasswordCharacter:redHouse];
    [password addPasswordCharacter:blue];
    [password addPasswordCharacter:mediumGreen];
    
    
    LSPassword *masterPassword = [[LSPassword alloc] init];
    LSPasswordCharacter *red = [[LSPasswordCharacter alloc] init];
    [red addCharacterAttribute:LSPasswordCharacterAttributeColorRed];
    [masterPassword addPasswordCharacter:red];
    
    [masterPassword addPasswordCharacter:blue];
    
    LSPasswordCharacter *medium = [[LSPasswordCharacter alloc] init];
    [medium addCharacterAttribute:LSPasswordCharacterAttributeSizeMedium];
    [masterPassword addPasswordCharacter:medium];
    
    STAssertFalse([masterPassword meetsRequirmentsOfPassword:password], @"password matching not working correctly");
    
    STAssertTrue([password meetsRequirmentsOfPassword:masterPassword], @"passowrd matching not working correctly");
    [medium addCharacterAttribute:LSPasswordCharacterAttributeShapeHouse];
    STAssertFalse([password meetsRequirmentsOfPassword:masterPassword], @"passowrd matching not working correctly");
}
@end
