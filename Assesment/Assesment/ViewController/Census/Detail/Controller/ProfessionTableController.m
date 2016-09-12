//
//  ProfessionTableController.m
//  Assesment
//
//  Created by Vero on 10/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "ProfessionTableController.h"
#import "TextStyles.h"
#import "Profession.h"

@implementation ProfessionTableController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listProfesions.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * CellIdentifier = @"PeopleTableViewCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell){
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"PeopleTableViewCell"];
    }
    [TextStyles primaryTextLight:cell.textLabel];
    cell.textLabel.text = ((Profession *)[_listProfesions objectAtIndex:indexPath.row]).professionName;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0;
}


@end
