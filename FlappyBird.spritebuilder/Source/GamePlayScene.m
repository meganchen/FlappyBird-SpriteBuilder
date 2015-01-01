#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene
-(void)initialize
{
    character = (Character*)[CCBReader load:@"Character"];
    [self addChild:character]; //creates Flappybird character
    [self addObstacle]; //adds the first obstacle
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    
    //increment timeSinceObstacle, the time since the last obstacle was added
    timeSinceObstacle += delta; //delta is ~1/60 sec
    
    //check if 2 seconds have passed
    if (timeSinceObstacle > 2.0f){
        [self addObstacle]; //adds another obstacle
        timeSinceObstacle = 0.0f; //resets timer
    }
}

//my own methods
//this is called every time a user touches the screen
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [character flap];
}

@end
