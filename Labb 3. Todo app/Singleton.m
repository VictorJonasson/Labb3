//
//  Singleton.m
//  Labb 3. Todo app
//
//  Created by Victor Jonasson on 2021-01-21.
//  Copyright © 2021 Victor Jonasson. All rights reserved.
//

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
