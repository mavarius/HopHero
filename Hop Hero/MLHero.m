//
//  MLHero.m
//  Hop Hero
//
//  Created by Daniel Campbell on 1/7/16.
//  Copyright © 2016 Daniel Campbell. All rights reserved.
//

#import "MLHero.h"

@implementation MLHero

+ (id)hero {
    MLHero *hero = [MLHero spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(40, 40)];
    
    SKSpriteNode *leftEye = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(5, 5)];
    leftEye.position = CGPointMake(-3, 8);
    [hero addChild:leftEye];
    
    SKSpriteNode *rightEye = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(5, 5)];
    rightEye.position = CGPointMake(13, 8);
    [hero addChild:rightEye];
    
    hero.name = @"hero";
    hero.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hero.size];
    return hero;
}

-(void)jump {
    [self.physicsBody applyImpulse:CGVectorMake(0, 40)];
}

-(void)start {
    SKAction *incrementRight = [SKAction moveByX:1.0 y:0 duration:0.006];
    SKAction *moveRight = [SKAction repeatActionForever:incrementRight];
    [self runAction:moveRight];
}

@end
