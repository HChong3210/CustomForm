//
//  CustomFormTopCell.m
//  CustomForm
//
//  Created by HChong on 16/4/21.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "CustomFormTopCell.h"

@interface CustomFormTopCell()

@property(nonatomic, strong)UILabel *label;
@end

@implementation CustomFormTopCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubViews];
        self.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.label.frame = CGRectMake(0, 0, topCellWidth, topCellHeight);
}

-(void)creatSubViews{
    self.label = [[UILabel alloc] init];
    self.label.layer.borderWidth = 1;
    self.label.layer.borderColor = [UIColor greenColor].CGColor;
    self.label.backgroundColor = [UIColor lightGrayColor];
    self.label.textAlignment = NSTextAlignmentRight;
    [self.customView addSubview:self.label];
}

-(void)fillValues:(id)obj{
    self.label.text = obj;
}
@end
