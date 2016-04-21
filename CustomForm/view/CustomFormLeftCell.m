//
//  CustomFormLeftCell.m
//  CustomForm
//
//  Created by HChong on 16/4/21.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "CustomFormLeftCell.h"

@interface CustomFormLeftCell()

@property(nonatomic, strong)UILabel *label;
@end

@implementation CustomFormLeftCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubViews];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.label.frame = CGRectMake(0, 0, leftCellWidth, leftCellHeight);
}

-(void)creatSubViews{
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, topCellHeight, topCellWidth)];
    self.label.layer.borderWidth = 1;
    self.label.layer.borderColor = [UIColor redColor].CGColor;
    [self.customView addSubview:self.label];
}

-(void)fillValues:(id)obj{
    self.label.text = obj;
}
@end
