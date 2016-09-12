//
//  FilterViewController.m
//  Assesment
//
//  Created by Vero on 11/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "FilterViewController.h"
#import "TextStyles.h"
#import "UtilsSearchSort.h"
#import "Appearance.h"

@interface FilterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelTiteProfesion;
@property (weak, nonatomic) IBOutlet UITextField *txtProfession;
@property (weak, nonatomic) IBOutlet UILabel *labelTitleHeight;
@property (weak, nonatomic) IBOutlet UISlider *slideHeight;
@property (weak, nonatomic) IBOutlet UILabel *labelHeightMin;
@property (weak, nonatomic) IBOutlet UILabel *labelHeight;
@property (weak, nonatomic) IBOutlet UILabel *labelHeightMax;
@property (weak, nonatomic) IBOutlet UIButton *btnFilter;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
@property (weak, nonatomic) IBOutlet UIView *viewStatus;

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self loadStyle];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadData{
    _labelHeightMin.text = @"All";
    _labelHeightMax.text = @"=> 150";
    _labelTitleHeight.text = @"Height";
    _labelTiteProfesion.text = @"Name of profession";
    _labelHeight.text = @"0";
    
    _slideHeight.minimumValue = 0.0;
    _slideHeight.maximumValue = 150.0;
    
    
    [_btnCancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [_btnFilter setTitle:@"Filter" forState:UIControlStateNormal];
    
}
-(void)loadStyle{
    [TextStyles primaryText:_labelTiteProfesion];
    [TextStyles primaryText:_labelTitleHeight];
    [TextStyles primaryTextLightSmall:_labelHeightMin];
    [TextStyles primaryTextLightSmall:_labelHeightMax];
    [TextStyles primaryTextLight:_labelHeight];
    
    [_viewStatus setBackgroundColor:[Appearance getPrimaryColor]];
    
    [_slideHeight setThumbTintColor:[Appearance getDarkPrimaryColor]];
    [_slideHeight setMinimumTrackTintColor:[Appearance getDarkPrimaryColor]];
    
    [_btnCancel setBackgroundColor:[Appearance getDarkPrimaryColor]];
    [_btnFilter setBackgroundColor:[Appearance getDarkPrimaryColor]];
    
    [_btnFilter setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [_btnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [_btnFilter.layer setCornerRadius:5.0];
    [_btnCancel.layer setCornerRadius:5.0];
    
}
- (IBAction)btnCancelTouch {
    if(_delegate && [_delegate respondsToSelector:@selector(cancelWasTouched)]){
        [_delegate cancelWasTouched];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)btnFilterTouch {
    NSString *profession;
    if(_txtProfession.text.length > 0){
        profession = _txtProfession.text;
    }
    
    float height = [_labelHeight.text floatValue];
    if(_delegate && [_delegate respondsToSelector:@selector(filterTouch:andHeight:)]){
        [_delegate filterTouch:profession andHeight:height];
        
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Slider

- (IBAction)slideTouchEnd:(UISlider *)sender {
    
    _labelHeight.text = [NSString stringWithFormat:@"%0.2f", _slideHeight.value];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
