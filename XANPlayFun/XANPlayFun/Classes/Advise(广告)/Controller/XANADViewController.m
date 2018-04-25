//
//  XANADViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/22.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANADViewController.h"
#import "XANPublic.h"
#import "XANADItem.h"
#import "XANTabBarController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
@interface XANADViewController ()
@property (nonatomic, strong) UIView *adView;//广告页面
@property (nonatomic, strong) UIImageView *adImage;//广告图片
@property (nonatomic, strong) XANADItem *adItem;
@property (nonatomic, weak) NSTimer *timer;//定时器
@property (nonatomic, strong) UIButton *skip;//跳转按钮
@end

@implementation XANADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.设置启动图片
    [self setUpLaunchImage];
    //2.设置广告页面
    [self aetUpADContentView];
    //3.加载广告数据
    [self loadADData];
    //4.创建定时器
  self.timer= [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

/**
 定时器
 */
-(void)timeChange{
    static int i=3;
    if (i==0) {
        [self skipRootController];
    }
    i--;
    [_skip setTitle:[NSString stringWithFormat:@"跳转 (%d)",i] forState:UIControlStateNormal];
}

/**
 设置跳转按钮
 */
-(void)setUpSkipBtn{
    //跳转按钮
    UIButton *skip=[UIButton buttonWithType:UIButtonTypeCustom];
    [skip setTitle:@"跳转 (3)" forState:UIControlStateNormal];
    skip.titleLabel.font=[UIFont systemFontOfSize:14];
    [skip setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [skip addTarget:self action:@selector(skipRootController) forControlEvents:UIControlEventTouchUpInside];
    skip.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.7];
    [_adImage addSubview:skip];
    [skip autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [skip autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    [skip autoSetDimension:ALDimensionWidth toSize:70];
    [skip autoSetDimension:ALDimensionHeight toSize:30];
    _skip=skip;
}

/**
 设置广告页面
 */
-(void)aetUpADContentView{
    UIView *adView=[[UIView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:adView];
    _adView=adView;
}

/**
 跳转到根控制器
 */
-(void)skipRootController{
    //设置根控制器
    XANTabBarController *tabBar=[[XANTabBarController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController=tabBar;
    
    //停止定时器
    [self.timer invalidate];
    
}

/**
 加载广告数据
 */
-(void)loadADData{
    //开启一个子线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableDictionary *adDictionary=[NSMutableDictionary dictionary];
        adDictionary[@"adpicture"]=@"http://app.qingdaobeilin.cn/img/59fc174146596.jpeg";
        adDictionary[@"adUrl"]=@"www.baidu.com";
        adDictionary[@"w"]=@640;
        adDictionary[@"h"]=@960;
        self.adItem=[XANADItem mj_objectWithKeyValues:adDictionary];
        dispatch_async(dispatch_get_main_queue(), ^{//回到主线程
            CGFloat h=KScreenWidth/self.adItem.w * self.adItem.h;
            self.adImage.frame=CGRectMake(0, 0, KScreenWidth, h);
            [self.adImage sd_setImageWithURL:[NSURL URLWithString:self.adItem.adpicture]];
            // 设置跳转按钮
            [self setUpSkipBtn];
        });
    });
}

/**
 设置启动图片
 */
-(void)setUpLaunchImage{
    UIImageView *launchImage=[[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:launchImage];
    if (IPhoneX) {
        launchImage.image=[UIImage imageNamed:@"LaunchImageiPhoneXPortraitiOS11_375x812pt@3x"];
    }else if (IPhone6P){
        launchImage.image=[UIImage imageNamed:@"LaunchImageiPhonePortraitiOS89_414x736pt@3x"];
    }else if (IPhone6){
        launchImage.image=[UIImage imageNamed:@"LaunchImageiPhonePortraitiOS89_375x667pt@2x"];
    }else if (IPhone5){
        launchImage.image=[UIImage imageNamed:@"LaunchImageiPhonePortraitiOS789_320x568pt@2x"];
    }
}

/**
 点击广告图片调用
 */
-(void)imageClick{
        NSURL *url=[NSURL URLWithString:self.adItem.adUrl];
        UIApplication *app=[UIApplication sharedApplication];
        if ([app canOpenURL:url]) {//判断是否可以打开这个网址
            [app openURL:url];
        }
}

#pragma mark---懒加载
-(UIImageView *)adImage{
    if (!_adImage) {
        _adImage=[[UIImageView alloc]init];
        _adImage.userInteractionEnabled=YES;
        //添加点击手势
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick)];
        [_adImage addGestureRecognizer:tap];
        [_adView addSubview:_adImage];
    }
    return _adImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
