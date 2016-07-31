

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property (nonatomic,retain) NSNumber* income;
@property (nonatomic,retain) NSNumber* expense;
@property (nonatomic,retain) NSNumber* incomePercentage;
@property (nonatomic,retain) NSNumber* expensePercentage;
@property (nonatomic,strong) NSString* incomeCategory;
@property (nonatomic,strong) NSString* expenseCategory;
@property (nonatomic,strong) NSString* incomeNote;
@property (nonatomic,strong) NSString* expenseNote;
@property (nonatomic,strong) NSDate* incomeDate;
@property (nonatomic,strong) NSDate* expenseDate;

+(instancetype) sharedDataObj;

@end
