//
//  XANRecommendTableViewCell.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XANRecommendFrame;
@interface XANRecommendTableViewCell : UITableViewCell

@property (nonatomic, strong) XANRecommendFrame *recommendFrame;

/**
 *  快速创建一个tableView
 */
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
