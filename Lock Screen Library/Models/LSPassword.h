//
//  LSPassword.h
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>

//Object representing a password
//This class is made up of a list of LSPasswordCharacters
@class LSPasswordCharacter;

@interface LSPassword : NSObject

@property (nonatomic, readonly) NSMutableArray *passwordCharacters;

//add a password character to the password.
//This will put the password character at the end of the password
- (void)addPasswordCharacter:(LSPasswordCharacter *)passwordChar;

//Removes the last password character if there is one present
- (void)removeLastPasswordCharacter;

//Sets a password character at a certain index
//If the index provided is larger than the number of characters
//currently in the password, the character is added at the end
- (void)setPasswordCharacter:(LSPasswordCharacter *)passwordCharacter atIndex:(NSInteger)index;

//Checks to see if the current password meets the requirments of another
- (BOOL)meetsRequirmentsOfPassword:(LSPassword *)password;
@end
