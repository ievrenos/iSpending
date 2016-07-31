

#import "ExpenseCategoryViewController.h"

@interface ExpenseCategoryViewController ()

@property (strong, nonatomic) NSArray *categoryNames;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UIButton *select;

@end

@implementation ExpenseCategoryViewController

NSString *expenseCategory;

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
    singletonObj8 = [Singleton sharedDataObj];
    // Do any additional setup after loading the view.
    self.categoryNames = @[@"General Expense", @"Bills", @"Clothes",@"Food",@"Entertainment",
                           @"Personal", @"Transportation", @"Education",@"Home",@"Medical",@"Insurance"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)select:(id)sender {
    NSInteger row = [self.categoryPicker selectedRowInComponent:0];
    expenseCategory = self.categoryNames[row];
    singletonObj8.expenseCategory = expenseCategory;
    
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark -
#pragma mark - Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
    return 1;
}

#pragma mark - Picker Delegate Methods
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component

{
    return [self.categoryNames count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return self.categoryNames[row];
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
