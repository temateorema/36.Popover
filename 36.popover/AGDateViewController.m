//
//  AGDateViewController.m
//  36.popover
//
//  Created by MC723 on 09.05.15.
//  Copyright (c) 2015 temateorema. All rights reserved.
//

#import "AGDateViewController.h"

@interface AGDateViewController ()

@end

@implementation AGDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.dateOfBirth) {
        self.datePicker.date = self.dateOfBirth;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)doneButtonAction:(UIBarButtonItem *)sender {
    self.dateOfBirth = self.datePicker.date;
    [self.delegate didFinishEditingDate:self.dateOfBirth];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonAction:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
