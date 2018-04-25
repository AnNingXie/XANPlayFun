//
//  XANTitlesView.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/24.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XANTitlesViewDelegate <NSObject>
@optional
//标题按钮点击事件
-(void)titleButtonClickWithTag:(int)buttonTag;

@end

@interface XANTitlesView : UIView
@property (nonatomic, weak) id<XANTitlesViewDelegate> delegate;

/**
 标题点击执行此方法
 
 @param button <#button description#>
 */
-(void)titleButtonClick:(UIButton *)button;

@end
