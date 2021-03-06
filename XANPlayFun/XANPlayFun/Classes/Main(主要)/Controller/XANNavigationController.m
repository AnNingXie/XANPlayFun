//
//  XANNavigationController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//  自定义UINavigationController

#import "XANNavigationController.h"
#import "XANPublic.h"
@interface XANNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XANNavigationController

+(void)load{
    //设置导航栏主题
    [self setupNavBarTheme];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    //1.实现全屏滑动、侧滑
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate=self;
    //2.禁止系统的边缘侧滑手势
    self.interactivePopGestureRecognizer.enabled=NO;
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    //设置左边返回按钮文字的颜色
    [navBar setTintColor:[UIColor whiteColor]];
    // 设置导航栏背景色
    navBar.barTintColor=XANRGBColor(0, 157, 145);
    //隐藏导航栏左边返回按钮的文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200, 0)
                                                         forBarMetrics:UIBarMetricsDefault];
    // 设置导航栏标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //标题字体颜色
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //标题字体大小
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:19];
    [navBar setTitleTextAttributes:textAttrs];
}

/**
 *  状态栏文字颜色  白色
 */
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark----UIGestureRecognizerDelegate
//决定是否触发手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count>1;
}

/**
 *  重写这个方法，当控制器跳转时自动隐藏底部导航,这样做防止主界面卡顿时，导致一个ViewController被push多次
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {//如果这个控制器的个数大于0，说明是非根控制器
        //1.当控制器跳转时自动隐藏底部导航
        viewController.hidesBottomBarWhenPushed = YES;
        
        //2.FIXME:这样做防止主界面卡顿时，导致一个ViewController被push多次
        if ([[self.childViewControllers lastObject] isKindOfClass:[viewController class]]) {
            return;
        }
    }
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
