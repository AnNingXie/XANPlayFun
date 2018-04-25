//
//  XANLoginMiddleView.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANLoginMiddleView.h"
#import "XANPublic.h"
@implementation XANLoginMiddleView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)initViews{
    NSArray *placeHolders=@[@"手机号",@"密码"];
    for (int i=0; i<placeHolders.count; i++) {
        UITextField *textField=[[UITextField alloc]init];
        textField.backgroundColor=[UIColor redColor];
        textField.placeholder=placeHolders[i];
        [self addSubview:textField];
        [textField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
        [textField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
        [textField autoSetDimension:ALDimensionHeight toSize:40];
        [textField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40*i+20];
        if (i==0) {
            UIView *line=[[UIView alloc]init];
            line.backgroundColor=XANRGBColor(225, 225, 255);
            [textField addSubview:line];
            [line autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
            [line autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
            [line autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
            [line autoSetDimension:ALDimensionHeight toSize:1];
        }
    }
    //登录按钮
    UIButton *loginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.backgroundColor=[UIColor redColor];
    loginBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [self addSubview:loginBtn];
    [loginBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [loginBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [loginBtn autoSetDimension:ALDimensionHeight toSize:40];
    [loginBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:50];

    //忘记密码
    UIButton *forgetBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forget) forControlEvents:UIControlEventTouchUpInside];
    forgetBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [self addSubview:forgetBtn];
    [forgetBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [forgetBtn autoSetDimension:ALDimensionHeight toSize:40];
    [forgetBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:loginBtn withOffset:5];
    
    
    
}

/**
 登录
 */
-(void)login{
    
}

/**
 忘记密码
 */
-(void)forget{
    
}
@end
