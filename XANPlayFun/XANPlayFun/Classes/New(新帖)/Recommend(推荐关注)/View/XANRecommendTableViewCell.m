//
//  XANRecommendTableViewCell.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANRecommendTableViewCell.h"
#import "XANPublic.h"
#import "XANRecommendFrame.h"
#import "XANRecommendStatus.h"
#import <UIImageView+WebCache.h>
@interface XANRecommendTableViewCell ()
/** 图片链接  */
@property (nonatomic, weak) UIImageView *icon;
/** 名字  */
@property (nonatomic, weak) UILabel *name;
/** 订阅人数  */
@property (nonatomic, weak) UILabel *number;
/** 分割线  */
@property (nonatomic, weak) UIView *Line;
/** 订阅按钮  */
@property (nonatomic, weak) UIButton *rssButton;

@end

@implementation XANRecommendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
/**
 *  快速创建一个tableView
 */
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"XANRecommendTableViewCell";
    XANRecommendTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[XANRecommendTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //添加所有子控件
        [self setUpViews];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)setRecommendFrame:(XANRecommendFrame *)recommendFrame{
    _recommendFrame=recommendFrame;
    //设置数据
    [self setUpData];
    //设置frame
    [self setUpFrame];
}

/**
 设置数据
 */
-(void)setUpData{
    //获取数据模型
    XANRecommendStatus *status=self.recommendFrame.status;
    //icon
    SDWebImageOptions options=SDWebImageRetryFailed | SDWebImageLowPriority;
    [_icon sd_setImageWithURL:[NSURL URLWithString:status.icon] placeholderImage:[UIImage imageNamed:@"iconPlace"] options:options];
    
    //订阅名称
    _name.text=status.name;
    
    //订阅人数
    _number.text=[NSString stringWithFormat:@"%ld人订阅",status.number];
    
}

/**
 设置frame
 */
-(void)setUpFrame{
    //icon
    self.icon.frame=self.recommendFrame.iconFrame;
    //订阅名称
    self.name.frame=self.recommendFrame.nameFrame;
    //订阅人数
    self.number.frame=self.recommendFrame.numberFrame;
    //分割线
    self.Line.frame=self.recommendFrame.LineFrame;
    //订阅按钮
    self.rssButton.frame=self.recommendFrame.rssButtonFrame;
}

/**
 添加所有子控件
 */
-(void)setUpViews{
    //icon
    UIImageView *icon=[[UIImageView alloc]init];
    icon.layer.cornerRadius=30;
    icon.layer.masksToBounds=YES;
    [self.contentView addSubview:icon];
    _icon=icon;
    
    //订阅名称
    UILabel *name=[[UILabel alloc]init];
    name.textColor=[UIColor blackColor];
    name.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:name];
    _name=name;
    
    //订阅人数
    UILabel *number=[[UILabel alloc]init];
    number.textColor=[UIColor blackColor];
    number.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:number];
    _number=number;
    
    //订阅按钮
    UIButton *rssButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [rssButton setTitle:@"+订阅" forState:UIControlStateNormal];
    rssButton.layer.cornerRadius=5.0;
    rssButton.layer.masksToBounds=YES;
    rssButton.titleLabel.font=[UIFont systemFontOfSize:13];
    [rssButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rssButton.backgroundColor=[UIColor redColor];
    [self.contentView addSubview:rssButton];
    _rssButton=rssButton;
    
    //分割线
    UIView *Line=[[UIView alloc]init];
    Line.backgroundColor=XANRGBColor(225, 225, 225);
    [self.contentView addSubview:Line];
    _Line=Line;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
