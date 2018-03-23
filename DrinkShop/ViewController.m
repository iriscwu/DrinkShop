//
//  ViewController.m
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/7.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import "ViewController.h"
#import "myCellTableViewCell.h"
#import "ShopViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Load json file
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Stores" ofType:@"json"];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    self.dataDictionary  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    self.storeArray = self.dataDictionary[@"stores"];
    
    // Title Label
    self.titleLabel.textColor=[UIColor colorWithRed:0.39 green:0.56 blue:0.60 alpha:1.0];
    self.titleLabel.font =[UIFont boldSystemFontOfSize:40.0f];
    
    // Set dataSource and delegate
    self.storeTable.dataSource = self;
    self.storeTable.delegate = self;
    
    // register
    [self.storeTable registerClass:[myCellTableViewCell class] forCellReuseIdentifier:@"myCellIdentifier"];
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.storeTable reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.storeArray.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellIdentifier"];
    cell.textLabel.text = self.storeArray[indexPath.row][@"name"];
    cell.backgroundColor =[UIColor colorWithRed:0.75 green:0.83 blue:0.84 alpha:1.0];
    cell.textLabel.textColor = [UIColor colorWithRed:0.39 green:0.56 blue:0.60 alpha:1.0];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopViewController *shopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"drinkIdentifier"];
    shopViewController.jsonFile = self.storeArray[indexPath.row][@"filename"];
    shopViewController.shopName = self.storeArray[indexPath.row][@"name"];
    [self.navigationController pushViewController:shopViewController animated:YES];
}


@end
