//
//  ReskitManager.h
//  Assesment
//
//  Created by Vero on 8/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol DelegateRestKitManager <NSObject>
@optional
-(void)communicationDownloadFinished:(NSArray *)listCensus WithError:(NSInteger) error;
@end
@interface RestkitManager : NSObject

-(void)configureRestKit;

-(void)loadPeople;

@property (nonatomic, weak) id<DelegateRestKitManager> delegate;

@end
