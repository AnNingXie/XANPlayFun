//
//  XANMeViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANMeViewController.h"
#import "XANPublic.h"
@interface XANMeViewController ()

@end

@implementation XANMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithNormalImage:@"setting" highImage:@"setting" target:self action:@selector(right)];
}

-(void)right{
    XANLog(@"点击了图片");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
