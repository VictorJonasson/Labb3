//
//  ViewController.h
//  Labb 3. Todo app
//
//  Created by Victor Jonasson on 2021.
//  Copyright © 2021 Victor Jonasson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoList.h"
#import "Singleton.h"




NS_ASSUME_NONNULL_BEGIN


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;

@property (nonatomic) TodoList *todoList;



@end

NS_ASSUME_NONNULL_END
