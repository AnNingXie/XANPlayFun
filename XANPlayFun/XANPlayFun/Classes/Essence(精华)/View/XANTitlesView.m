//
//  XANTitlesView.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/24.
//  Copyright © 2018年 谢安宁. All rights reserved.
//  自定义标题栏

#import "XANTitlesView.h"
#import "XANPublic.h"
#import "XANTitleButton.h"

#define underLineH 2 //下划线的高度
#define underLineY self.frame.size.height-underLineH//下划线的Y值

@interface XANTitlesView ()
/** 记录上一次的点击按钮 */
@property (nonatomic, weak) UIButton *previousButton;
@property (nonatomic, strong) UIView *underLine;//下划线
@end

@implementation XANTitlesView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initViews];//添加所有子控件
    }
    return self;
}

/**
 添加所有子控件
 */
-(void)initViews{
    self.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.5];
    //1.添加标题  创建五个标题按钮
    NSArray *titles=@[@"全部",@"视频",@"声音",@"图片",@"段子"];
    CGFloat titleButtonW=KScreenWidth/(titles.count);
    CGFloat titleButtonH=self.frame.size.height;
    CGFloat titleButtonY=0;
    for (int i=0; i<titles.count; i++) {
        XANTitleButton *titleButton=[XANTitleButton buttonWithType:UIButtonTypeCustom];
        CGFloat titleButtonX=titleButtonW*i;
        titleButton.frame=CGRectMake(titleButtonX, titleButtonY, titleButtonW, titleButtonH);
        titleButton.tag=i;
        titleButton.titleLabel.font=[UIFont systemFontOfSize:15];
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [self addSubview:titleButton];
    }
    
    //2.添加标题下划线
    XANTitleButton *firstButton=[self.subviews firstObject];
    UIView *underLine=[[UIView alloc]init];
    underLine.backgroundColor=[firstButton titleColorForState:UIControlStateSelected];
    underLine.frame=CGRectMake(0, underLineY, 70, underLineH);
    [self addSubview:underLine];
    _underLine=underLine;
   
    //3.默认第一个调用按钮
    [firstButton.titleLabel sizeToFit];
    [self titleButtonClick:firstButton];
}

/**
 标题点击执行此方法

 @param button <#button description#>
 */
-(void)titleButtonClick:(UIButton *)button{
    //1.按钮事件处理
    self.previousButton.selected=NO;//将上一次的按钮取消选中状态
    button.selected=YES;//这一次的点击事件为选中
    self.previousButton=button;//将这一次的点击按钮赋值给记录的点击按钮
   
    //2.点击标题滚动下划线
    //计算文字尺寸大小
    CGFloat underLineW=button.titleLabel.frame.size.width+10;//这种也可以计算
    CGFloat buttonW=button.frame.size.width;
    CGFloat underLineX=buttonW*((int)button.tag)+(buttonW-underLineW)*0.5;
    [UIView animateWithDuration:0.2 animations:^{
        self.underLine.frame=CGRectMake(underLineX, underLineY, underLineW, underLineH);
    }];
    
    //3.点击代理方法
    if ([self.delegate respondsToSelector:@selector(titleButtonClickWithTag:)]) {
        [self.delegate titleButtonClickWithTag:(int)button.tag];
    }
}

@end
