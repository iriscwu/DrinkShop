//
//  AlertViewController.h
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/13.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrinkData.h"

@protocol AlertViewControllerDelegate
-(void) saveData: (DrinkData *) data;
@end

@interface AlertViewController : UIViewController

@property (weak,nonatomic) id<AlertViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView *alertView;
@property (strong, nonatomic) IBOutlet UIButton *saveBtn;
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UISwitch *largeSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *middleSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *allSSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *halfSSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *noSSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *bubbleSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *sodaSwitch;
@property (strong, nonatomic) IBOutlet UIView *ingredientView;
@property (strong, nonatomic) IBOutlet UIView *sugarView;
@property (strong, nonatomic) IBOutlet UILabel *noSLabel;



@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *idNum;



- (IBAction)clickSave:(id)sender;
- (IBAction)clickCancel:(id)sender;
- (IBAction)changeSize:(id)sender;
- (IBAction)changeSugar:(id)sender;
- (IBAction)changeIngredient:(id)sender;


@end
