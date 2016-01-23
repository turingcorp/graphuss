#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE pic (id INTEGER PRIMARY KEY, created INTEGER, syncstamp INTEGER, name TEXT COLLATE NOCASE);";
    
    [dbcon query:query];
    
    [dbcon commit];
}

@end