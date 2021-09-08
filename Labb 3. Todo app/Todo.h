
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Todo : NSObject

@property (nonatomic, strong) NSString* name;
- (instancetype)initWithName:(NSString *) name;
- (NSString*) getTodo;

@end

NS_ASSUME_NONNULL_END
