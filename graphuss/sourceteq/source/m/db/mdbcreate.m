#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE pic (id INTEGER PRIMARY KEY, name TEXT COLLATE NOCASE, firsttime INTEGER);";
    
    [dbcon query:query];
    
    query = @"CREATE TABLE focus (id INTEGER PRIMARY KEY, automatic INTEGER, value INTEGER);";
    
    [dbcon query:query];
    
    [dbcon commit];
}

@end