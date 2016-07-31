

#import "ReportViewController.h"
#import "PieChart.h"

@interface ReportViewController ()
@property (weak, nonatomic) IBOutlet UILabel *expensePercentage;
@property (weak, nonatomic) IBOutlet UILabel *incomePercentage;


@end

@implementation ReportViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    singletonObj7 = [Singleton sharedDataObj];
    // PieChart *pieChart = [[PieChart alloc]init];
    //pieChart.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:pieChart];
}

-(void) viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    
    float x1 = [singletonObj7.income floatValue];
    float x2 = [singletonObj7.expense floatValue];
    float green;
    float red;
    float greenPercentage;
    float redPercentage;
    
    int total = x1+x2;
    
    //compare two numbers
    if(x1>x2) {
        green = x1/total;
        red = x2/total;
        
        
        //find percentage
        redPercentage = red * 100;
        NSString *redPercentageString = [NSString stringWithFormat:@"%.2f",redPercentage];
        [self.expensePercentage setText:redPercentageString];
        
        greenPercentage = green * 100;
        NSString *greenPercentageString = [NSString stringWithFormat:@"%.2f",greenPercentage];
        [self.incomePercentage setText:greenPercentageString];
        
        
        
    } else if (x2>x1){
        red = x2/total;
        green = x1 / total;
        
        //find percentage
        redPercentage = red * 100;
        NSString *redPercentageString = [NSString stringWithFormat:@"%.2f",redPercentage];
        [self.expensePercentage setText:redPercentageString];
        
        greenPercentage = green * 100;
        NSString *greenPercentageString = [NSString stringWithFormat:@"%.2f",greenPercentage];
        [self.incomePercentage setText:greenPercentageString];
    }
    
    PieChart *pieChart = [[PieChart alloc] initWithFrame:CGRectMake(0, -80, self.view.frame.size.width, self.view.frame.size.height)];
    pieChart.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pieChart];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
