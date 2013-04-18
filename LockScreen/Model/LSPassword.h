//
//  LSPassword.h
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LSPasswordCharacter;

@interface LSPassword : NSObject

@property (nonatomic, readonly) NSMutableArray *passwordCharacters;
- (void)addPasswordCharacter:(LSPasswordCharacter *)passwordChar;
- (void)removeLastPasswordCharacter;
- (void)setPasswordCharacter:(LSPasswordCharacter *)passwordCharacter atIndex:(NSInteger)index;
- (BOOL)meetsRequirmentsOfPassword:(LSPassword *)password;
@end
