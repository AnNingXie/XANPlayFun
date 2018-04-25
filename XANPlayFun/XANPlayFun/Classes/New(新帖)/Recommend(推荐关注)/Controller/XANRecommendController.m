//
//  XANRecommendController.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANRecommendController.h"
#import "XANRecommendStatus.h"
#import "XANPublic.h"
#import <MJExtension.h>
#import "XANRecommendFrame.h"
#import "XANRecommendTableViewCell.h"
@interface XANRecommendController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *statusFrame;
@end

@implementation XANRecommendController
-(instancetype)init{
    if (self=[super init]) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.rowHeight=80;
        tableView.delegate=self;
        tableView.dataSource=self;
        [self.view addSubview:tableView];
        _tableView=tableView;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"推荐标签";
    self.view.backgroundColor=[UIColor whiteColor];
    //获取网络数据
    [self getNetData];
}

/**
 获取网络数据
 */
-(void)getNetData{
    [XANProgressHUD showMessage:@"正在加载数据，请稍后"];//显示提示框
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [XANProgressHUD hide];//隐藏提示框
        for (int i=0; i<20; i++) {
            NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
            dictionary[@"icon"]=@"http://app.qingdaobeilin.cn/img/59fc174146596.jpeg";
            dictionary[@"name"]=@"社会焦点";
            dictionary[@"number"]=@8989;
            XANRecommendStatus *status=[XANRecommendStatus mj_objectWithKeyValues:dictionary];
            XANRecommendFrame *statusFrame=[[XANRecommendFrame alloc]init];
            statusFrame.status=status;
            [self.statusFrame addObject:statusFrame];
        }
        dispatch_async(dispatch_get_main_queue(), ^{//回到主线程
            [self.tableView reloadData];
        });
    });
}

#pragma mark----UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statusFrame.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XANRecommendTableViewCell *cell=[XANRecommendTableViewCell cellWithTableView:tableView];
    cell.recommendFrame=self.statusFrame[indexPath.row];
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

#pragma mark---数组懒加载
-(NSMutableArray *)statusFrame{
    if (!_statusFrame) {
        _statusFrame=[NSMutableArray array];
    }
    return _statusFrame;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
