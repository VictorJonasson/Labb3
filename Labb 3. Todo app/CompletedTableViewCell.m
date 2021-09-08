
#import "CompletedTableViewCell.h"

@implementation CompletedTableViewCell
//hämta och sätt datum för avklarad todo
- (void)awakeFromNib {
    [super awakeFromNib];
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd.MM.YY"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    _dateLabel.text = dateString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
