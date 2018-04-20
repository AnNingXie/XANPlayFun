//
//  XANEssenceViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANEssenceViewController.h"
#import "XANPublic.h"
#import "UIBarButtonItem+XANBarButtonItem.h"
@interface XANEssenceViewController ()

@end

@implementation XANEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithName:@"右边" target:self action:@selector(rightClick)];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithNormalImage:@"setting" highImage:@"setting" target:self action:@selector(left)];
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
