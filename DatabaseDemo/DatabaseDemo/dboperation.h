//
//  dboperation.h
//  DatabaseDemo
//
//  Created by Apple on 29/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <sqlite3.h>


@interface dboperation : NSObject
{
    AppDelegate *appdel;
    sqlite3 *database;
}

@property (strong,nonatomic) NSMutableArray *arrData;
@property(strong,nonatomic) NSString *strmain;
-(NSMutableArray *)getallUser:(NSString*)query;

@end

