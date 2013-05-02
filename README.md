LockScreen
==========

Algorithm Based Lock Screen

NOTE: This project was created in a matter of hours, and is in no way complete. 

Using the lock screen is made to be as easy as possible. 

1) Create a master password.  

     LSPassword *_masterPassword = [[LSPassword alloc] init];

2) Create each required character, and then add it to the master password. 

    LSPasswordCharacter *char = [LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorNone
                                                                                      size:LSPasswordCharacterSizeSmall
                                                                                     shape:LSPasswordCharacterShapeNone];
     _masterPassword addPasswordCharacter:char];

3) Create the LSLockScreenViewController passing in the master password, as well as a success block and a failure block.

      LSLockScreenViewController *vc = [[LSLockScreenViewController alloc] initWithMasterPassword:_masterPassword failureBlock:^{
        NSLog(@"failed to login");
    } successBlock:^{
        NSLog(@"successfully logged in");
    }];

The rest is handled for you behind the scenes. 
