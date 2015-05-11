//
//  TableViewController.h
//  36.popover
//
//  Created by MC723 on 23.04.15.
//  Copyright (c) 2015 temateorema. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

- (IBAction)infoButtonAction:(UIButton *)sender;
- (IBAction)genderAction:(UISegmentedControl *)sender;

- (IBAction)textFieldChanged:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *familyNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthDayTextField;
@property (weak, nonatomic) IBOutlet UITextField *educationTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentedControl;

@end
