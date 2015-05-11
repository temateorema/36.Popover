//
//  AGViewController.m
//  36.popover
//
//  Created by MC723 on 21.04.15.
//  Copyright (c) 2015 temateorema. All rights reserved.
//

#import "AGViewController.h"
#import "InfoViewController.h"

@interface AGViewController () <UIPopoverControllerDelegate>
@property (strong, nonatomic) UIPopoverController *popover;
@end

@implementation AGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionAdd:(UIBarButtonItem*)sender {
    
    InfoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UIPopoverController *popOver = [[UIPopoverController alloc] initWithContentViewController:vc];
        
        
        [popOver presentPopoverFromBarButtonItem:sender
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
        
        vc.preferredContentSize = CGSizeMake(200, 200);
        //popOver.popoverContentSize = CGSizeMake(300, 300);
        
        popOver.delegate = self;
        self.popover = popOver;
    }
    
//    } else {
//        [self showDetailsInModalForIphone:vc];
//    }
}


@end
