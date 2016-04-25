//
//  CustomFormView.h
//  CustomForm
//
//  Created by HChong on 16/4/21.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomFormTopCell, CustomFormLeftCell, CustomFormContentCell;
@protocol CustomFormViewDelegate <NSObject>

//cell显示
- (void)willDisplayTopCell:(CustomFormTopCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)willDisplayLeftCell:(CustomFormLeftCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)willDisplayContentCell:(CustomFormContentCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
//行数, 列数
-(NSInteger)numberOfRows;
-(NSInteger)numberOfColumns;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol CustomFormViewDataSource <NSObject>

//cell创建
- (UITableViewCell *)tableView:(UITableView *)tableView topCellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(UITableView *)tableView leftCellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(UITableView *)tableView contentCellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CustomFormView : UIView

@property(nonatomic, weak) id<CustomFormViewDelegate>delegate;
@property(nonatomic, weak) id<CustomFormViewDataSource>dataSource;
@end
