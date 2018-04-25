//
//  XANADItem.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/22.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XANADItem : NSObject
/** 广告图片链接  */
@property (nonatomic, copy) NSString *adpicture;
/** 要跳转URL */
@property (nonatomic, copy) NSString *adUrl;
/** 图片的宽 */
@property (nonatomic, assign) CGFloat w;
/** 图片的高 */
@property (nonatomic, assign) CGFloat h;


@end
