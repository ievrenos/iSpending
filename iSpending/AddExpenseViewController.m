

#import "AddExpenseViewController.h"

@interface AddExpenseViewController ()
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end

@implementation AddExpenseViewController

NSNumber *expense;
NSString *expenseNote;
NSString *expenseCategory;
NSDate *expenseDate;

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
     singletonObj4 = [Singleton sharedDataObj];
}


-(void) viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    if(singletonObj4.expenseCategory!=NULL) {
        _categoryLabel.hidden = NO;
        expenseCategory = singletonObj4.expenseCategory;
        [self.categoryLabel setText:expenseCategory];
    }
    
    if(singletonObj4.expenseDate!=NULL){
        _dateLabel.hidden = NO;
        expenseDate = singletonObj4.expenseDate;
        
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        [timeFormatter setDateFormat:@"MM/dd/yyyy HH:mm"];
        NSString *time = [timeFormatter stringFromDate:expenseDate ];
        
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
        expense= [f numberFromString:amountEntered];
        
        expenseNote = self.noteTextField.text;
        
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

- (IBAction)saved:(id)sender {
    singletonObj4.expense=expense;
    singletonObj4.expenseCategory = expenseCategory;
    singletonObj4.expenseDate = expenseDate;
    singletonObj4.expenseNote= expenseNote;
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
