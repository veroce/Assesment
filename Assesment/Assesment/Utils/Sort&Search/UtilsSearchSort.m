//
//  UtilsSearchSort.m
//  Assesment
//
//  Created by Vero on 10/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "UtilsSearchSort.h"

@implementation UtilsSearchSort

+(NSArray *)sortProfessionArray:(NSMutableArray *)professions{
    NSSortDescriptor * sort =   [NSSortDescriptor sortDescriptorWithKey:@"professionName" ascending:YES];
    return [professions sortedArrayUsingDescriptors:@[sort]];
}
+(NSArray *)sortNamePersonArray:(NSMutableArray *)people{
    NSSortDescriptor * sort =   [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    return [people sortedArrayUsingDescriptors:@[sort]];
}

+(NSArray *)filterPersonArrayByName:(NSMutableArray *)people byText:(NSString *)text{
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[cd] %@", text];
    NSArray * filter = [people filteredArrayUsingPredicate:predicate];
    return filter;
}

+(NSArray *)filterList:(NSMutableArray *)people byProfession:(NSString *)profession height:(float)height{
    NSArray * filter;
    NSPredicate * predicate;
    if(profession){
        predicate = [NSPredicate predicateWithFormat:@"SELF.professions.professionName contains[cd] %@", profession];
        filter = [ people filteredArrayUsingPredicate:predicate];
    }
    
    if(height == 0){
        if(filter){
            return filter;
        }else return people;
    }else if(height == 150){
        predicate = [NSPredicate predicateWithFormat:@"SELF.height >= 150.0"];
    }else{
        predicate = [NSPredicate predicateWithFormat:@"SELF.height >= 0.0 AND SELF.height <= %f", height];
    }
    
    if(filter){
        return [ filter filteredArrayUsingPredicate:predicate];
    }
    
    return [ people filteredArrayUsingPredicate:predicate];
}
@end
