//
//  CollectionController.h
//  Assesment
//
//  Created by Vero on 10/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "People.h"
@protocol DelegateCollectionFriends<NSObject>
@optional
-(void)comunicationFriendSelected:(People *)friendSeleced;
@end

@interface CollectionController : NSObject<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray * friends;
@property (nonatomic, weak) id<DelegateCollectionFriends>delegate;

@end
