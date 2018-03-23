//
//  DrinkData.h
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/13.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrinkData : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *size;
@property (nonatomic,strong) NSString *sugar;

@property (nonatomic,strong) NSString *drinkString;
@property (nonatomic,strong) NSString *idNum;


@property (nonatomic) BOOL bubble;
@property (nonatomic) BOOL soda;

@property (nonatomic,strong) NSString *bubbleString;
@property (nonatomic,strong) NSString *sodaString;

-(void) getDrinkString;

@end
