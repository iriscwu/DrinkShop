//
//  ShopViewController.h
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/9.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataCell.h"
#import "AlertViewController.h"
#import "CartViewController.h"
#import "DrinkData.h"

@interface ShopViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,AlertViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *drinkTable;
@property (nonatomic, strong) NSString *jsonFile;
@property (nonatomic, strong) NSString *shopName;

@property (strong, nonatomic) NSDictionary<NSString *, NSMutableArray*> *drinkDictionary;
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSMutableArray<DrinkData *> *> *cartDictionary;

@end
