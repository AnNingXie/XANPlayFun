//
//  XANMeDownLoadTableViewCell.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANMeDownLoadTableViewCell.h"

@implementation XANMeDownLoadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
/**
 *  快速创建一个tableView
 */
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"XANMeDownLoadTableViewCell";
    XANMeDownLoadTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[XANMeDownLoadTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text=@"离线下载";
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
