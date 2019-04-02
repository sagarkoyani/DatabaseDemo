//
//  ViewControllerYogesh.m
//  DatabaseDemo
//
//  Created by Apple on 29/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "ViewControllerYogesh.h"
#import "dboperation.h"

@interface ViewControllerYogesh ()

@end

@implementation ViewControllerYogesh
@synthesize arrMainData,txtCity,txtName,tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    tableView.delegate=self;
    tableView.dataSource=self;
    ds=[[dboperation alloc]init];
}
- (IBAction)btnInsert:(id)sender {
    NSString *strInsert=[[NSString alloc]initWithFormat:@"insert into stud_info values(null,'%@','%@')",txtName.text,txtCity.text];
    
    BOOL st=[ds getallUser:strInsert];
    if (st) {
        NSLog(@"data Saved");
        txtName.text=txtCity.text=@"";
        [self btnDisplay:nil];
       
    }else{
        NSLog(@"Data is not saved");
    }
    
}

- (IBAction)btnUpdate:(UIButton *)sender {
    NSString *strUpdate=[[NSString alloc]initWithFormat:@"update stud_info set city='%@',name='%@' where     no=%@",txtCity.text,txtName.text,selectedIndex];
    
    BOOL st=[ds getallUser:strUpdate];
    if (st) {
        NSLog(@"data Updated");
        txtName.text=txtCity.text=@"";
        [self btnDisplay:nil];
        
    }else{
        NSLog(@"Data is not Updated");
    }
}

- (IBAction)btnDelete:(UIButton *)sender {
    NSString *strDelete=[[NSString alloc]initWithFormat:@"delete from stud_info where name='%@'",txtName.text];
    
    BOOL st=[ds getallUser:strDelete];
    if (st) {
        NSLog(@"data Deleted");
        txtName.text=txtCity.text=@"";
        [self btnDisplay:nil];
    }else{
        NSLog(@"Data is not Deleted");
    }
}

- (IBAction)btnDisplay:(UIButton *)sender {
    NSString *strUpdate=[[NSString alloc]initWithFormat:@"select * from stud_info"];
    arrMainData=[[NSMutableArray alloc]init];
    arrMainData=[ds getallUser:strUpdate];
    [tableView reloadData];
}

//TableView Setup

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrMainData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=[[arrMainData objectAtIndex:indexPath.row] objectForKey:@ "Name"];
    cell.detailTextLabel.text=[[arrMainData objectAtIndex:indexPath.row] objectForKey:@"City"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    txtName.text=[[arrMainData objectAtIndex:indexPath.row] objectForKey:@"Name"];//txtFieldname
    txtCity.text=[[arrMainData objectAtIndex:indexPath.row] objectForKey:@"City"];//TextfieldCity
    selectedIndex=[[arrMainData objectAtIndex:indexPath.row] objectForKey:@"No"];//No
}

////////////////////TableView Setup

@end
