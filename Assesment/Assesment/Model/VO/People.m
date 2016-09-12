//
//  Heroes.m
//  Assesment
//
//  Created by Vero on 30/8/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "People.h"
#import "UtilsSearchSort.h"
@interface People()

@end

@implementation People
- (instancetype)initWithId:(NSNumber *)idPeople name:(NSString*)name thumbnail:(NSString*)thumbnail age:(NSNumber*)age weight:(float)weight height:(float)height hairColor:(NSString*)hairColor professions:(NSArray*)professions andFriends:(NSArray*)namesFriends
{
    self = [super init];
    if (self) {
        self.idPeople = idPeople;
        self.name = name;
        self.thumbnail = thumbnail;
        self.age = age;
        self.weight = weight;
        self.height = height;
        self.hairColor = hairColor;
        self.professions = professions;
        self.namesFriends = namesFriends;
    }
    return self;
}
+(People *)setRelationFriends:(NSMutableArray *)people person:(People *)person{
        for (NSString * name in person.namesFriends) {
            NSArray *friends = [UtilsSearchSort filterPersonArrayByName:[people mutableCopy]byText:name];
            if(friends.count > 0){
                if(!person.friends){
                    person.friends = [NSMutableArray new];
                }
                [person.friends addObjectsFromArray:friends];
            }
        }
        
    return person;

}

@end
