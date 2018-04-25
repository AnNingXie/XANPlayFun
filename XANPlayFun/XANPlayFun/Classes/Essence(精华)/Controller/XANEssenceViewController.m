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
    //0.添加所有的子控制器
    [self setUpAllChildViews];
    //1.设置ScrollView
    [self setUpScrollView];
    //2.标题栏
    [self setUpTitlesView];
    //3.默认添加全部控制器的View
    [self addChildViewIntoScrollViewWithIndex:0];
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
    scrollView.backgroundColor=[UIColor lightTextColor];
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.pagingEnabled=YES;
    scrollView.delegate=self;
    scrollView.scrollsToTop=NO;
    scrollView.contentSize=CGSizeMake((scrollView.frame.size.width)*self.childViewControllers.count, 0);
    [self.view addSubview:scrollView];
    _scrollView=scrollView;
    
}

/**
 标题栏
 */
-(void)setUpTitlesView{
    XANTitlesView *titlesView=[[XANTitlesView alloc]initWithFrame:CGRectMake(0, NaviHeight, KScreenWidth, kTitleViewHeight)];
    titlesView.delegate=self;
    [self.view addSubview:titlesView];
    _titlesView=titlesView;
}

#pragma mark---XANTitlesViewDelegate
//标题栏点击事件
-(void)titleButtonClickWithTag:(int)buttonTag{
    [UIView animateWithDuration:0.2 animations:^{
        //让视图跟随点击标题切换
        self.scrollView.contentOffset=CGPointMake(KScreenWidth*buttonTag, 0);
    } completion:^(BOOL finished) {//点击标题懒加载添加每个控制器的View
        [self addChildViewIntoScrollViewWithIndex:buttonTag];
    }];
    
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

/**
 添加子控制器到ScrollView

 @param index 添加第几个的序数
 */
-(void)addChildViewIntoScrollViewWithIndex:(int)index{
    UIView *childView=self.childViewControllers[index].view;
//    childView.frame=CGRectMake((self.scrollView.frame.size.width)*index, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    childView.frame=self.scrollView.bounds;
    [self.scrollView addSubview:childView];
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
