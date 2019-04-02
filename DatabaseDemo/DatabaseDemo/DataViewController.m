//
//  DataViewController.m
//  DatabaseDemo
//
//  Created by Apple on 29/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "DataViewController.h"
#import "UpdateViewController.h"
#import "AddViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    NSDictionary *dic1=[[NSDictionary alloc]initWithObjectsAndKeys:@"Sagar koyani",@"Name",@"22",@"Age",nil];
    NSDictionary *dic2=[[NSDictionary alloc]initWithObjectsAndKeys:@"XyZ ",@"Name",@"24",@"Age",nil];
    NSDictionary *dic3=[[NSDictionary alloc]initWithObjectsAndKeys:@"ANP ",@"Name",@"5",@"Age",nil];
    _arrTabledata=[[NSMutableArray alloc]initWithObjects:dic1,dic2,dic3, nil];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrTabledata.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *name=(UILabel*)[cell viewWithTag:101];
    UILabel *age=(UILabel*)[cell viewWithTag:102];
    name.text=[[_arrTabledata objectAtIndex:indexPath.row] valueForKey:@"Name"];
    age.text=[[_arrTabledata objectAtIndex:indexPath.row] valueForKey:@"Age"];
    [cell.contentView addSubview:name];
    [cell.contentView addSubview:age];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UpdateViewController *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"UpdateViewController"];
    ob.name=[[_arrTabledata objectAtIndex:indexPath.row] valueForKey:@"Name"];
    ob.age=[[_arrTabledata objectAtIndex:indexPath.row] valueForKey:@"Age"]; 
    [self.navigationController pushViewController:ob animated:YES];
}
- (IBAction)btnAdd:(UIBarButtonItem *)sender {
    AddViewController *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];

    [self.navigationController pushViewController:ob animated:YES];
}
@end
