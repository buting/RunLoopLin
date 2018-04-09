//
//  DetailPageComponent.m
//  RunLoopLin
//
//  Created by cxlin18 on 2018/4/9.
//  Copyright © 2018年 buTing. All rights reserved.
//

#import "DetailPageComponent.h"
@implementation DetailPageComponent
+ (UIViewController*)detailViewController:(NSString *)pageId{
    UIViewController *vc = [DetailPageComponentViewController new];
    NSLog(@"pageID -> %@",pageId);
    return vc;
}
@end
