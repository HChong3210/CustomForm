//
//  CustomFormView.h
//  CustomForm
//
//  Created by HChong on 16/4/21.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomFormViewDelegate <NSObject>


@end

@protocol CustomFormViewDataSource <NSObject>


@end

@interface CustomFormView : UIView

@property(nonatomic, weak) id<CustomFormViewDelegate>delegate;
@property(nonatomic, weak) id<CustomFormViewDataSource>dataSource;
@end
