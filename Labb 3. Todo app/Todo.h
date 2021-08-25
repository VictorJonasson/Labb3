//
//  Todo.h
//  Labb 3. Todo app
//
//  Created by Victor Jonasson on 2021.
//  Copyright © 2021 Victor Jonasson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Todo : NSObject

@property (nonatomic, strong) NSString* name;
- (instancetype)initWithName:(NSString *) name;
- (NSString*) getTodo;




@end

NS_ASSUME_NONNULL_END
