//
//  MLPointsLabel.m
//  Hop Hero
//
//  Created by Daniel Campbell on 1/8/16.
//  Copyright © 2016 Daniel Campbell. All rights reserved.
//

#import "MLPointsLabel.h"

@implementation MLPointsLabel

+(id)pointsLabelWithFontNamed:(NSString *)fontName {
    MLPointsLabel *pointsLabel = [MLPointsLabel labelNodeWithFontNamed:fontName];
    pointsLabel.name = @"pointsLabel";
    pointsLabel.text = @"0";
    pointsLabel.number = 0;
    return pointsLabel;
}

-(void)increment {
    self.number++;
    self.text = [NSString stringWithFormat:@"%i", self.number];
}

-(void)setPoints:(int)points {
    self.number = points;
    self.text = [NSString stringWithFormat:@"%i", self.number];
}

-(void)reset {
    self.number = 0;
    self.text = @"0";
}

@end
