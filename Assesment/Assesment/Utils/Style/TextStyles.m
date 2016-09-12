//
//  TextStyles.m
//  Assesment
//
//  Created by Vero on 30/8/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "TextStyles.h"
#import "Appearance.h"

@implementation TextStyles
/*
 SFUIText-Regular
 2016-09-10 20:09:04.728 Assesment[21317:194019]   SFUIText-Light
 2016-09-10 20:09:04.729 Assesment[21317:194019]   SFUIText-Semibold
 2016-09-10 20:09:04.729 Assesment[21317:194019]   SFUIText-Ultrathin
 
 */

+(void)primaryText:(UILabel *)label{
    label.textColor =[Appearance getPrimaryTextColor];
    [label setFont:[UIFont fontWithName:@"SFUIText-Regular" size:14]];
    
}
+(void)primaryTextBold:(UILabel *)label{
    label.textColor =[Appearance getPrimaryTextColor];
    [label setFont:[UIFont fontWithName:@"SFUIText-Semibold" size:18]];


    
}
+(void)primaryTextLight:(UILabel *)label{
    label.textColor =[Appearance getPrimaryTextColor];
    [label setFont:[UIFont fontWithName:@"SFUIText-Ultrathin" size:16]];
}

+(void)secondaryText:(UILabel *)label{
    label.textColor =[Appearance getSecondaryTextColor];
    [label setFont:[UIFont fontWithName:@"SFUIText-Regular" size:14]];

}
+(void)secondaryTextLight:(UILabel *)label{
    label.textColor =[Appearance getSecondaryTextColor];

     [label setFont:[UIFont fontWithName:@"SFUIText-Ultrathin" size:16]];
}
+(void)secondaryTextBold:(UILabel *)label{
    label.textColor =[Appearance getSecondaryTextColor];
    [label setFont:[UIFont fontWithName:@"SFUIText-Semibold" size:16]];

    
}

+(void)whiteText:(UILabel *)label{
    label.textColor =[UIColor whiteColor];
    [label setFont:[UIFont fontWithName:@"SFUIText-Regular" size:14]];
    
}

+(void)primaryTextLightSmall:(UILabel *)label{
    label.textColor =[Appearance getPrimaryTextColor];
    [label setFont:[UIFont fontWithName:@"SFUIText-Ultrathin" size:12]];
}
@end
