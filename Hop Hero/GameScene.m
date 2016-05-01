//
//  GameScene.m
//  Hop Hero
//
//  Created by Daniel Campbell on 1/7/16.
//  Copyright (c) 2016 Daniel Campbell. All rights reserved.
//

#import "GameScene.h"
#import "MLHero.h"
#import "MLWorldGenerator.h"
#import "MLPointsLabel.h"

@interface GameScene ()
@property BOOL isStarted;
@property BOOL isGameOver;
@end

@implementation GameScene {
    MLHero *hero;
    SKNode *world;
    MLWorldGenerator *generator;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    self.anchorPoint = CGPointMake(0.5, 0.5);
    self.backgroundColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.9 alpha:1.0];
    
    world = [SKNode node];
    [self addChild:world];
    
    generator = [MLWorldGenerator generatorWithWorld:world];
    [self addChild:generator];
    [generator populate];
    
    hero = [MLHero hero];
    [world addChild:hero];
    
    MLPointsLabel *pointsLabel = [MLPointsLabel pointsLabelWithFontNamed:@"helvetica"];
    pointsLabel.position = CGPointMake(0, 100);
    [self addChild:pointsLabel];
}

-(void)start {
    self.isStarted = YES;
    [hero start];
}

-(void)clear {
    NSLog(@"clear method called");
}

-(void)gameOver {
    NSLog(@"gameOver method called");
}

-(void)didSimulatePhysics {
    [self centerOnNode:hero];
    [self handlePoints];
    [self handleGeneration];
    [self handleCleanup];
}


-(void)handlePoints {
    [world enumerateChildNodesWithName:@"obstacle" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.x < hero.position.x) {
            MLPointsLabel *pointsLabel = (MLPointsLabel *)[self childNodeWithName:@"pointsLabel"];
            [pointsLabel increment];
        }
    }];
}

-(void)handleGeneration {
    [world enumerateChildNodesWithName:@"obstacle" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.x < hero.position.x) {
            node.name = @"obstacle_cancelled";
            [generator generate];
        }
    }];
}

-(void)handleCleanup {
    [world enumerateChildNodesWithName:@"ground" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.x < hero.position.x - self.frame.size.width/2 - node.frame.size.width/2) {
            [node removeFromParent];
        }
    }];
    
    [world enumerateChildNodesWithName:@"obstacle_cancelled" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.x < hero.position.x - self.frame.size.width/2 - node.frame.size.width/2) {
            [node removeFromParent];
        }
    }];
}

-(void)centerOnNode:(SKNode *)node{
    CGPoint positionInScene = [self convertPoint:node.position fromNode:node.parent];
    world.position = CGPointMake(world.position.x - positionInScene.x, world.position.y);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self.isStarted) {
        [self start];
    } else if (self.isGameOver) {
        [self clear];
    } else {
        [hero jump];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
