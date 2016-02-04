#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE pic (id INTEGER PRIMARY KEY, name TEXT COLLATE NOCASE, firsttime INTEGER);";
    
    [dbcon query:query];
    
    query = @"CREATE TABLE focus (id INTEGER PRIMARY KEY, automatic INTEGER, amount INTEGER);";
    
    [dbcon query:query];
    
    query = @"INSERT INTO focus (automatic, amount) values(1, 1000);";
    
    [dbcon query:query];
    
    [dbcon commit];
}

@end