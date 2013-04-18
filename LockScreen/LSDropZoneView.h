//
//  LSDropZoneView.h
//  LockScreen
//
//  Created by Brian Turner on 4/17/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LSPasswordCharacter;

@interface LSDropZoneView : UIView

- (void)addCharacter:(LSPasswordCharacter *)character;
- (void)removeAllCharacters;
- (void)removeLastCharacter;
@end
