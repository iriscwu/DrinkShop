//
//  DrinkData.m
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/13.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import "DrinkData.h"



@implementation DrinkData

@synthesize bubble = _bubble;
@synthesize soda = _soda;

-(void) setBubble:(BOOL)bubble{
    if(bubble)
    {
        self.bubbleString = @",Add Bubble";
    }
    else
    {
        self.bubbleString = @"";
    }
    _bubble = bubble;
}

-(BOOL) bubble
{
    return _bubble;
}

-(void) setSoda:(BOOL)soda{
    if(soda)
    {
        self.sodaString = @",Add Soda";
    }
    else
    {
        self.sodaString = @"";
    }
    _soda = soda;
}

-(BOOL) soda
{
    return _soda;
}

-(void) getDrinkString
{
   self.drinkString = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ ", self.name, self.size, self.sugar, self.bubbleString, self.sodaString];
}

@end
