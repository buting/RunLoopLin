//
//  AppDelegate.h
//  RunLoopLin
//
//  Created by buTing on 2018/2/12.
//  Copyright © 2018年 buTing. All rights reserved.
//

// runtime为：objc_msgSend( id self, @selecto(method), @"Para")
// C为 void method(id self, SEL _CMD, id objc)

// practice the best banner
// think about how  Block capture the instance

// research hitEventWith

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

