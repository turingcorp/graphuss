#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE img (id INTEGER PRIMARY KEY, created INTEGER, syncstamp INTEGER);";
    
    [dbcon query:query];
    
    [dbcon commit];
}

@end