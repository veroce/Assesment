//
//  Profession.m
//  Assesment
//
//  Created by Vero on 10/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "Profession.h"

@implementation Profession

-(id)initWithNameProfesion:(NSString *)name{
    self = [super init];
    if (self) {
        self.professionName = name;
    }
    return self;

}

@end
