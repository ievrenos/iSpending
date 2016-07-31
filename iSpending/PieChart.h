

#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface PieChart : UIView

{
    
    Singleton *singletonObj6;
    
}

@property (nonatomic, assign) CGFloat circleRadius;
@property (nonatomic, retain) NSArray *sliceArray;
@property (nonatomic, retain) NSArray *colorsArray;

- (void)drawPieChart:(CGContextRef)context;


@end
