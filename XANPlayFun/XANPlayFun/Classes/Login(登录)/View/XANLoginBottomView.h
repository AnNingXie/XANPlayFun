//
//  XANLoginBottomView.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XANLoginBottomViewDelegate <NSObject>
@optional
-(void)fastLoginWithTypeTag:(int)buttonTag;//快速登录方式
@end

@interface XANLoginBottomView : UIView
@property (nonatomic, weak) id<XANLoginBottomViewDelegate> delegate;
@end
