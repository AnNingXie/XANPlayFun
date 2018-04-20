//
//  XANFriendTrendViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANFriendTrendViewController.h"
#import "XANPublic.h"
@interface XANFriendTrendViewController ()

@end

@implementation XANFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的关注";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithNormalImage:@"setting" highImage:@"setting" target:self action:@selector(left)];
}

-(void)left{
    XANLog(@"点击了图片");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
