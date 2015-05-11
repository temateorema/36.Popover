//
//  AGDateViewController.h
//  36.popover
//
//  Created by MC723 on 09.05.15.
//  Copyright (c) 2015 temateorema. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AGDateViewControllerDelegate;
@interface AGDateViewController : UIViewController

@property (weak, nonatomic) id <AGDateViewControllerDelegate> delegate;

@property (strong, nonatomic) NSDate *dateOfBirth;
@property (strong, nonatomic) NSDate *currentDateOfBirth;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;


- (IBAction)doneButtonAction:(UIBarButtonItem *)sender;
- (IBAction)cancelButtonAction:(UIBarButtonItem *)sender;
@end

@protocol AGDateViewControllerDelegate <NSObject>
@required
- (void)didFinishEditingDate:(NSDate *)date;

@end
