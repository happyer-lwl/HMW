//
//  HMWItemTool.h
//  HMW
//
//  Created by 刘伟龙 on 15/10/20.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMWItemTool : NSObject 

+ (UIBarButtonItem*)itemWithAction:(SEL)action target:(id)target image:(NSString *)image highImage:(NSString*)highImage;

@end
