//
//  CartViewController.m
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/14.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import "CartViewController.h"
#import "myCellTableViewCell.h"

@interface CartViewController ()

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Cart";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    // Set dataSource and delegate
    self.cartTable.dataSource = self;
    self.cartTable.delegate = self;

    // register
    [self.cartTable registerClass:[myCellTableViewCell class] forCellReuseIdentifier:@"myCellIdentifier"];
    
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = self.cartDictionary.allKeys[section];
    return self.cartDictionary[key].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cartDictionary.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key = self.cartDictionary.allKeys[indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellIdentifier"];
    cell.textLabel.text = self.cartDictionary[key][indexPath.row].drinkString;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *key = self.cartDictionary.allKeys[indexPath.section];
        if (self.cartDictionary[key].count == 1)
        {
            [self.cartDictionary removeObjectForKey:key];
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationLeft];
        }
        else
        {
            NSMutableArray *rowArray = self.cartDictionary[key];
            [rowArray removeObjectAtIndex:indexPath.row];
           
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}

@end
