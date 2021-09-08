
#import "Todo.h"

@implementation Todo
//sakapa en todo och returnera
- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (NSString *)getTodo {
    return self.name;
}

@end
