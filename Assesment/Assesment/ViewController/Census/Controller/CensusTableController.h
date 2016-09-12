//
//  CensusTableController.h
//  Assesment
//
//  Created by Vero on 30/8/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "People.h"
@protocol DelegateTableCensus <NSObject>
@optional
-(void)communicationObjectSelected:(People *) object;
@end

@interface CensusTableController : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray * listCensus;

@property (nonatomic, weak) id<DelegateTableCensus>delegate;

@end
