//
//  XANRecommendStatus.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XANRecommendStatus : NSObject
/** 图片链接  */
@property (nonatomic, copy) NSString *icon;
/** 名字  */
@property (nonatomic, copy) NSString *name;
/** 订阅人数  */
@property (nonatomic, assign) NSInteger number;

@end
