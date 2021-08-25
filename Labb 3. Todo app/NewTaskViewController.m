//
//  NewTaskViewController.m
//  Labb 3. Todo app
//
//  Created by Victor Jonasson on 2021.
//  Copyright © 2021 Victor Jonasson. All rights reserved.
//

#import "NewTaskViewController.h"
#import "Todo.h"
#import "TodoList.h"


@interface NewTaskViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldTask;
@property (nonatomic) TodoList *todoList;

@end

@implementation NewTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Ny uppgift"];
    
    
    
}
- (IBAction)addTaskBtn:(id)sender {
    NSString *todoString = _textFieldTask.text;
    [[Singleton Instance] SetData:todoString];
    
    NSMutableArray *activeControllerArray =  [self.navigationController.viewControllers mutableCopy];
    [activeControllerArray removeObjectAtIndex:1];
    self.navigationController.viewControllers = activeControllerArray;
    
}


@end
