//
//  XANSettingViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/22.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANSettingViewController.h"
#import "XANPublic.h"
#import "XANFileTool.h"
@interface XANSettingViewController ()
@property (nonatomic, strong) UILabel *totalLable;
@end

@implementation XANSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"设置";
    self.view.backgroundColor=[UIColor whiteColor];
    [self setUpViews];
    [self getFileSize];
//    [self clearMemory];
}

-(void)setUpViews{
    UILabel *totalLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 40)];
    totalLable.textColor=[UIColor redColor];
    [self.view addSubview:totalLable];
    _totalLable=totalLable;
}
/**
 清空缓存
 */
-(void)clearMemory{
    //获取cache路径
    NSString *cachePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    [XANFileTool removeFileWithPath:cachePath];
}

/**
 获取缓存大小//拿到的是B
 */
-(void)getFileSize{
    
    //获取cache路径
    NSString *cachePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //获取default路径
    NSString *defaultPath=[cachePath stringByAppendingPathComponent:@"default"];
//    NSInteger totalSize=[XANFileTool getFileSizeWithPath:defaultPath];
    [XANProgressHUD showMessage:@"正在计算缓存"];
    __weak typeof(self) weakSelf=self;
    [XANFileTool getFileSizeWithPath:defaultPath completion:^(NSInteger totalSize) {
        [XANProgressHUD hide];
        XANLog(@"%ld",totalSize);
        weakSelf.totalLable.text=[NSString stringWithFormat:@"缓存大小：%ld B",totalSize];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
