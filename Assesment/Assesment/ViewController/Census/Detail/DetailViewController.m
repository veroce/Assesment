//
//  DetailViewController.m
//  Assesment
//
//  Created by Vero on 10/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "DetailViewController.h"
#import "TextStyles.h"
#import "ProfessionTableController.h"
#import "UtilsSearchSort.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Appearance.h"
#import "CollectionController.h"

@interface DetailViewController ()<DelegateCollectionFriends>
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *ageImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UIImageView *weigthImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;
@property (weak, nonatomic) IBOutlet UIImageView *heightImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblHeight;
@property (weak, nonatomic) IBOutlet UIImageView *hairImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblHair;
@property (weak, nonatomic) IBOutlet UILabel *labelProfession;
@property (weak, nonatomic) IBOutlet UIImageView *professionImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableViewProfessions;
@property (weak, nonatomic) IBOutlet UIImageView *friendsImageView;
@property (weak, nonatomic) IBOutlet UILabel *labelFriends;
@property (weak, nonatomic) IBOutlet UICollectionView *friendsCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTableViewHeight;


@property (nonatomic, strong) ProfessionTableController * tableController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnHome;
@property (nonatomic, strong) CollectionController * collectionController;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadStyle];
    [self loadData];
    [self loadTableController];
    [self loadCollectionController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadData{
    [_profileImageView sd_setImageWithURL:[NSURL URLWithString:_person.thumbnail]
                        placeholderImage:[UIImage imageNamed:@"defaultImage"]];
    _lblName.text = _person.name;
    _lblHair.text = _person.hairColor;
    _lblWeight.text = [NSString stringWithFormat:@"%0.2f", _person.weight];
    _lblHeight.text = [NSString stringWithFormat:@"%0.2f", _person.height];
    _lblAge.text = [_person.age stringValue];
    _labelProfession.text = @"Professions";
    _labelFriends.text = @"Friends";

}

-(void) loadStyle{
    
    [Appearance setBorderSemiCircleView:_profileImageView];
    [TextStyles primaryTextBold:_lblName];
    [TextStyles whiteText:_lblAge];
    [TextStyles whiteText:_lblHair];
    [TextStyles whiteText:_lblHeight];
    [TextStyles whiteText:_lblWeight];
    
    [TextStyles primaryTextBold:_labelProfession];
    [Appearance setCircleView:_professionImageView];
    [_professionImageView setBackgroundColor:[Appearance getDarkPrimaryColor]];
    
    [TextStyles primaryTextBold:_labelFriends];
    [Appearance setCircleView:_friendsImageView];
    [_friendsImageView setBackgroundColor:[Appearance getDarkPrimaryColor]];
    
    _constraintTableViewHeight.constant = 44.0 * _person.professions.count;

}

-(void)loadTableController{
    _tableController = [ProfessionTableController new];
    _tableViewProfessions.delegate = _tableController;
    _tableViewProfessions.dataSource = _tableController;
    NSArray * professionSort = [UtilsSearchSort sortProfessionArray:[_person.professions mutableCopy]];
    
    _tableController.listProfesions = professionSort;
    
    [_tableViewProfessions reloadData];
    
}
-(void)loadCollectionController{
    _collectionController = [CollectionController new];
    _friendsCollectionView.delegate = _collectionController;
    _friendsCollectionView.dataSource = _collectionController;
    _collectionController.delegate = self;
    _collectionController.friends = _person.friends;
    [_friendsCollectionView reloadData];
}
- (IBAction)btnHomeTouch:(id)sender {
    //Present home view
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}
#pragma mark - Communication Methods
-(void)comunicationFriendSelected:(People *)friendSeleced{
    //[self performSegueWithIdentifier:@"showDetail" sender:friendSeleced];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    DetailViewController *detail = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detail.person = friendSeleced;
    [self.navigationController pushViewController:detail animated:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
