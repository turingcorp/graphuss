#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE pic (id INTEGER PRIMARY KEY, name TEXT COLLATE NOCASE, firsttime INTEGER);";
    
    [dbcon query:query];
    
    [dbcon commit];
}

@end