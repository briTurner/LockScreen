LockScreen
==========

Algorithm Based Lock Screen (http://www.youtube.com/watch?v=YWO2WssNRRo)

NOTE: This project was created in a matter of hours, and is in no way complete. 

Before Using!!  

To Install --

1) Copy directory "Lock Screen Library" into your project.  
2) #import "LSLockScreen.h"  anywhere you need access to the classes.  
3) continue with the rest of the instructions bellow

Using the lock screen is made to be as easy as possible. 

1) Create a master password either progromatically, or allow the user to select their own password. 
<h1> Creating password Programatically</h1>
a.1) Create a master password.  

     LSPassword *_masterPassword = [[LSPassword alloc] init];

a.2) Create each required character, and then add it to the master password. 

    LSPasswordCharacter *char = [LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorNone
                                                                                      size:LSPasswordCharacterSizeSmall
                                                                                     shape:LSPasswordCharacterShapeNone];
     [_masterPassword addPasswordCharacter:char];
<h1> Allowing the user to create passowrd </h1>
b.1) Create a Password Picker 
     
     LSPasswordPickerViewController *vc = [[LSPasswordPickerViewController alloc] initWithPassword:_masterPassword];

b.2) Set yourself as the delegate

     [vc setDelegate:self];

b.3) present the LSPasswordPicker
    [self presentViewController:vc animated:YES completion:nil];

b.4) Conform to the delegate so you can be notified when the user has finished picking a password

     - (void)passwordPickerViewController:(LSPasswordPickerViewController *)passwordPicker returnedWithPassword:(LSPassword *)password {
          _masterPassword = password;
          if ([[_masterPassword passwordCharacters] count] > 0) {
               [lockScreenButton setEnabled:YES];
          }
          [self dismissViewControllerAnimated:YES completion:nil];
     }
3) Create the LSLockScreenViewController passing in the master password, as well as a success block and a failure block.

      LSLockScreenViewController *vc = [[LSLockScreenViewController alloc] initWithMasterPassword:_masterPassword failureBlock:^{
        NSLog(@"failed to login");
    } successBlock:^{
        NSLog(@"successfully logged in");
    }];

The rest is handled for you behind the scenes. 
