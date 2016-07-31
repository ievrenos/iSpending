

#import "AccountViewController.h"

@interface AccountViewController ()
@property (weak, nonatomic) IBOutlet UIButton *addIncome;
@property (weak, nonatomic) IBOutlet UIButton *addExpense;
@property (weak, nonatomic) IBOutlet UILabel *incomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *expenseLabel;
@property (weak, nonatomic) IBOutlet UILabel *savingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *savings;
@property (weak, nonatomic) IBOutlet UILabel *incomeDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *incomeCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *incomeNoteLabel;
@property (weak, nonatomic) IBOutlet UILabel *expenseDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *expenseCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *expenseNoteLabel;

@end

@implementation AccountViewController


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
    singletonObj2 = [Singleton sharedDataObj];
}

-(void) viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    
    [self.incomeLabel setText:[singletonObj2.income stringValue]];
    [self.expenseLabel setText:[singletonObj2.expense stringValue]];
    
    NSInteger income = [singletonObj2.income integerValue];
    NSInteger expense = [singletonObj2.expense integerValue];
    NSInteger saving = income - expense;
    
    if (saving<0) {
        [self.savings setTextColor:[UIColor redColor]];
    } else if (saving>0)
        [self.savings setTextColor:[UIColor greenColor]];
    NSString *savings = [NSString stringWithFormat:@"%ld", (long)saving];
    NSString *incomes = [NSString stringWithFormat:@"%ld", (long)income];
    NSString *expenses = [NSString stringWithFormat:@"%ld", (long)expense];
    
    [self.incomeLabel setText:incomes];
    [self.expenseLabel setText:expenses];
    [self.savingsLabel setText:savings];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"MM/dd/yyyy HH:mm"];
    NSString *incomeDate = [timeFormatter stringFromDate:singletonObj2.incomeDate];
    NSString *expenseDate = [timeFormatter stringFromDate:singletonObj2.expenseDate];
    
    [self.incomeDateLabel setText:incomeDate];
    [self.incomeCategoryLabel setText:singletonObj2.incomeCategory];
    [self.incomeNoteLabel setText:singletonObj2.incomeNote];
    
    [self.expenseDateLabel setText:expenseDate];
    [self.expenseCategoryLabel setText:singletonObj2.expenseCategory];
    [self.expenseNoteLabel setText:singletonObj2.expenseNote];
    
    
}

-(void) viewWillDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addIncomePressed:(UIButton *)sender {
}
- (IBAction)addExpensePressed:(UIButton *)sender {
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
