//
//  MLPointsLabel.h
//  Hop Hero
//
//  Created by Daniel Campbell on 1/8/16.
//  Copyright © 2016 Daniel Campbell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MLPointsLabel : SKLabelNode
@property int number;

+(id)pointsLabelWithFontNamed:(NSString *)fontName;
-(void)increment;
-(void)setPoints:(int)points;
-(void)reset;
@end
