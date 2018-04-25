//
//  XANProgressHUD.h
//  XANWebRTC
//
//  Created by XAN on 2017/11/23.
//  Copyright © 2017年 zhongkeyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XANProgressHUD : NSObject

/**
 一直加载状态 菊花

 @param message 提示信息
 */
+(void)showMessage:(NSString *)message;

/**
 隐藏提示框
 */
+(void)hide;

/**
 文字提示 2秒
 @param message 提示信息
 */
+(void)showTipMessage:(NSString *)message;


@end
