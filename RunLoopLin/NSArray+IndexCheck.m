//
//  NSArray+IndexCheck.m
//  RunLoopLin
//
//  Created by cxlin18 on 2018/3/9.
//  Copyright © 2018年 buTing. All rights reserved.
//

#import "NSArray+IndexCheck.h"
#import <objc/runtime.h>
@implementation NSArray (IndexCheck)

// 在程序运行时，Runtime会将所有的Class和Category加载到内存中，这时，会调用类的load方法，通知我们Class或Category已经被加载到内存中。

+ (void)load
{
    Method mObj= class_getClassMethod([NSURL class], @selector(objectAtIndex:));
    Method mCX_Obj = class_getClassMethod([NSURL class], @selector(CX_objectAtIndex:));
    
    //2.交换这两个方法!(你调用A 个么会执行 B )
    method_exchangeImplementations(mObj, mCX_Obj);
    
}

- (void)CX_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) { // 若index为合法index, 则通过新方法调用原方法
        return [self CX_objectAtIndex:index];
    }
    NSLog(@"数组越界");
    return nil ;
}
@end
