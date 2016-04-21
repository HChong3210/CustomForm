//
//  CustomFormView.m
//  CustomForm
//
//  Created by HChong on 16/4/21.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "CustomFormView.h"

@interface CustomFormView()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property(nonatomic, strong) UITableView *topTableView;
@property(nonatomic, strong) UITableView *leftTableView;
@property(nonatomic, strong) UIScrollView *contentScrollView;
@property(nonatomic, strong) UITableView *contentTableView;
@end

@implementation CustomFormView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];

}


@end
