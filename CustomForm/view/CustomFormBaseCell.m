//
//  CustomFormBaseCell.m
//  CustomForm
//
//  Created by HChong on 16/4/21.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "CustomFormBaseCell.h"

@implementation CustomFormBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSubViews];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.customView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

-(void)setSubViews{
    self.customView = [[UIView alloc] init];
    [self addSubview:self.customView];
}

-(void)fillValues:(id)obj{
    
}
@end
