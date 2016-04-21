//
//  CustomFormContentCell.m
//  CustomForm
//
//  Created by HChong on 16/4/21.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "CustomFormContentCell.h"

@interface CustomFormContentCell()

@property(nonatomic, strong) NSMutableArray *labelArray;
@end

@implementation CustomFormContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)setRowArray:(NSArray *)rowArray {
    if (_rowArray != rowArray) {
        _rowArray = rowArray;
    }
    self.labelArray = [NSMutableArray arrayWithCapacity:0];
    [[self.customView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [rowArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(topCellHeight * idx, 0, topCellHeight, topCellWidth)];
        label.layer.borderWidth = 1;
        label.layer.borderColor = [UIColor redColor].CGColor;
        [self.customView addSubview:label];
    }];
}

-(void)fillValues:(id)obj{
    NSString *string = obj;
    [self.labelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = obj;
        label.text = string;
    }];
}
@end
