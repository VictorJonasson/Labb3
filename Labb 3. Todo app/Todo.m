//
//  Todo.m
//  Labb 3. Todo app
//
//  Created by Victor Jonasson on 2021.
//  Copyright © 2021 Victor Jonasson. All rights reserved.
//

#import "Todo.h"

@implementation Todo

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
