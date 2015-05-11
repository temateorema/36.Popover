//
//  AGEducationViewController.m
//  36.popover
//
//  Created by MC723 on 11.05.15.
//  Copyright (c) 2015 temateorema. All rights reserved.
//

#import "AGEducationViewController.h"

@interface AGEducationViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation AGEducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.educationPicker.dataSource = self;
    self.educationPicker.delegate = self;
    
    if (!self.lastComponentIndex) {
        self.lastComponentIndex = 0;
    }
    self.educationData = @[@"Primary school", @"High school", @"University", @"Courses", @"Self education"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)selectedRowInComponent:(NSInteger)component {
    self.lastComponentIndex = component;
    return component;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.educationData.count;
}


- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    self.education = [NSString stringWithFormat:@"%@", self.educationData[row]];
    self.lastComponentIndex = component;
    return self.educationData[row];
}

- (IBAction)doneButtonAction:(UIBarButtonItem *)sender {

    [self.delegate didFinishEditingEducation:self.education atIndex: self.lastComponentIndex];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonAction:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}




//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (self.lastIndexPath) {
//        [[tableView cellForRowAtIndexPath:self.lastIndexPath] setAccessoryType:UITableViewCellAccessoryNone];
//    }
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
//    if (cell.detailTextLabel.text) {
//        self.education = [NSString stringWithFormat:@"%@ (%@)", cell.textLabel.text, cell.detailTextLabel.text];
//    } else {
//        self.education = cell.textLabel.text;
//    }
//    self.lastIndexPath = indexPath;
//}


@end
