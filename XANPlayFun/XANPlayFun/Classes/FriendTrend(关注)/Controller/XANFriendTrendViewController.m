//
//  XANFriendTrendViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANFriendTrendViewController.h"
#import "XANPublic.h"
#import "XANLoginViewController.h"
@interface XANFriendTrendViewController ()

@end

@implementation XANFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的关注";
    self.view.backgroundColor=[UIColor grayColor];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithNormalImage:@"setting" highImage:@"setting" target:self action:@selector(left)];
    //添加所有子控件
    [self setUpViews];
}

-(void)left{
    
}

/**
 添加所有子控件
 */
-(void)setUpViews{
    //头像
    UIImageView *headImg=[[UIImageView alloc]init];
    headImg.image=[UIImage imageNamed:@"iconPlace"];
    headImg.contentMode=UIViewContentModeScaleAspectFit;
    headImg.layer.cornerRadius=40;
    headImg.layer.masksToBounds=YES;
    [self.view addSubview:headImg];
    [headImg autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [headImg autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:KScreenWidth*0.5];
    [headImg autoSetDimension:ALDimensionWidth toSize:80];
    [headImg autoSetDimension:ALDimensionHeight toSize:80];

    //提示文字
    UILabel *tip=[[UILabel alloc]init];
    tip.numberOfLines=0;
    tip.textColor=[UIColor redColor];
    tip.textAlignment=NSTextAlignmentCenter;
    tip.text=@"快快登录吧关注百思最牛人\n好友动态让你过把瘾儿\n欧耶~~~";
    [self.view addSubview:tip];
    [tip autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [tip autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:headImg withOffset:20];
    
    //登录注册按钮
    UIButton *loginBtn=[[UIButton alloc]init];
    loginBtn.backgroundColor=[UIColor redColor];
    [loginBtn setTitle:@"立即登录注册" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn autoSetDimension:ALDimensionWidth toSize:KScreenWidth*0.5];
    [loginBtn autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [loginBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:tip withOffset:50];
    [loginBtn autoSetDimension:ALDimensionHeight toSize:40];
}

/**
 立即登录注册
 */
-(void)login{
    XANLoginViewController *login=[[XANLoginViewController alloc]init];
    [self presentViewController:login animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
