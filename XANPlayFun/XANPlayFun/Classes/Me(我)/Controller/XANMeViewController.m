//
//  XANMeViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANMeViewController.h"
#import "XANPublic.h"
#import "XANSettingViewController.h"
#import "XANMeLoginTableViewCell.h"
#import "XANMeDownLoadTableViewCell.h"
@interface XANMeViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XANMeViewController
-(instancetype)init{
    if (self=[super init]) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate=self;
        tableView.dataSource=self;
        [self.view addSubview:tableView];
        _tableView=tableView;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithName:@"设置" target:self action:@selector(setting)];

}

/**
 设置
 */
-(void)setting{
    XANSettingViewController *setting=[[XANSettingViewController alloc]init];
    [self.navigationController pushViewController:setting animated:YES];
}

#pragma mark----UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        XANMeLoginTableViewCell *cell=[XANMeLoginTableViewCell cellWithTableView:tableView];
        return cell;
    }
    XANMeDownLoadTableViewCell *cell=[XANMeDownLoadTableViewCell cellWithTableView:tableView];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return CGFLOAT_MIN;
    }
    return 300;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==1) {
         return [self setUpTableFootView];
    }
    return nil;
}

/**
 设置TableFootView 底部视图
 */
-(UIView *)setUpTableFootView{
    UICollectionViewLayout *layout=[[UICollectionViewLayout alloc]init];
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
    collectionView.backgroundColor=[UIColor redColor];
    return collectionView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
