//
//  XANLoginTopView.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XANLoginTopViewDeleagte <NSObject>
@optional
-(void)clickCloseButton;//点击了关闭按钮
-(void)isHaveAccount:(UIButton *)button;//是否已经有账号
@end

@interface XANLoginTopView : UIView

@property (nonatomic, weak) id <XANLoginTopViewDeleagte> delegate;

@end
