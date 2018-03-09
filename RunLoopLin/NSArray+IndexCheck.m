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
    Method mobjectAtIndex= class_getInstanceMethod( NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    Method mCXobjectAtIndex = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(CX_objectAtIndex:));
    
    method_exchangeImplementations(mobjectAtIndex, mCXobjectAtIndex);
    
//    objectAtIndexedSubscript
}

- (id)CX_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) { // 若index为合法index, 则通过新方法调用原方法
        return [self CX_objectAtIndex:index];
    }
    NSLog(@"lcx警告！数组越界");
    return nil ;
}
@end
