//
//  XANRecommendFrame.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class XANRecommendStatus;
@interface XANRecommendFrame : NSObject

@property (nonatomic, strong) XANRecommendStatus *status;

/** 图片Frame */
@property (nonatomic, assign) CGRect iconFrame;
/** 订阅名称Frame */
@property (nonatomic, assign) CGRect nameFrame;
/** 订阅人数Frame */
@property (nonatomic, assign) CGRect numberFrame;
/** 订阅按钮Frame */
@property (nonatomic, assign) CGRect rssButtonFrame;
/** 分割线Frame */
@property (nonatomic, assign) CGRect LineFrame;

@end
