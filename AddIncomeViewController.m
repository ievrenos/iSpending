

#import "AddIncomeViewController.h"

@interface AddIncomeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end

@implementation AddIncomeViewController

NSNumber *incomeAmount;
NSString *incomeNote;
NSString *incomeCategory;
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
     singletonObj5 = [Singleton sharedDataObj];
    
    }


-(void) viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    
    if(singletonObj5.incomeCategory!=NULL) {
        _categoryLabel.hidden = NO;
        incomeCategory = singletonObj5.incomeCategory;
        [self.categoryLabel setText:incomeCategory];
    }
    
    if(singletonObj5.incomeDate!=NULL){
        _dateLabel.hidden = NO;
        incomeDate = singletonObj5.incomeDate;
        
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        [timeFormatter setDateFormat:@"MM/dd/yyyy HH:mm"];
        NSString *time = [timeFormatter stringFromDate:incomeDate ];
        
        [self.dateLabel setText:time];
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDoneEditing:(id)sender {
    
    if (self.amountTextField.text.length <1) {
        [self alertPopUp];
    }
    else{
        
        NSString *amountEntered = self.amountTextField.text;
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        incomeAmount= [f numberFromString:amountEntered];
        
        incomeNote = self.noteTextField.text;

        [sender resignFirstResponder];
       
    }
    
}

- (IBAction)backgroundTap:(id)sender {
    [self.amountTextField resignFirstResponder];
    [self.noteTextField resignFirstResponder];
}


-(void) alertPopUp {
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"The text field cannot be empty"
                          message:nil
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)saved:(id)sender{

    singletonObj5.income=incomeAmount;
    singletonObj5.incomeCategory = incomeCategory;
    singletonObj5.incomeDate = incomeDate;
    singletonObj5.incomeNote=incomeNote;
    
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
