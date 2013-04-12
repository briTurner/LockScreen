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

+ (NSArray *)passwordCharactersToMeetMasterPassword:(LSPassword *)password count:(int)count;
@end
