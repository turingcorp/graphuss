#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE profile (id INTEGER PRIMARY KEY, created INTEGER, syncstamp INTEGER, updated INTEGER, name INTEGER, namestr TEXT COLLATE NOCASE, age INTEGER, gender INTEGER);";
    
    [dbcon query:query];
    
    query = @"CREATE TABLE profilecircle (id INTEGER PRIMARY KEY, circletype INTEGER, amount INTEGER, CONSTRAINT profilelike_unique unique(circletype));";
    
    [dbcon query:query];
    
    [dbcon commit];
}

@end