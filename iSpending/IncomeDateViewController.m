

#import "IncomeDateViewController.h"

@interface ievrenosIncomeDateViewController ()

@property (weak, nonatomic) IBOutlet UIButton *selectDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation ievrenosIncomeDateViewController
NSDate *incomeDate;

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
    singletonObj1 = [ievrenosSingleton sharedDataObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectDate:(id)sender {
    
    incomeDate = [self.datePicker date];
    singletonObj1.incomeDate=incomeDate;
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:true completion:nil];
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
