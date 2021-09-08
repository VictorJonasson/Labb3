
#import "Singleton.h"

@implementation Singleton

static Singleton *instance = nil;

+ (id) Instance {
    if (instance == nil) {
        instance = [[Singleton alloc] init];
    }
    return instance;
}

- (void) SetData:(NSString*)value    {
    data = value;
}
- (NSString*) GetData {
    return data;
}

@end
