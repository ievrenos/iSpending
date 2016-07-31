

#import "Singleton.h"

@implementation Singleton
@synthesize income,expense,incomePercentage,expensePercentage,incomeCategory,expenseCategory,incomeDate,expenseDate,incomeNote,expenseNote;

+ (instancetype) sharedDataObj {
    
    static Singleton *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    
    return shared;
}


@end
