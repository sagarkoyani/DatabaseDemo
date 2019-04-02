//
//  dboperation.m
//  DatabaseDemo
//
//  Created by Apple on 29/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "dboperation.h"

@implementation dboperation
@synthesize arrData,strmain;
-(id)init{
    appdel=(AppDelegate *)[[UIApplication sharedApplication] delegate]; //delegate method usd;
    strmain=appdel.strPath;
    return self;
    
}
-(NSMutableArray *)getallUser:(NSString *)query{
    arrData=[[NSMutableArray alloc]init];
    /*
    1.Open
        2.Prepare
                3.Step
        4.Finalize
    5.Closed
    */
    if (sqlite3_open([strmain UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *connection;
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &connection,nil)==SQLITE_OK) {
            
            while (sqlite3_step(connection)==SQLITE_ROW) {
            
                NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
                NSString *str11=[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(connection, 0)];//no
                
                NSString *str12=[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(connection, 1)];//name
                
                
                NSString *str13=[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(connection, 2)];//city
                
                [dic setObject:str11 forKey:@"No"];
                [dic setObject:str12 forKey:@"Name"];
                [dic setObject:str13 forKey:@"City"];
                [arrData addObject:dic];
            }
        }
        sqlite3_finalize(connection);
    }
    sqlite3_close(database);
    return arrData; 
}
@end
