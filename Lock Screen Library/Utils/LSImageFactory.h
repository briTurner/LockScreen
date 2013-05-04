//
//  LSImageFactory.h
//  LockScreen
//
//  Created by Brian Turner on 4/17/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LSPasswordCharacter;

@interface LSImageFactory : NSObject

//Generates an image based on the provided character
+ (UIImage *)imageForPasswordCharacter:(LSPasswordCharacter *)character;
@end
