//
//  AGEducationViewController.h
//  36.popover
//
//  Created by MC723 on 11.05.15.
//  Copyright (c) 2015 temateorema. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AGEducationViewControllerDelegate;

@interface AGEducationViewController : UIViewController
@property (weak, nonatomic) id <AGEducationViewControllerDelegate> delegate;
@property (strong,nonatomic) NSString *education;
@property (assign, nonatomic) NSInteger lastComponentIndex;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIPickerView *educationPicker;

@property (strong, nonatomic) NSArray *educationData;

- (IBAction)doneButtonAction:(UIBarButtonItem *)sender;
- (IBAction)cancelButtonAction:(UIBarButtonItem *)sender;

@end

@protocol AGEducationViewControllerDelegate <NSObject>
- (void) didFinishEditingEducation:(NSString*) education atIndex:(NSInteger *)index;

@end