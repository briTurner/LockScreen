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

- (BOOL)addCharacter:(LSPasswordCharacter *)character fromRect:(CGRect)rect;
- (void)removeAllCharacters;
- (void)removeLastCharacter;
@end
