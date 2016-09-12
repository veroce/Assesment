//
//  CensusViewController.m
//  Assesment
//
//  Created by Vero on 30/8/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "CensusViewController.h"
#import "DetailViewController.h"
#import "CensusTableController.h"
#import "RestkitManager.h"
#import "Constants.h"
#import "UtilsSearchSort.h"
#import "TextStyles.h"
#import "FilterViewController.h"

@interface CensusViewController ()<DelegateTableCensus, UISearchBarDelegate, DelegateRestKitManager, DelegateFilter>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) UISearchController * searchController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray * listCensus;
@property (nonatomic, strong) NSArray * listSearch;

@property (nonatomic, strong) CensusTableController * tableController;
@property (nonatomic, strong) RestkitManager * restKitManager;

@property (nonatomic) BOOL isSearching;
@property (weak, nonatomic) IBOutlet UILabel *lblNoResults;
@end

@implementation CensusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initialData];
    [self loadData];
    [self loadStyle];
    [self downloadData];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self registerForKeyboardNotifications];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Initial methods
-(void)initialData{
    //TableView
    _tableController = [[CensusTableController alloc] init];
    _tableView.delegate = _tableController;
    _tableView.dataSource = _tableController;
    _tableController.delegate = self;
    _lblNoResults.hidden = YES;
    
    // Rest kit
    
    _restKitManager = [RestkitManager new];
    [_restKitManager configureRestKit];
    _restKitManager.delegate = self;
    
    _searchBar.delegate = self;
    
    
}

-(void)downloadData{
    [_restKitManager loadPeople];
    
}

-(void)loadData{
    _lblNoResults.text = @"No Results";
    _searchBar.placeholder = @"Search";

}

-(void) loadStyle{
    [TextStyles secondaryTextBold:_lblNoResults];
    [_searchBar setShowsCancelButton:NO];

    
}
#pragma mark - Search Controller
#pragma mark -  Search Methods
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    _isSearching = YES;
    _searchBar.showsCancelButton = YES;

}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if([searchText length] != 0) {
        _isSearching = YES;
        _searchBar.showsCancelButton = YES;
        [self reloadTable:searchText];
    }
    else {
        _isSearching = NO;
        _searchBar.showsCancelButton = NO;

    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    _isSearching = NO;
    _searchBar.showsCancelButton = NO;
    _searchBar.text = @"";
    [self reloadTable:nil];
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self reloadTable:searchBar.text];
    [searchBar resignFirstResponder];
}
-(void)reloadTable:(NSString *)name{
        if(name){
            _listSearch = [UtilsSearchSort filterPersonArrayByName:[_listCensus mutableCopy] byText:name];
            _tableController.listCensus = _listSearch;
            if(_listSearch.count > 0){
                _lblNoResults.hidden = YES;
                _tableView.hidden = NO;
            }else{
                
                _lblNoResults.hidden = NO;
                _tableView.hidden = YES;

            }
        }else{
            _tableController.listCensus = _listCensus;
            _lblNoResults.hidden = YES;
            _tableView.hidden = NO;

        }
        [_tableView reloadData];

}

- (IBAction)btnFilterTouch:(id)sender {
   FilterViewController *filter = [[FilterViewController alloc] initWithNibName:@"FilterViewController" bundle:nil];
    filter.delegate = self;
    [self presentViewController:filter animated:YES completion:nil];
}


#pragma mark - Communication methods
-(void)communicationObjectSelected:(People *)object{
    if(object){
        object = [People setRelationFriends:[_listCensus mutableCopy] person:object];
        [self performSegueWithIdentifier:@"showDetail" sender:object];
    }
}
-(void)filterTouch:(NSString *)profession andHeight:(float)height{
    _listSearch = [UtilsSearchSort filterList:[_listCensus mutableCopy] byProfession:profession height:height];
    _tableController.listCensus = _listSearch;

    if(_listSearch.count > 0){
        _lblNoResults.hidden = YES;
        _tableView.hidden = NO;
    }else{
        _lblNoResults.hidden = NO;
        _tableView.hidden = YES;
    }
    [_tableView reloadData];
}

-(void)cancelWasTouched{
    _tableController.listCensus = _listCensus;
    _lblNoResults.hidden = YES;
    _tableView.hidden = NO;
    [_tableView reloadData];
}

-(void)communicationDownloadFinished:(NSArray *)listCensus WithError:(NSInteger)error{
    if(error == kRESPONSE_OK){
        _listCensus = listCensus;
        _listCensus = [UtilsSearchSort sortNamePersonArray:[_listCensus mutableCopy]];
        _tableController.listCensus = _listCensus;
        
    }
    [_tableView reloadData];
}
#pragma mark - Scroll when  keyboard appears
// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.searchBar.frame.origin) ) {
        [self.tableView scrollRectToVisible:self.searchBar.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"showDetail"]){
        DetailViewController * viewController = segue.destinationViewController;
        viewController.person = sender;
    }
}


@end
