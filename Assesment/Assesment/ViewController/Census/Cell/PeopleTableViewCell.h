//
//  PeopleTableViewCell.h
//  Assesment
//
//  Created by Vero on 30/8/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "People.h"

@interface PeopleTableViewCell : UITableViewCell


-(void) loadData:(People *)people;
@end
