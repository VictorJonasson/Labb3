//
//  CompletedTableViewCell.m
//  Labb 3. Todo app
//
//  Created by Victor Jonasson on 2021-01-22.
//  Copyright © 2021 Victor Jonasson. All rights reserved.
//

#import "CompletedTableViewCell.h"

@implementation CompletedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd.MM.YY HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    _dateLabel.text = dateString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
