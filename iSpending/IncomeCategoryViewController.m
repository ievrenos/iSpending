

#import "IncomeCategoryViewController.h"

@interface IncomeCategoryViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (strong, nonatomic) NSArray *categoryNames;
@property (weak, nonatomic) IBOutlet UIButton *select;

@end

@implementation IncomeCategoryViewController

NSString *incomeCategory;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)select:(id)sender {
    
    NSInteger row = [self.categoryPicker selectedRowInComponent:0];
    incomeCategory = self.categoryNames[row];
    singletonObj3.incomeCategory = incomeCategory;
        
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    singletonObj3 = [Singleton sharedDataObj];
    self.categoryNames = @[@"General Income", @"Salary", @"Investment",@"Gift",@"Business"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
