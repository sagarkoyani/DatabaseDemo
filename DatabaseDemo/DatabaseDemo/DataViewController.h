//
//  DataViewController.h
//  DatabaseDemo
//
//  Created by Apple on 29/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property NSMutableArray *arrTabledata;


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
