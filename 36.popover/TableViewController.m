//
//  TableViewController.m
//  36.popover
//
//  Created by MC723 on 23.04.15.
//  Copyright (c) 2015 temateorema. All rights reserved.
//

#import "TableViewController.h"
#import "InfoViewController.h"
#import "AGDateViewController.h"
#import "AGEducationViewController.h"

@interface TableViewController () <UIPopoverControllerDelegate, UITextFieldDelegate, AGDateViewControllerDelegate, AGEducationViewControllerDelegate>

@property (strong, nonatomic) UIPopoverController *popover;
@property (strong, nonatomic) NSDate *date;
@property (assign, nonatomic) NSInteger componentIndex;

@end

static NSString *kNameField = @"kNameField";
static NSString *kFamilyNameField = @"kFamilyNameField";
static NSString *kGenderSegmentedControl = @"kGenderSegmentedControl";
static NSString *kBithDayField = @"kBithDayField";
static NSString *kEducationField = @"kEducationField";
static NSString *kComponentIndex = @"kComponentIndex";

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.educationTextField.delegate = self;
    self.birthDayTextField.delegate = self;
    [self loadSettings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (IBAction)infoButtonAction:(UIButton *)sender {
    
    InfoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:vc];
        
        [popover presentPopoverFromRect:sender.frame
                                 inView:self.view
               permittedArrowDirections:UIPopoverArrowDirectionUp
                               animated:YES];
        
        vc.preferredContentSize = CGSizeMake(300, 300);
        
        popover.delegate = self;
        self.popover = popover;
        
    } else {
        [self showDetailsInModalForIphone:vc];
    }
}

- (IBAction)genderAction:(UISegmentedControl *)sender {
    [self saveSettings];
}

- (IBAction)textFieldChanged:(UITextField *)sender {
    [self saveSettings];
}


- (void) showDetailsInModalForIphone:(UIViewController *) controller {
    [self presentViewController:controller
                       animated:YES
                     completion:^{
                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                             
                             [self dismissViewControllerAnimated:YES completion:nil];
                         });
                     }];
}

#pragma mark - AGDateViewControllerDelegate

- (void)didFinishEditingDate:(NSDate *)date {
    self.date = date;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"d.MM.y"];
    self.birthDayTextField.text = [formatter stringFromDate:date];
    [self.tableView reloadData];
    [self saveSettings];
}

#pragma mark - AGEducationViewControllerDelegate

- (void) didFinishEditingEducation:(NSString *)education atIndex:(NSInteger *)index {
    
    self.componentIndex = index;
    self.educationTextField.text = education;
    [self.tableView reloadData];
    [self saveSettings];
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.birthDayTextField) {
        
        AGDateViewController *dateViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AGDateViewController"];
        
        dateViewController.delegate = self;
        UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:dateViewController];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:navigation];
            
            popover.popoverContentSize = CGSizeMake(300, 300);
            CGRect frame = [textField convertRect:textField.bounds toView:self.tableView];
            
            [popover presentPopoverFromRect:frame
                                     inView:self.tableView
                   permittedArrowDirections:UIPopoverArrowDirectionUp
                                   animated:YES];
            
        } else {
            [self presentViewController:navigation animated:YES completion:nil];
        }
        return NO;
        
    } else if (textField == self.educationTextField) {
        AGEducationViewController *educationController = [self.storyboard instantiateViewControllerWithIdentifier:@"AGEducationViewController"];
        
        educationController.delegate = self;
        
        if (self.educationTextField.text) {
            educationController.lastComponentIndex = self.componentIndex;
            educationController.education = self.educationTextField.text;
        }

        UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:educationController];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:navigation];
            
            popover.popoverContentSize = CGSizeMake(300, 300);
            CGRect frame = [textField convertRect:textField.bounds toView:self.tableView];
            
            [popover presentPopoverFromRect:frame
                                     inView:self.tableView
                   permittedArrowDirections:UIPopoverArrowDirectionUp
                                   animated:YES];
        } else {
            [self presentViewController:navigation animated:YES completion:nil];
        }
        return NO;

    } else {
        return YES;
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

#pragma mark - Save_load settings

- (void) saveSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.nameTextField.text forKey:kNameField];
    [defaults setObject:self.familyNameTextField.text forKey:kFamilyNameField];
    [defaults setObject:self.birthDayTextField.text forKey:kBithDayField];
    [defaults setObject:self.birthDayTextField.text forKey:kBithDayField];
    [defaults setObject:self.educationTextField.text forKey:kEducationField];
    [defaults setInteger:self.genderSegmentedControl.selectedSegmentIndex forKey:kGenderSegmentedControl];
    [defaults setInteger:self.componentIndex forKey:kComponentIndex];
    
    [defaults synchronize];
}

- (void) loadSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.nameTextField.text = [defaults objectForKey:kNameField];
    self.familyNameTextField.text = [defaults objectForKey:kFamilyNameField];
    self.birthDayTextField.text = [defaults objectForKey:kBithDayField];
    self.educationTextField.text = [defaults objectForKey:kEducationField];
    self.genderSegmentedControl.selectedSegmentIndex = [defaults integerForKey:kGenderSegmentedControl];
    self.componentIndex = [defaults integerForKey:kComponentIndex];
}

@end
