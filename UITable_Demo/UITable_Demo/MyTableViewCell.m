//
//  MyTableViewCell.m
//  UITable_Demo
//
//  Created by 仝兴伟 on 2018/1/21.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "MyTableViewCell.h"
@interface MyTableViewCell ()

@property (nonatomic, strong) UIImageView *imageviews;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *buttons;

@end
@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addTableviewcell];
    }
    return self;
}

- (void)addTableviewcell {
    self.imageviews = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
    self.imageviews.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.imageviews];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, 200, 20)];
    self.titleLabel.text = @"这是一个要获取的";
    [self.contentView addSubview:self.titleLabel];
    
    self.textFields = [[UITextField alloc]initWithFrame:CGRectMake(80, 50, 200, 30)];
    self.textFields.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.textFields];
}

-(void)setInputString:(NSString *)inputString {
    _inputString = inputString;
    self.textFields.text = inputString;
}



@end
