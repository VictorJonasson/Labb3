
#import <Foundation/Foundation.h>
#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN

@interface TodoList : NSObject

@property (nonatomic) NSMutableArray *todoItems;
@property (nonatomic) NSMutableArray *completedItems;
@property (nonatomic) NSMutableArray *favoriteItems;

- (void) createTodo:(NSString*) name;
- (NSInteger) getSize;

- (NSMutableArray*) convertTodosToArr;
- (NSMutableArray *)convertCompletedToArr;
- (NSMutableArray *)convertImportantToArr;

@end

NS_ASSUME_NONNULL_END
