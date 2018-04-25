//
//  XANLoginTopView.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANLoginTopView.h"
#import "XANPublic.h"
@implementation XANLoginTopView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)initViews{
    //关闭按钮
    UIButton *closeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setTitle:@"×" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
    [closeBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [closeBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [closeBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [closeBtn autoSetDimension:ALDimensionWidth toSize:35];
    
    //注册账号按钮
    UIButton *registBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    [registBtn setTitle:@"已有账号？" forState:UIControlStateSelected];
    registBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(regist:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:registBtn];
    [registBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [registBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [registBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [registBtn autoSetDimension:ALDimensionWidth toSize:100];
}

/**
 关闭按钮
 */
-(void)close{
    if ([self.delegate respondsToSelector:@selector(clickCloseButton)]) {
        [self.delegate clickCloseButton];
    }
}

/**
 点击了注册账户,已有账户
 @param button <#button description#>
 */
-(void)regist:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(isHaveAccount:)]) {
        [self.delegate isHaveAccount:button];
    }
}

@end
