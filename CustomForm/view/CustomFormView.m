//
//  CustomFormView.m
//  CustomForm
//
//  Created by HChong on 16/4/21.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "CustomFormView.h"
#import "CustomFormBaseCell.h"
#import "CustomFormTopCell.h"
#import "CustomFormLeftCell.h"
#import "CustomFormContentCell.h"

@interface CustomFormView()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property(nonatomic, assign) NSInteger rowNumber;
@property(nonatomic, assign) NSInteger columnNumber;

@property(nonatomic, strong) UITableView *topTableView;
@property(nonatomic, strong) UITableView *leftTableView;
@property(nonatomic, strong) UIScrollView *contentScrollView;
@property(nonatomic, strong) UITableView *contentTableView;
@end

@implementation CustomFormView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubViews];
    }
    return self;
}



-(void)layoutSubviews {
    [super layoutSubviews];
    self.leftTableView.frame = CGRectMake(0, topCellHeight + 64, leftCellWidth, screenSize.height - (topCellHeight + 64));
}

-(void)setDelegate:(id<CustomFormViewDelegate>)delegate{
    if (_delegate != delegate) {
        _delegate = delegate;
    }
    _rowNumber = [_delegate numberOfRows];
    _columnNumber = [_delegate numberOfColumns];
    [self setContentSize];
}

-(void)setDataSource:(id<CustomFormViewDataSource>)dataSource{
    if (_dataSource != dataSource) {
        _dataSource = dataSource;
    }
}

-(void)setContentSize{
    self.contentScrollView.frame = CGRectMake(leftCellWidth, topCellHeight + 64, screenSize.width - leftCellWidth, screenSize.height - (topCellHeight + 64));
    self.contentScrollView.contentSize = CGSizeMake(topCellWidth * self.columnNumber, screenSize.height - (topCellHeight + 64));
    self.contentTableView.frame = CGRectMake(0, 0, self.contentScrollView.contentSize.width, screenSize.height - (topCellHeight + 64));
}

-(void)creatSubViews{
    self.topTableView = [[UITableView alloc] init];
    self.topTableView.center = CGPointMake((screenSize.width - leftCellWidth) / 2, screenSize.height / 2);
    self.topTableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.topTableView.frame = CGRectMake(leftCellWidth, 64, screenSize.width - leftCellWidth, topCellHeight);
    self.topTableView.delegate = self;
    self.topTableView.dataSource = self;
    self.topTableView.bounces = NO;
    self.topTableView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.topTableView];
    
    self.leftTableView = [[UITableView alloc] init];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    self.leftTableView.bounces = NO;
    self.leftTableView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.leftTableView];
    
    self.contentScrollView = [[UIScrollView alloc] init];
    self.contentScrollView.delegate = self;
    self.contentScrollView.bounces = NO;
    self.contentScrollView.showsVerticalScrollIndicator = NO;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.contentScrollView];
    
    self.contentTableView = [[UITableView alloc] init];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    self.contentTableView.bounces = NO;
    self.contentTableView.showsVerticalScrollIndicator = NO;
    [self.contentScrollView addSubview:self.contentTableView];
    
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.topTableView) {
        [self.delegate willDisplayTopCell:(CustomFormTopCell *)cell forRowAtIndexPath:indexPath];
    } else if (tableView == self.leftTableView) {
        [self.delegate willDisplayLeftCell:(CustomFormLeftCell *)cell forRowAtIndexPath:indexPath];
    } else {
        [self.delegate willDisplayContentCell:(CustomFormContentCell *)cell forRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.topTableView) {
        return topCellWidth;
    } else if (tableView == self.leftTableView) {
        return leftCellHeight;
    } else {
        return leftCellHeight;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.topTableView) {
        
    } else if (tableView == self.leftTableView) {
        
    } else {
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.topTableView) {
        return self.columnNumber;
    } else if (tableView == self.leftTableView) {
        return self.rowNumber;
    } else {
        return self.rowNumber;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (tableView == self.topTableView) {
        cell = [self.dataSource tableView:tableView topCellForRowAtIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (tableView == self.leftTableView) {
        cell = [self.dataSource tableView:tableView leftCellForRowAtIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        cell = [self.dataSource tableView:tableView contentCellForRowAtIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.topTableView) {
        self.contentScrollView.contentOffset = CGPointMake(self.topTableView.contentOffset.y, 0);
    } else if (scrollView == self.leftTableView) {
        self.contentTableView.contentOffset = CGPointMake(0, self.leftTableView.contentOffset.y);
    } else if (scrollView == self.contentTableView){
        self.leftTableView.contentOffset = CGPointMake(0, self.contentTableView.contentOffset.y);
    } else {
        self.topTableView.contentOffset = CGPointMake(0, self.contentScrollView.contentOffset.x);
    }
}














@end
