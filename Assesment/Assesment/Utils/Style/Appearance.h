//
//  Appearance.h
//  Assesment
//
//  Created by Vero on 8/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Appearance : NSObject

+(UIColor *) getPrimaryColor;
+(UIColor *) getDarkPrimaryColor;
+(UIColor *) getLightPrimaryColor;
+(UIColor *) getTextColor;
+(UIColor *) getAccentColor;
+(UIColor *) getPrimaryTextColor;
+(UIColor *) getSecondaryTextColor;
+(UIColor *) getDividerColor;

+(void)setCircleView:(UIView *)view;
+(void)setCircleViewWithBorderColor:(UIView *)view;
+(void)setBorderSemiCircleView:(UIView *)view;
@end
