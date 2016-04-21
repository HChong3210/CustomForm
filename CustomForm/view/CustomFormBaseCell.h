//
//  CustomFormBaseCell.h
//  CustomForm
//
//  Created by HChong on 16/4/21.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat const topCellWidth = 100;
static CGFloat const topCellHeight = 50;

static CGFloat const leftCellWidth = 100;
static CGFloat const leftCellHeight = 50;

@interface CustomFormBaseCell : UITableViewCell

@property(nonatomic, strong) UIView *customView;
-(void)fillValues:(id)obj;
@end
