//
//  LSTestScreenViewController.h
//  LockScreen
//
//  Created by Brian Turner on 4/17/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LSPassword;

@interface LSLockScreenViewController : UIViewController
- (id)initWithMasterPassword:(LSPassword *)mPassword failureBlock:(void (^)(void))fBlock successBlock:(void (^)(void))sBlock;

@property (nonatomic, copy) void(^failureBlock)(void);
@property (nonatomic, copy) void(^successBlock)(void);

@end
