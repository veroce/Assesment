//
//  DetailViewController.h
//  Assesment
//
//  Created by Vero on 10/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "People.h"

@interface DetailViewController : UIViewController
@property (nonatomic, strong) People * person;
@property (nonatomic) BOOL showHome;

@end
