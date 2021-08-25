//
//  Singleton.h
//  Labb 3. Todo app
//
//  Created by Victor Jonasson on 2021-01-21.
//  Copyright © 2021 Victor Jonasson. All rights reserved.
//

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
