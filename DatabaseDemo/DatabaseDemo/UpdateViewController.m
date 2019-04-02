//
//  UpdateViewController.m
//  DatabaseDemo
//
//  Created by Apple on 29/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _txtName.text=_name;
    _txtAge.text=_age;
}
- (IBAction)btnUpdate:(UIBarButtonItem *)sender {
    NSLog(@"Update Clicked");
}


@end
