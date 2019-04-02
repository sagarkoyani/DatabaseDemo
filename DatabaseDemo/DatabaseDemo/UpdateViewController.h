//
//  UpdateViewController.h
//  DatabaseDemo
//
//  Created by Apple on 29/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UpdateViewController : UIViewController
@property NSString *name;
@property NSString *age;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;
@end

NS_ASSUME_NONNULL_END
