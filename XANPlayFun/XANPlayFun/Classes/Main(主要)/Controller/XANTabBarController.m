//
//  XANTabBarController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANTabBarController.h"
#import "XANPublic.h"
#import "UIImage+XANImage.h"
#import "XANNavigationController.h"
#import "XANEssenceViewController.h"
#import "XANMeViewController.h"
#import "XANPublicViewController.h"
#import "XANNewViewController.h"
#import "XANFriendTrendViewController.h"
@interface XANTabBarController ()

@end

@implementation XANTabBarController

/**
 只会调用一次
 */
+(void)load{
    //正常状态下文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont   systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor whiteColor]}   forState:UIControlStateNormal];
    //文字选中颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont   systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor redColor]}   forState:UIControlStateSelected];
    
    //TabBar背景色
    UIView *tabBarBackGroundColor=[[UIView alloc]init];
    tabBarBackGroundColor.frame=CGRectMake(0, 0, KScreenWidth, TabbarHeight);
    tabBarBackGroundColor.backgroundColor=XANRGBColor(0, 157, 145);
    [[UITabBar appearance] insertSubview:tabBarBackGroundColor atIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //精华
    XANEssenceViewController *essence=[[XANEssenceViewController alloc]init];
    [self setUpChildViewController:essence title:@"精华" imageName:@"homeIconNormal" selectedImageName:@"homeIconSelected"];
    //新帖
    XANNewViewController *new=[[XANNewViewController alloc]init];
    [self setUpChildViewController:new title:@"新帖" imageName:@"homeIconNormal" selectedImageName:@"homeIconSelected"];
    //发布
    XANPublicViewController *public=[[XANPublicViewController alloc]init];
    [self setUpChildViewController:public title:@"" imageName:@"publish" selectedImageName:@"publish"];
    //关注
    XANFriendTrendViewController *friend=[[XANFriendTrendViewController alloc]init];
    [self setUpChildViewController:friend title:@"关注" imageName:@"homeIconNormal" selectedImageName:@"homeIconSelected"];
    //我的
    XANMeViewController *me=[[XANMeViewController alloc]init];
    [self setUpChildViewController:me title:@"我的" imageName:@"homeIconNormal" selectedImageName:@"homeIconSelected"];
}

/**
 初始化一个子控制器
 
 @param childViewController 子控制器
 @param title 标题
 @param imageName 图标
 @param selectedImageName 选中图标
 */
-(void)setUpChildViewController:(UIViewController *)childViewController
                          title:(NSString *)title
                      imageName:(NSString *)imageName
              selectedImageName:(NSString *)selectedImageName{
    childViewController.title=title;
    
    //消除TabBar图标的渲染效果 是图片保持原图效果
    childViewController.tabBarItem.image=[UIImage imageOriginalWithName:imageName];
    childViewController.tabBarItem.selectedImage=[UIImage imageOriginalWithName:selectedImageName];
    
    if (title.length==0) {//发布按钮
        childViewController.tabBarItem.imageInsets=UIEdgeInsetsMake(6, 0, -6, 0);
        [self addChildViewController:childViewController];
    }else{
        //将一个控制器包装成一个导航控制器
        XANNavigationController *navigation=[[XANNavigationController alloc]initWithRootViewController:childViewController];
        navigation.title=title;
        [self addChildViewController:navigation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
