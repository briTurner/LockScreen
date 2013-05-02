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

//DI for the LSLockScreenViewController
//Arguments
//mPassword:
//  the password against which all user entered passwords will be checked
//fBlock
//  the block which will execute if the user enters a failing password
//sBlock
//  the block which will execute if user enters correct password
- (id)initWithMasterPassword:(LSPassword *)mPassword failureBlock:(void (^)(void))fBlock successBlock:(void (^)(void))sBlock;

//the properties exposing the variables which were set in the initializer above
@property (nonatomic, strong) LSPassword *masterPassword;
@property (nonatomic, copy) void(^failureBlock)(void);
@property (nonatomic, copy) void(^successBlock)(void);

@end
