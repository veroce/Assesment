//
//  Constants.h
//  Assesment
//
//  Created by Vero on 30/8/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Constants : NSObject







extern UIColor *const secondaryColor;
extern NSString *const fontRegular;
extern NSString *const fontBold;
extern NSString *const fontLight;



enum {
    kRESPONSE_OK = 0,
    kRESPONSE_TIMEOUT = 1,
    kRESPONSE_FAIL = 2,
};
typedef int DAO_RESPONSE;

extern NSString *const KHEADER_WITH_CODE ;
extern NSString *const kCODE_TIMEOUT;
extern NSString *const kCODE_UNAUTHORIZED;
extern NSString *const kCODE_FORBIDEN;
@end
