
#import "NewTaskViewController.h"
#import "Todo.h"
#import "TodoList.h"


@interface NewTaskViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldTask;
@property (nonatomic) TodoList *todoList;
@end

@implementation NewTaskViewController
//View för ny Todo
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Ny uppgift"];
}
//Lägg till uppgift i via SetData i singleton
- (IBAction)addTaskBtn:(id)sender {
    NSString *todoString = _textFieldTask.text;
    [[Singleton Instance] SetData:todoString];
    NSMutableArray *activeControllerArray =  [self.navigationController.viewControllers mutableCopy];
    [activeControllerArray removeObjectAtIndex:1];
    self.navigationController.viewControllers = activeControllerArray;
}
@end
