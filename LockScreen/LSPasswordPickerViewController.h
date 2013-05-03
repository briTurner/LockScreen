//
//  LSPasswordPickerViewController.h
//  LockScreen
//
//  Created by Brian Turner on 5/3/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LSPassword;

@protocol LSPasswordPickerViewControllerDelegate;

@interface LSPasswordPickerViewController : UIViewController <UIActionSheetDelegate>

- (id)initWithPassword:(LSPassword *)password;
- (IBAction)addButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id <LSPasswordPickerViewControllerDelegate> delegate;
@end


@protocol LSPasswordPickerViewControllerDelegate <NSObject>

- (void)passwordPickerViewController:(LSPasswordPickerViewController *)passwordPicker returnedWithPassword:(LSPassword *)password;

@end
