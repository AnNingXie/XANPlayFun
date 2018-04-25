//
//  XANLoginBottomView.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANLoginBottomView.h"
#import "XANPublic.h"
#import "XANFastLoginButton.h"
@implementation XANLoginBottomView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)initViews{
    NSArray *titles=@[@"QQ登录",@"微博登录",@"腾讯微博"];
    NSArray *icons=@[@"iconPlace",@"iconPlace",@"iconPlace"];
    for (int i=0; i<titles.count; i++) {
        XANFastLoginButton *fastButton=[XANFastLoginButton buttonWithType:UIButtonTypeCustom];
        [fastButton setTitle:titles[i] forState:UIControlStateNormal];
        fastButton.titleLabel.textAlignment=NSTextAlignmentCenter;
        fastButton.tag=i;
        fastButton.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [fastButton addTarget:self action:@selector(fastLogin:) forControlEvents:UIControlEventTouchUpInside];
        [fastButton setImage:[UIImage imageNamed:icons[i]] forState:UIControlStateNormal];
        [self addSubview:fastButton];
        [fastButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
        [fastButton autoSetDimension:ALDimensionWidth toSize:KScreenWidth/3];
        [fastButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:KScreenWidth/3*i];
        [fastButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    }
}

/**
 快速登录

 @param button <#button description#>
 */
-(void)fastLogin:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(fastLoginWithTypeTag:)]) {
        [self.delegate fastLoginWithTypeTag:(int)button.tag];
    }
}

@end
