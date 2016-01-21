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
    
    [mdbcreate firstvalues:dbcon];
    
    [dbcon commit];
}

+(void)firstvalues:(db*)dbcon
{
    NSInteger amount = 250;
    
    [mdbcreate circle:dbcon type:profile_circle_math amount:amount];
    [mdbcreate circle:dbcon type:profile_circle_music amount:amount];
    [mdbcreate circle:dbcon type:profile_circle_politics amount:amount];
    [mdbcreate circle:dbcon type:profile_circle_leisure amount:amount];
}

+(void)circle:(db*)dbcon type:(profile_circle)type amount:(NSInteger)amount
{
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO profilecircle (circletype, amount) values(%@, %@);",
                       @(type), @(amount)];
    
    [dbcon query:query];
}

@end