//
//  ViewController.h
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/7.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *storeTable;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong,nonatomic) NSDictionary *dataDictionary;
@property (strong,nonatomic) NSArray *storeArray;

@end

