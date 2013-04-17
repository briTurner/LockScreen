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
}

@end

@implementation LSPasswordCharacterTests

- (void)setUp {
}

- (void)testRandomPasswordCharacter {
    NSString *failString = @"Random character generation failed";
    LSPasswordCharacter *randomCharacter = [LSPasswordCharacter randomCharacter];
    STAssertFalse([randomCharacter color] == LSPasswordCharacterColorNone, @"1");
    STAssertFalse([randomCharacter size] == LSPasswordCharacterSizeNone, @"2");
    STAssertFalse([randomCharacter shape] == LSPasswordCharacterShapeNone, failString);
}

- (void)testCharacterWhichMeetsRequirmentsOfCharacter {
    LSPasswordCharacter *requirmentsCharacter = [LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorNone size:LSPasswordCharacterSizeNone shape:LSPasswordCharacterShapeSquare];
    
    LSPasswordCharacter *charToTest = [LSPasswordCharacter characterWhichMeetsRequirmentsOfCharacter:requirmentsCharacter];
    STAssertTrue([charToTest meetsRequirmentsOfCharacter:requirmentsCharacter], @"meets requirments");
    STAssertFalse([charToTest color] == LSPasswordCharacterColorNone, @"meets requirments");
    STAssertFalse([charToTest size] == LSPasswordCharacterSizeNone, @"meets requirments");
}

- (void)testInitWithCharacterAttributes {
    LSPasswordCharacter *testCharacter = [[LSPasswordCharacter alloc] initWithCharacterColor:LSPasswordCharacterColorRed size:LSPasswordCharacterSizeMedium shape:LSPasswordCharacterShapeCircle];
    STAssertTrue([testCharacter color] == LSPasswordCharacterColorRed, @"init not working properly");
    STAssertTrue([testCharacter size] == LSPasswordCharacterSizeMedium, @"init not working properly");
    STAssertTrue([testCharacter shape] == LSPasswordCharacterShapeCircle, @"init not working properly");
}


- (void)testMeetsRequirmentsOfCharacter {
    LSPasswordCharacter *redLargeCircle = [LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorRed size:LSPasswordCharacterSizeLarge shape:LSPasswordCharacterShapeCircle];
    LSPasswordCharacter *red = [LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorRed size:LSPasswordCharacterSizeNone shape:LSPasswordCharacterShapeNone];
    
    STAssertTrue([redLargeCircle meetsRequirmentsOfCharacter:red], @"meets requirments of character");
    STAssertFalse([red meetsRequirmentsOfCharacter:redLargeCircle], @"meets requirments of character");
    
    
    LSPasswordCharacter *blue = [LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorBlue size:LSPasswordCharacterSizeNone shape:LSPasswordCharacterShapeNone];
    
    STAssertFalse([blue meetsRequirmentsOfCharacter:redLargeCircle], @"meets requirments of character");
    
}

- (void)testSize {
    LSPasswordCharacter *sizeChar = [LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorRed size:LSPasswordCharacterSizeMedium shape:LSPasswordCharacterShapeSquare];
    STAssertTrue([sizeChar size] == LSPasswordCharacterSizeMedium, @"size not matching");
    STAssertFalse([sizeChar size] == LSPasswordCharacterSizeNone, @"size not matching none");
    
}

@end
