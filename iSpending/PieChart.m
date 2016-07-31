

#import "PieChart.h"


@implementation PieChart


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    
    
        singletonObj6 = [Singleton sharedDataObj];
        
        float x1 = [singletonObj6.income intValue];
        float x2 = [singletonObj6.expense intValue];
        float green;
        float red;
        
        int total = x1+x2;
        
        
        //compare two numbers
        if(x1>x2) {
            green = x1/total;
            red = x2/total;
        }
        
        else if (x2>x1){
            red = x2/total;
            green = x1 / total;
        }

        

        // Set up the slices
        NSArray *slices = [NSArray arrayWithObjects:[NSNumber numberWithFloat:green],
                           [NSNumber numberWithFloat:red],
                           nil];
        self.sliceArray = slices;
        
        // Set up the colors for the slices
        NSArray *colors = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor,
                           (id)[UIColor redColor].CGColor, nil];
        self.colorsArray = colors;
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{
 CGContextRef context = UIGraphicsGetCurrentContext();
 [self drawPieChart:context];
}


- (void)drawPieChart:(CGContextRef)context  {
    CGPoint circleCenter = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    // Set the radius of the pie chart
    self.circleRadius = 135;
    
    for (NSUInteger i = 0; i < [_sliceArray count]; i++) {
        
        // Determine start angle
        CGFloat startValue = 0;
        for (int k = 0; k < i; k++) {
            startValue += [[_sliceArray objectAtIndex:k] floatValue];
        }
        CGFloat startAngle = startValue * 2 * M_PI - M_PI/2;
        
        // Determine end angle
        CGFloat endValue = 0;
        for (int j = i; j >= 0; j--) {
            endValue += [[_sliceArray objectAtIndex:j] floatValue];
        }
        CGFloat endAngle = endValue * 2 * M_PI - M_PI/2;
        
        CGContextSetFillColorWithColor(context, (CGColorRef)[_colorsArray objectAtIndex:i]);
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
        CGContextAddArc(context, circleCenter.x, circleCenter.y, self.circleRadius, startAngle, endAngle, 0);
        CGContextClosePath(context);
        CGContextFillPath(context);
        
        
    }
}


@end
