//
//  XANNewViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANNewViewController.h"
#import "XANPublic.h"
#import "XANRecommendController.h"
@interface XANNewViewController ()

@end

@implementation XANNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithName:@"推荐标签" target:self action:@selector(recommend)];
}

/**
 推荐标签
 */
-(void)recommend{
    XANRecommendController *recommend=[[XANRecommendController alloc]init];
    [self.navigationController pushViewController:recommend animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
