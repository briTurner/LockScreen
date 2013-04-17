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
    [super setUp];
    character1 = [[LSPasswordCharacter alloc] init];
}

- (void)testRandomPasswordCharacter {
    NSString *failString = @"Random character generation failed";
    LSPasswordCharacter *randomCharacter = [LSPasswordCharacter randomCharacter];
    STAssertTrue([randomCharacter characterAttributes] | (LSPasswordCharacterAttributeColorBlue | LSPasswordCharacterAttributeColorGreen | LSPasswordCharacterAttributeColorRed), failString);
    STAssertTrue([randomCharacter characterAttributes] | (LSPasswordCharacterAttributeSizeLarge | LSPasswordCharacterAttributeSizeMedium | LSPasswordCharacterAttributeSizeSmall), failString);
        STAssertTrue([randomCharacter characterAttributes] | (LSPasswordCharacterAttributeShapeCircle | LSPasswordCharacterAttributeShapeSquare | LSPasswordCharacterAttributeShapeTriangle), failString);
}

- (void)testInitWithCharacterAttributes {
    LSPasswordCharacter *testCharacter = [[LSPasswordCharacter alloc] initWithCharacterAttributes:(LSPasswordCharacterAttributeColorBlue | LSPasswordCharacterAttributeShapeCircle)];
    STAssertTrue([testCharacter characterAttributes] | LSPasswordCharacterAttributeColorBlue, @"init not working properly");
    STAssertTrue([testCharacter characterAttributes] | LSPasswordCharacterAttributeShapeCircle, @"init not working properly");
    STAssertTrue([testCharacter characterAttributes] | LSPasswordCharacterAttributeShapeSquare, @"init not working properly");
    STAssertTrue([testCharacter characterAttributes] == (LSPasswordCharacterAttributeColorBlue | LSPasswordCharacterAttributeShapeCircle), @"init not working properly");
}

- (void)testAddCharacterAttribute {

    [character1 addCharacterAttribute:LSPasswordCharacterAttributeColorBlue];
    STAssertTrue([character1 characterAttributes] == LSPasswordCharacterAttributeColorBlue, @"Character attributes is not as expected");
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeShapeCircle];
    STAssertFalse([character1 characterAttributes] == LSPasswordCharacterAttributeColorBlue, @"Character attribytes is not as expected");
    STAssertTrue([character1 characterAttributes] | LSPasswordCharacterAttributeColorBlue, @"charater attributes is not as expected");
    
    character1 = [[LSPasswordCharacter alloc] init];
    [character1 addCharacterAttribute:(LSPasswordCharacterAttributeShapeSquare | LSPasswordCharacterAttributeColorBlue)];
    STAssertTrue([character1 characterAttributes] || LSPasswordCharacterAttributeColorBlue == LSPasswordCharacterAttributeColorBlue, @"charater attributes is not as expected");
    
}

- (void)testMatchesPasswordCharacter {
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeColorBlue | LSPasswordCharacterAttributeShapeCircle | LSPasswordCharacterAttributeSizeMedium];
    
    [character2 addCharacterAttribute:LSPasswordCharacterAttributeShapeCircle];
    
    STAssertTrue([character1 meetsRequirmentsOfCharacter:character2], @"Character matching is not workting correctly");
    STAssertFalse([character2 meetsRequirmentsOfCharacter:character1], @"Character matching is not workting correctly");
}

- (void)testSize {
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeSizeLarge];
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeShapeCircle];
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeColorBlue];
    STAssertTrue([character1 size] == LSPasswordCharacterAttributeSizeLarge, @"size is failing");
    STAssertFalse([character1 size] == LSPasswordCharacterAttributeSizeMedium, @"size is failing");
}

- (void)testShape {
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeSizeLarge];
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeShapeCircle];
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeColorBlue];
    STAssertTrue([character1 shape] == LSPasswordCharacterAttributeShapeCircle, @"size is failing");
}

- (void)testColor {
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeSizeLarge];
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeShapeCircle];
    [character1 addCharacterAttribute:LSPasswordCharacterAttributeColorBlue];
    STAssertTrue([character1 color] == LSPasswordCharacterAttributeColorBlue, @"size is failing");
}

@end
