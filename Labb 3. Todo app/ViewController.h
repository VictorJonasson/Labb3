#import <UIKit/UIKit.h>
#import "TodoList.h"
#import "Singleton.h"

NS_ASSUME_NONNULL_BEGIN


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;

@property (nonatomic) TodoList *todoList;

@end

NS_ASSUME_NONNULL_END
