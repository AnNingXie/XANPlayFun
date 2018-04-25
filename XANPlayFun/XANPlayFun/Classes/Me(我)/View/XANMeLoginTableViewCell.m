//
//  XANMeLoginTableViewCell.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANMeLoginTableViewCell.h"

@implementation XANMeLoginTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
/**
 *  快速创建一个tableView
 */
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"XANMeLoginTableViewCell";
    XANMeLoginTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[XANMeLoginTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.imageView.image=[UIImage imageNamed:@"iconPlace"];
    cell.imageView.contentMode=UIViewContentModeScaleAspectFit;
    cell.textLabel.text=@"登录/注册";
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
