//
//  CustomFormController.m
//  CustomForm
//
//  Created by HChong on 16/4/21.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "CustomFormController.h"
#import "CustomFormView.h"
#import "CustomFormBaseCell.h"
#import "CustomFormTopCell.h"
#import "CustomFormLeftCell.h"
#import "CustomFormContentCell.h"

@interface CustomFormController()<CustomFormViewDelegate, CustomFormViewDataSource>

@property(nonatomic, strong) CustomFormView *formView;
@property(nonatomic, strong) NSArray *rowArray;
@property(nonatomic, strong) NSArray *columnArray;
@end

@implementation CustomFormController

- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.rowArray = @[@"1", @"2", @"3", @"1", @"2", @"3", @"1", @"2", @"3", @"1", @"2", @"3", @"1", @"2", @"4"];
    self.columnArray = @[@"A", @"B", @"C", @"D", @"A", @"B", @"C", @"D", @"A", @"B", @"C", @"D", @"A", @"B", @"C", @"D", @"A", @"B", @"F", @"E"];
    self.automaticallyAdjustsScrollViewInsets = NO;
     self.formView = [[CustomFormView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height - topCellWidth)];
    self.formView.delegate = self;
    self.formView.dataSource = self;
    [self.view addSubview:self.formView];
}

#pragma mark - CustomFormViewDelegate, CustomFormViewDataSource
//cell显示
- (void)willDisplayTopCell:(CustomFormTopCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [cell fillValues:self.rowArray[indexPath.row]];
}
- (void)willDisplayLeftCell:(CustomFormLeftCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [cell fillValues:self.columnArray[indexPath.row]];
}
- (void)willDisplayContentCell:(CustomFormContentCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.rowArray = self.rowArray;
    [cell fillValues:self.columnArray[indexPath.row]];
}
//行数, 列数
-(NSInteger)numberOfRows{
    return self.columnArray.count;
}
-(NSInteger)numberOfColumns{
    return self.rowArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

//cell创建
- (UITableViewCell *)tableView:(UITableView *)tableView topCellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [[CustomFormTopCell class] description];
    CustomFormTopCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CustomFormTopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (UITableViewCell *)tableView:(UITableView *)tableView leftCellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [[CustomFormLeftCell class] description];
    CustomFormLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CustomFormLeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (UITableViewCell *)tableView:(UITableView *)tableView contentCellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [[CustomFormContentCell class] description];
    CustomFormContentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CustomFormContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

@end
