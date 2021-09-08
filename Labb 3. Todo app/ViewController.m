
#import "ViewController.h"
#import "TodoList.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *checkBtn;

 
@end

@implementation ViewController
//Viewdidload
//ladda sparat state, sätt titel på view
- (void)viewDidLoad {
    [super viewDidLoad];
    _todoList = [[TodoList alloc] init];
    [self loadState];
    [self.navigationItem setTitle:@"Todo"];
    self.tableViewOutlet.delegate = self;
    self.tableViewOutlet.dataSource = self;
}
//Hämta data från singleton
- (void)viewDidAppear:(BOOL)animated {
    if ([[Singleton Instance] GetData] != nil && ![[[Singleton Instance]GetData] isEqualToString:@""]) {
         [_todoList createTodo:[[Singleton Instance] GetData]];
    }
    [self.tableViewOutlet reloadData];
    [[Singleton Instance] SetData:@""];
    [self saveState];

}

//skapa celler
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
//dequea/returnera celler vid overflow
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellB" forIndexPath:indexPath];
        cell.textLabel.text = [_todoList.favoriteItems[indexPath.row] getTodo];
        return cell;
    }
    if (indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellA" forIndexPath:indexPath];
        cell.textLabel.text = [_todoList.todoItems[indexPath.row] getTodo];
        return cell;
    }
    if (indexPath.section == 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellC" forIndexPath:indexPath];
        cell.textLabel.text = [_todoList.completedItems[indexPath.row] getTodo];
        return cell;
    }
    return cell;
}
//namnge cellerna
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return _todoList.favoriteItems.count;
    }
    
    if (section == 1) {
        return _todoList.todoItems.count;
    }
    
    if (section == 2) {
        return _todoList.completedItems.count;
    } else {
        return 0;
    }
}
        
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

switch (section) {
case 0:
    return @"Viktikt";
    break;
case 1:
    return @"Todos";
    break;
case 2:
    return @"Avklarat";
    break;
default:
    return nil;
    break;
    }
}
//uppgift klar, lägg till objekt i avklarat-cellen, ta bort från att göra, ladda om
-(IBAction)btnFinished:(UIButton *)sender event:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPos = [touch locationInView:self.tableViewOutlet];
    NSIndexPath *indexPath = [self.tableViewOutlet  indexPathForRowAtPoint:touchPos];
    if(indexPath != nil){
        [_todoList.completedItems addObject:_todoList.todoItems[indexPath.row]];
        [_todoList.todoItems removeObjectAtIndex:indexPath.row];
        [self.tableViewOutlet reloadData];
        [self saveState];
    }
}
//Ta bort färdig uppgift från completed.Items, ladda om
-(IBAction)btnRemoveCompleted:(UIButton *)sender event:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPos = [touch locationInView:self.tableViewOutlet];
    NSIndexPath *indexPath = [self.tableViewOutlet  indexPathForRowAtPoint:touchPos];
    if(indexPath != nil){
        [_todoList.completedItems removeObjectAtIndex:indexPath.row];
        [self.tableViewOutlet reloadData];
        [self saveState];
    }
}
//Ta bort favorit och lägg till i completed.Items,ladda om
-(IBAction)btnRemoveFavorite:(UIButton *)sender event:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPos = [touch locationInView:self.tableViewOutlet];
    NSIndexPath *indexPath = [self.tableViewOutlet  indexPathForRowAtPoint:touchPos];
    if(indexPath != nil){
        [_todoList.completedItems addObject:_todoList.favoriteItems[indexPath.row]];
        [_todoList.favoriteItems removeObjectAtIndex:indexPath.row];
        [self.tableViewOutlet reloadData];
        [self saveState];
    }
}
//Lägg till i favorit-listan och ta bort från todo, ladda om data
-(IBAction)btnImportantPressed:(UIButton *)sender event:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPos = [touch locationInView:self.tableViewOutlet];
    NSIndexPath *indexPath = [self.tableViewOutlet  indexPathForRowAtPoint:touchPos];
    if(indexPath != nil){
        [_todoList.favoriteItems addObject:_todoList.todoItems[indexPath.row]];
        [_todoList.todoItems removeObjectAtIndex:indexPath.row];
        [self.tableViewOutlet reloadData];
        [self saveState];
    }
}


//sätt upp state funktionalitet för arrayer
-(void) saveState{
    NSMutableArray *todos = [[NSMutableArray alloc]init];
    NSMutableArray *todosComplete = [[NSMutableArray alloc]init];
    NSMutableArray *todosImportant = [[NSMutableArray alloc]init];
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    
    todos = [self.todoList convertTodosToArr];
    todosComplete = [self.todoList convertCompletedToArr];
    todosImportant = [self.todoList convertImportantToArr];
    
    [userDef setObject:todos forKey:@"todoitems"];
    [userDef setObject:todosComplete forKey:@"todocomplete"];
    [userDef setObject:todosImportant forKey:@"todoimportant"];
    [userDef synchronize];
}
//ladda state
-(void) loadState {
    NSArray *todos = [[NSArray alloc]init];
    NSArray *todosComplete = [[NSArray alloc]init];
    NSArray *todosImportant = [[NSArray alloc]init];
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    NSLog(@"loaded : %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"todoitems"]);
    
    todos = [userDef arrayForKey:@"todoitems"];
    todosComplete = [userDef arrayForKey:@"todocomplete"];
    todosImportant = [userDef arrayForKey:@"todoimportant"];
    //loopa igenom todos array
    for (int i = 0; i < todos.count; i++) {
        Todo *todo = [[Todo alloc]initWithName:todos[i]];
        [self.todoList.todoItems addObject:todo];
    }
    //loopa igenom avklarade array
    for (int i = 0; i < todosComplete.count; i++) {
        Todo *todo = [[Todo alloc]initWithName:todosComplete[i]];
        [self.todoList.completedItems addObject:todo];
    }
    //loopa igenom favoriter array
    for (int i = 0; i < todosImportant.count; i++) {
        Todo *todo = [[Todo alloc]initWithName:todosImportant[i]];
        [self.todoList.favoriteItems addObject:todo];
    }
}

@end
