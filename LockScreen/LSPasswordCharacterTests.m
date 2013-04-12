//
//  LSPasswordCharacter.m
//  LockScreen
//
//  Created by Brian Turner on 4/11/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSPasswordCharacterTests.h"
#import "LSPasswordCharacter.h"

@interface LSPasswordCharacterTests () {
    LSPasswordCharacter *character1;
        LSPasswordCharacter *character2;
}

@end

@implementation LSPasswordCharacterTests

- (void)setUp {
    character1 = [[LSPasswordCharacter alloc] init];
}

- (void)testInitWithCharacterAttributes {
    LSPasswordCharacter *testCharacter = [[LSPasswordCharacter alloc] initWithCharacterAttributes:(LSPasswordCharacterAttributeColorBlue | LSPasswordCharacterAttributeShapeHouse)];
    STAssertTrue([testCharacter characterAttributes] | LSPasswordCharacterAttributeColorBlue, @"init not working properly");
    STAssertTrue([testCharacter characterAttributes] | LSPasswordCharacterAttributeShapeHouse, @"init not working properly");
    STAssertTrue([testCharacter characterAttributes] | LSPasswordCharacterAttributeShapeSquare, @"init not working properly");
    STAssertTrue([testCharacter characterAttributes] == (LSPasswordCharacterAttributeColorBlue | LSPasswordCharacterAttributeShapeHouse), @"init not working properly");
}

- (void)testAddCharacterAttribute {

    [character1 addCharacterAttribute:LSPasswordCharacterAttributeColorBlue];
    STAssertTrue([character1 characterAttributes] == LSPasswordCharacterAttributeColorBlue, @"Character attributes is not as expected");
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeShapeHouse];
    STAssertFalse([character1 characterAttributes] == LSPasswordCharacterAttributeColorBlue, @"Character attribytes is not as expected");
    STAssertTrue([character1 characterAttributes] | LSPasswordCharacterAttributeColorBlue, @"charater attributes is not as expected");
    
    character1 = [[LSPasswordCharacter alloc] init];
    [character1 addCharacterAttribute:(LSPasswordCharacterAttributeShapeSquare | LSPasswordCharacterAttributeColorBlue)];
    STAssertTrue([character1 characterAttributes] || LSPasswordCharacterAttributeColorBlue == LSPasswordCharacterAttributeColorBlue, @"charater attributes is not as expected");
    
}

- (void)testMatchesPasswordCharacter {
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeColorBlue | LSPasswordCharacterAttributeShapeHouse | LSPasswordCharacterAttributeSizeMedium];
    
    [character2 addCharacterAttribute:LSPasswordCharacterAttributeShapeHouse];
    
    STAssertTrue([character1 meetsRequirmentsOfCharacter:character2], @"Character matching is not workting correctly");
    STAssertFalse([character2 meetsRequirmentsOfCharacter:character1], @"Character matching is not workting correctly");
}

@end
