//
//  XANEssenceViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANEssenceViewController.h"
#import "XANPublic.h"
#import "XANTitlesView.h"
#import "XANAllViewController.h"
#import "XANVideoViewController.h"
#import "XANVoiceViewController.h"
#import "XANPictureViewController.h"
#import "XANWordViewController.h"
#import "XANTitleButton.h"
//标题点击类型
typedef NS_ENUM(NSInteger, sortType) {
    sortTypeAll,    //全部
    sortTypeVideo,  //视频
    sortTypeVoice,  //声音
    sortTypePicture,//图片
    sortTypeText    //段子
};

@interface XANEssenceViewController ()<XANTitlesViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;//scrollView
@property (nonatomic, strong) XANTitlesView *titlesView;//标题栏
@end

@implementation XANEssenceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithName:@"右边" target:self action:@selector(rightClick)];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithNormalImage:@"setting" highImage:@"setting" target:self action:@selector(left)];
    //添加所有的子控制器
    [self setUpAllChildViews];
    
    //1.设置ScrollView
    [self setUpScrollView];
    //2.标题栏
    [self setUpTitlesView];
}

/**
 添加所有的子控制器
 */
-(void)setUpAllChildViews{
    [self addChildViewController:[[XANAllViewController alloc]init]];
    [self addChildViewController:[[XANVideoViewController alloc]init]];
    [self addChildViewController:[[XANVoiceViewController alloc]init]];
    [self addChildViewController:[[XANPictureViewController alloc]init]];
    [self addChildViewController:[[XANWordViewController alloc]init]];
}

/**
 设置ScrollView
 */
-(void)setUpScrollView{
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.pagingEnabled=YES;
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
    _scrollView=scrollView;
    //添加子控制器的View
    for (int i=0; i<self.childViewControllers.count; i++) {
        //取出所有子控制器的View添加到ScrollView
        UIView *childView=self.childViewControllers[i].view;
        childView.frame=CGRectMake((scrollView.frame.size.width)*i, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        [scrollView addSubview:childView];
    }
    scrollView.contentSize=CGSizeMake((scrollView.frame.size.width)*self.childViewControllers.count, 0);
}

/**
 标题栏
 */
-(void)setUpTitlesView{
    XANTitlesView *titlesView=[[XANTitlesView alloc]initWithFrame:CGRectMake(0, NaviHeight, KScreenWidth, 35)];
    titlesView.delegate=self;
    [self.view addSubview:titlesView];
    _titlesView=titlesView;
}

#pragma mark---XANTitlesViewDelegate
//标题栏点击事件
-(void)titleButtonClickWithTag:(int)buttonTag{
    //让视图跟随点击标题切换
    self.scrollView.contentOffset=CGPointMake(KScreenWidth*buttonTag, 0);
    switch (buttonTag) {
        case sortTypeAll:
            XANLog(@"全部");
            break;
        case sortTypeVideo:
            XANLog(@"视频");
            break;
        case sortTypeVoice:
            XANLog(@"声音");
            break;
        case sortTypePicture:
            XANLog(@"图片");
            break;
        case sortTypeText:
            XANLog(@"段子");
            break;
        default:
            break;
    }
}
#pragma mark----UIScrollViewDelegate
//当用户停止拖拽的时候会调用
//切换界面使标题跟随移动点击
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index=scrollView.contentOffset.x/scrollView.frame.size.width;
    XANTitleButton *titleButton=self.titlesView.subviews[index];
    [self.titlesView titleButtonClick:titleButton];
}

-(void)left{
    XANLog(@"点击了图片");
}

-(void)rightClick{
    XANLog(@"点击了按钮点击了按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
