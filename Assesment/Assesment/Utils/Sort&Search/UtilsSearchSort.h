//
//  UtilsSearchSort.h
//  Assesment
//
//  Created by Vero on 10/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilsSearchSort : NSObject
+(NSArray *)sortProfessionArray:(NSMutableArray *)professions;
+(NSArray *)sortNamePersonArray:(NSMutableArray *)people;
+(NSArray *)filterPersonArrayByName:(NSMutableArray *)people byText:(NSString *)text;
+(NSArray *)filterList:(NSMutableArray *)people byProfession:(NSString *)profession height:(float)height;


@end
