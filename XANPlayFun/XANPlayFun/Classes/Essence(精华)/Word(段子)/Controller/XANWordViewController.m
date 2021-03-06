//
//  XANWordViewController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/24.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANWordViewController.h"
#import "XANPublic.h"
@interface XANWordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XANWordViewController
-(instancetype)init{
    if (self=[super init]) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, NaviHeight, KScreenWidth, KScreenHeight-(TabbarHeight)-(NaviHeight)) style:UITableViewStyleGrouped];
        tableView.contentInset=UIEdgeInsetsMake(kTitleViewHeight, 0, 0, 0);
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.rowHeight=50;
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
    // Do any additional setup after loading the view.
}
#pragma mark----UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XANTableViewCell *cell=[XANTableViewCell cellWithTableView:tableView];
    cell.textLabel.text=[NSString stringWithFormat:@"第%ld行",indexPath.row];
    cell.backgroundColor=[UIColor redColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
