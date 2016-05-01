//
//  MLWorldGenerator.h
//  Hop Hero
//
//  Created by Daniel Campbell on 1/7/16.
//  Copyright © 2016 Daniel Campbell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MLWorldGenerator : SKSpriteNode

+ (id)generatorWithWorld:(SKNode *)world;
-(void)populate;
-(void)generate;
-(UIColor *)getRandomColor;

@end
