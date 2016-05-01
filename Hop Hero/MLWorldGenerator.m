//
//  MLWorldGenerator.m
//  Hop Hero
//
//  Created by Daniel Campbell on 1/7/16.
//  Copyright © 2016 Daniel Campbell. All rights reserved.
//

#import "MLWorldGenerator.h"

@interface MLWorldGenerator ()
@property double currentGroundX;
@property double currentObstacleX;
@property SKNode *world;
@end

@implementation MLWorldGenerator

+ (id)generatorWithWorld:(SKNode *)world {
    MLWorldGenerator *generator = [MLWorldGenerator node];
    generator.currentGroundX = 0;
    generator.currentObstacleX = 400;
    generator.world = world;
    return generator;
}

-(void)populate {
    for (int i=0; i<3; i++) {
        [self generate];
    }
}

-(void)generate {
    SKSpriteNode *ground = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(self.scene.frame.size.width, 100)];
    ground.name = @"ground";
    ground.position = CGPointMake(self.currentGroundX, -self.scene.frame.size.height/2 + ground.frame.size.height/2);
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.dynamic = NO;
    [self.world addChild:ground];
    
    self.currentGroundX += ground.frame.size.width;
    
    SKSpriteNode *obstacle = [SKSpriteNode spriteNodeWithColor:[self getRandomColor] size:CGSizeMake(20, 70)];
    obstacle.name = @"obstacle";
    obstacle.position = CGPointMake(self.currentObstacleX, ground.position.y + ground.frame.size.height/2 + obstacle.frame.size.height/2);
    obstacle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:obstacle.size];
    obstacle.physicsBody.dynamic = NO;
    [self.world addChild:obstacle];
    
    self.currentObstacleX += 250;
}

-(UIColor *)getRandomColor {
    int rand = arc4random() % 6;
    
    UIColor *color;
    switch (rand) {
        case 0:
            color = [UIColor redColor];
            break;
        case 1:
            color = [UIColor orangeColor];
            break;
        case 2:
            color = [UIColor yellowColor];
            break;
        case 3:
            color = [UIColor whiteColor];
            break;
        case 4:
            color = [UIColor purpleColor];
            break;
        case 5:
            color = [UIColor blackColor];
            break;
        default:
            break;
    }
    
    return color;
}

@end
