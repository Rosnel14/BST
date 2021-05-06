//
//  GameRunner.m
//  Questions21App
//
//  Created by Rosnel Leyva-Cortés on 5/6/21.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import "QuestionNode.h"
#import "QuestionTree.h"
#import "GameRunner.h"

@implementation GameRunner

-(instancetype)init{
    if(self){
        self = [super init];
    }
    return self;
}


-(QuestionTree *)startNewGame{
    NSLog(@"No log found!");
    NSLog(@"Initializing a new game");
    NSLog(@"Enter a question about any object: ");
    char qInput[1];
    scanf("%[^\n]%*c",qInput); //possible inputs could be chars with spaces, only 1 slot available thought
    NSString * question = [NSString stringWithUTF8String:qInput];
    NSLog(@"Enter an answer if response is yes: ");
    char yesInput[1];
    scanf("%[^\n]%*c",yesInput); //possible inputs could be chars with spaces, only 1 slot available thought
    NSString * yesNodeTxt = [NSString stringWithUTF8String:yesInput];
    NSLog(@"Enter an answer if response is no:  ");
    char noInput[1];
    scanf("%[^\n]%*c",noInput); //possible inputs could be chars with spaces, only 1 slot available thought
    NSString * noNodeTxt = [NSString stringWithUTF8String:noInput];
    QuestionTree * tempTree = [[QuestionTree alloc] initWithRoot:question yesQuestion:yesNodeTxt noQuestion:noNodeTxt];
    return tempTree;
}

-(void)runGame{
    QuestionTree * gameTree = [self startNewGame];
    NSLog(@"Commencing Game...");
    [gameTree playGame];
}



@end
