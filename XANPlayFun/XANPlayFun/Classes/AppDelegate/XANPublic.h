//
//  XANPublic.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

//获得RGB颜色
#define XANRGBColor(r, g, b) [UIColor colorWithRed:(r)/256.0 green:(g)/256.0 blue:(b)/256.0 alpha:1.0]

//宽
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
//高
#define KScreenHeight [UIScreen mainScreen].bounds.size.height


//手机类型
//苹果4/4S
#define IPhone4 ([UIScreen mainScreen].bounds.size.height==480)
//苹果5/5S/5C
#define IPhone5 ([UIScreen mainScreen].bounds.size.height==568)
//苹果6/6S/7/8
#define IPhone6 ([UIScreen mainScreen].bounds.size.height==667)
//苹果6Plus/6SPlus/7Plus/8Plus
#define IPhone6P ([UIScreen mainScreen].bounds.size.height==736)
//苹果IPhoneX
#define IPhoneX ([UIScreen mainScreen].bounds.size.height==812)

//导航栏高度
#define NaviHeight IPhoneX ? 88 : 64
//Tabbar高度
#define TabbarHeight IPhoneX ? 83 : 49
//底部高度
#define BottomHeight IPhoneX ? 34 : 0
//有tabbar就用TabbarHeight，没有就用BottomHeight

//自定义Log
#ifdef DEBUG    //调试阶段
#define XANLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else           //发布阶段
#define XANLog(...)
#endif


#ifdef __OBJC__//将OC的头文件与C语言的源文件进行有效的隔离

#import "UIBarButtonItem+XANBarButtonItem.h"
#import "UIView+AutoLayout.h"
#import "XANProgressHUD.h"
#import "XANTableViewCell.h"
#import "XANConst.h"

#endif//OC文件判断结束


//单例宏
#define SingleH(name) +(instancetype)share##name;
//条件编译
#if __has_feature(objc_arc)//使用这个宏判断是否是ARC环境
//条件满足是ARC环境
//使用\来连接  这个SingleM就代表后面所有的代码
#define SingleM(name) static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance=[super allocWithZone:zone];\
});\
return _instance;\
}\
\
+(instancetype)share##name{\
return [[self alloc]init];\
}\
\
-(id)copyWithZone:(NSZone *)zone{\
return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone{\
return _instance;\
}
#else //否则是MRC环境
//使用\来连接  这个SingleM就代表后面所有的代码
#define SingleM(name) static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance=[super allocWithZone:zone];\
});\
return _instance;\
}\
\
+(instancetype)share##name{\
return [[self alloc]init];\
}\
\
-(id)copyWithZone:(NSZone *)zone{\
return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone{\
return _instance;\
}\
-(oneway void)release{\
\
}\
\
-(instancetype)retain{\
return _instance;\
}\
\
-(NSUInteger)retainCount{\
return MAXFLOAT;\
}\

#endif




