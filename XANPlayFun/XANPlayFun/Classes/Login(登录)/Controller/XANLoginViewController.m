//
//  XANLoginViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANLoginViewController.h"
#import "XANPublic.h"
#import "XANLoginTopView.h"
#import "XANLoginMiddleView.h"
#import "XANLoginBottomView.h"

//登录方式
typedef NS_ENUM(NSInteger, loginType) {
    loginTypeQQ,
    loginTypeSina,
    loginTypeTenXun
};


@interface XANLoginViewController ()<XANLoginTopViewDeleagte,XANLoginBottomViewDelegate>

@end

@implementation XANLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //添加所有子控件
    [self setUpViews];
}

/**
 添加所有子控件
 */
-(void)setUpViews{
    
    UIImageView *bgImage=[[UIImageView alloc]initWithFrame:self.view.frame];
    bgImage.image=[UIImage imageNamed:@"loginBg"];
    [self.view addSubview:bgImage];
    
    XANLoginTopView *topView=[[XANLoginTopView alloc]init];
    topView.delegate=self;
    [self.view addSubview:topView];
    [topView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:NaviHeight];
    [topView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [topView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [topView autoSetDimension:ALDimensionHeight toSize:35];
    
    XANLoginMiddleView *middleView=[[XANLoginMiddleView alloc]init];
    [self.view addSubview:middleView];
    [middleView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:50];
    [middleView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [middleView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [middleView autoSetDimension:ALDimensionHeight toSize:250];
    
    XANLoginBottomView *bottomView=[[XANLoginBottomView alloc]init];
    bottomView.delegate=self;
    bottomView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:bottomView];
    [bottomView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:BottomHeight];
    [bottomView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [bottomView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [bottomView autoSetDimension:ALDimensionHeight toSize:150];

}

#pragma mark---XANLoginTopViewDeleagte
//点击了关闭按钮
-(void)clickCloseButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//是否已有账户
-(void)isHaveAccount:(UIButton *)button{
    button.selected=!button.selected;
    if (button.selected) {//注册账户
       
    }else{//已有账号
      
    }
}

#pragma mark----XANLoginBottomViewDelegate
//快速登录
-(void)fastLoginWithTypeTag:(int)buttonTag{
    switch (buttonTag) {
        case loginTypeQQ:
            XANLog(@"QQ登录");
            [XANProgressHUD showTipMessage:@"QQ登录"];
            break;
        case loginTypeSina:
            XANLog(@"微博登录");
            [XANProgressHUD showTipMessage:@"微博登录"];
            break;
        case loginTypeTenXun:
            XANLog(@"腾讯微博");
            [XANProgressHUD showTipMessage:@"腾讯微博"];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
