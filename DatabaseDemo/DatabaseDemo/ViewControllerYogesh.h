//
//  ViewControllerYogesh.h
//  DatabaseDemo
//
//  Created by Apple on 29/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dboperation.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerYogesh : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    dboperation *ds;
    NSString *selectedIndex;
}
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;

- (IBAction)btnInsert:(id)sender;
- (IBAction)btnUpdate:(UIButton *)sender;
- (IBAction)btnDelete:(UIButton *)sender;
- (IBAction)btnDisplay:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *arrMainData;
@end

NS_ASSUME_NONNULL_END
