
#import <Foundation/Foundation.h>
#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject {
    NSString *data;
}
+ (id) Instance;
- (void) SetData:(NSString*) value;
- (NSString*) GetData;


@end

NS_ASSUME_NONNULL_END
