//
//  LSUtils.h
//  LockScreen
//
//  Created by Brian Turner on 4/12/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LSPassword;
@interface LSUtils : NSObject

//will return an array of LSPasswordCharacters the length of count
//you can safely assume that this method will return enough characters
//to satisfy the minimum requirment of the LSPassword provided in the
//parameter password
+ (NSArray *)passwordCharactersToMeetMasterPassword:(LSPassword *)password count:(int)count;
@end
