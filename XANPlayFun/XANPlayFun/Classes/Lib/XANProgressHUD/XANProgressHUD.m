//
//  XANProgressHUD.m
//  XANWebRTC
//
//  Created by XAN on 2017/11/23.
//  Copyright © 2017年 zhongkeyuan. All rights reserved.
//

#import "XANProgressHUD.h"
#import "SVProgressHUD.h"
@implementation XANProgressHUD
/**
 一直加载状态 菊花
 
 @param message 提示信息
 */
+(void)showMessage:(NSString *)message{
    [SVProgressHUD showWithStatus:message];
}
/**
 隐藏提示框
 */
+(void)hide{
    [SVProgressHUD dismiss];
}
/**
 文字提示 2秒
 @param message 提示信息
 */
+(void)showTipMessage:(NSString *)message{
    [SVProgressHUD showImage:[UIImage imageNamed:@""] status:message];
}
@end
