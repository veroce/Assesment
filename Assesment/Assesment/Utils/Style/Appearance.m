//
//  Appearance.m
//  Assesment
//
//  Created by Vero on 8/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "Appearance.h"

@implementation Appearance
#pragma mark - Cte colors
+(UIColor *) getPrimaryColor{
    return [UIColor colorWithRed:0.0/255.0 green:188.0/255.0 blue:212.0/255.0 alpha:1];

}
+(UIColor *) getDarkPrimaryColor{
    return [UIColor colorWithRed:0.0/255.0 green:151.0/255.0 blue:167.0/255.0 alpha:1];

}
+(UIColor *) getLightPrimaryColor{
    return [UIColor colorWithRed:178.0/255.0 green:235.0/255.0 blue:242.0/255.0 alpha:1];

}
+(UIColor *) getTextColor{
    return [UIColor whiteColor];

}
+(UIColor *) getAccentColor{
    return [UIColor colorWithRed:255.0/255.0 green:87.0/255.0 blue:34.0/255.0 alpha:1];

}
+(UIColor *) getPrimaryTextColor{
    return [UIColor colorWithRed:33.0/255.0 green:33.0/255.0 blue:33.0/255.0 alpha:1];

}
+(UIColor *) getSecondaryTextColor{
    return [UIColor colorWithRed:117.0/255.0 green:117.0/255.0 blue:117.0/255.0 alpha:1];

}
+(UIColor *) getDividerColor{
    return [UIColor colorWithRed:189.0/255.0 green:189.0/255.0 blue:189.0/255.0 alpha:1];
}

+(void)setCircleView:(UIView *)view{
    view.layer.cornerRadius = view.frame.size.height / 2;
    view.layer.masksToBounds = YES;
    view.layer.borderWidth = 0;

}
+(void)setCircleViewWithBorderColor:(UIView *)view{
    [self setCircleView:view];
    view.layer.borderColor = [self getDarkPrimaryColor].CGColor;
    view.layer.borderWidth = 2.0;
}
+(void)setBorderSemiCircleView:(UIView *)view{
    view.layer.cornerRadius = 10.0f;
    view.layer.borderWidth = 3.0f;
    view.layer.borderColor = [self getDarkPrimaryColor].CGColor;
    view.clipsToBounds = YES;
}

@end
