//
//  Heroes.h
//  Assesment
//
//  Created by Vero on 30/8/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People: NSObject

@property (nonatomic, strong) NSNumber *idPeople;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * thumbnail;
@property (nonatomic, strong) NSNumber * age;
@property (nonatomic) float weight;
@property (nonatomic) float height;
@property (nonatomic, strong) NSString *hairColor;
@property (nonatomic, strong) NSArray * professions;
@property (nonatomic, strong) NSArray * namesFriends;
@property (nonatomic, strong) NSMutableArray * friends;


- (instancetype)initWithId:(NSNumber *)idPeople name:(NSString*)name thumbnail:(NSString*)thumbnail age:(NSNumber*)age weight:(float)weight height:(float)height hairColor:(NSString*)hairColor professions:(NSArray*)professions andFriends:(NSArray*)namesFriends;

+(People *)setRelationFriends:(NSMutableArray *)people person:(People *)person;

@end
