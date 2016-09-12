//
//  TextStyles.h
//  Assesment
//
//  Created by Vero on 30/8/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TextStyles : NSObject

+(void)primaryText:(UILabel *)label;
+(void)primaryTextBold:(UILabel *)label;
+(void)primaryTextLight:(UILabel *)label;

+(void)secondaryText:(UILabel *)label;
+(void)secondaryTextLight:(UILabel *)label;
+(void)secondaryTextBold:(UILabel *)label;

+(void)whiteText:(UILabel *)label;

+(void)primaryTextLightSmall:(UILabel *)label;

@end
