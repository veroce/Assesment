//
//  FilterViewController.h
//  Assesment
//
//  Created by Vero on 11/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DelegateFilter<NSObject>
@optional
-(void)filterTouch:(NSString *)profession andHeight:(float)height;
-(void)cancelWasTouched;
@end

@interface FilterViewController : UIViewController
@property (nonatomic, weak) id<DelegateFilter>delegate;
@end
