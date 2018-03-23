//
//  ShopViewController.m
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/9.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController ()
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Load json file
    self.jsonFile = [self.jsonFile stringByReplacingOccurrencesOfString:@".json" withString:@""];
    NSString *path = [[NSBundle mainBundle] pathForResource: self.jsonFile ofType:@"json"];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    self.drinkDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
   
    
    // Set dataSource and delegate
    self.drinkTable.dataSource = self;
    self.drinkTable.delegate = self;

    // NavigationItem
    UIBarButtonItem *cartButton = [[UIBarButtonItem alloc] initWithTitle:@"Cart" style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(clickCart)];
    self.navigationItem.rightBarButtonItem = cartButton;
    
    self.cartDictionary = [NSMutableDictionary new];
    [self.drinkTable registerNib:[UINib nibWithNibName:@"DataCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = self.shopName;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    self.navigationController.navigationBar.tintColor =  [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor blackColor]}];
    [self.drinkTable reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key =[[self.drinkDictionary allKeys] objectAtIndex:section];
    return self.drinkDictionary[key].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.drinkDictionary.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //DataCell *cell = [[NSBundle mainBundle] loadNibNamed:@"DataCell" owner:nil options:nil].firstObject;
    DataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *key =[[self.drinkDictionary allKeys] objectAtIndex:indexPath.section];
    cell.nameLabel.text = self.drinkDictionary[key][indexPath.row][@"name"];
    NSString *num = self.drinkDictionary[key][indexPath.row][@"id"];
    if(self.cartDictionary[num])
    {
        NSString *inStr = [NSString stringWithFormat:@"%ld", (long)self.cartDictionary[num].count];
        cell.countLabel.text = inStr;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AlertViewController * testVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"alertIdentifier"];
    
    self.definesPresentationContext = YES;
    testVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    NSString *key =[[self.drinkDictionary allKeys] objectAtIndex:indexPath.section];
    testVC.name = self.drinkDictionary[key][indexPath.row][@"name"];
    testVC.type = self.drinkDictionary[key][indexPath.row][@"type"];
    testVC.idNum = self.drinkDictionary[key][indexPath.row][@"id"];
    testVC.delegate = self;
    
    [self presentViewController:testVC animated:YES completion:nil];

}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    //Create section header
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    label.font = [UIFont boldSystemFontOfSize:14];
    NSString *labelString = [self.drinkDictionary allKeys][section];
    label.text = labelString;
    [view addSubview:label];
    view.backgroundColor =[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0];
    return view;
}

- (void)saveData:(DrinkData*) data {
    // check cart exit item
    if(self.cartDictionary[data.idNum]){
        [self.cartDictionary[data.idNum] addObject:data];
    }
    else{
        NSMutableArray *arrData = [NSMutableArray new];
        [arrData addObject:data];
        self.cartDictionary[data.idNum] = arrData;
    };
    [self.drinkTable reloadData];
}

-(void) clickCart{
    CartViewController *cartViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"cartIdentifier"];
    cartViewController.cartDictionary = self.cartDictionary;
    [self.navigationController pushViewController:cartViewController animated:YES];
}


@end
