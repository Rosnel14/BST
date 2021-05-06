//
//  QuestionNode.m
//  Questions21App
//
//  Created by Rosnel Leyva-Cortés on 5/6/21.
//

#import <Foundation/Foundation.h>
#import "QuestionNode.h"

@implementation QuestionNode


-(instancetype)init{
    if(self){
        self = [super init];
        self.yes = nil;
        self.no = nil;
        self.text = nil;
    }
    return self;
}

-(instancetype)initWithText:(NSString *)textObj{
    if(self){
           self = [super init];
           self.yes= nil;
           self.no = nil;
           self.text = textObj;
       }
       return self;
}

//checking if this is a leaf node
-(BOOL)isQuestion{
    if(self.no == nil && self.yes == nil){
        return false;
    }
    return true;
}

-(void)traverse{
    if ([self isQuestion]){
        NSLog(@"%@",self.text);
        NSLog(@"Enter 'y' for yes and 'n' for no: ");
        NSString * input = [self getUserInput];
        if([input isEqualToString:@"y"]){
            [self.yes traverse];
        } else {
            [self.no traverse];
        }
        
    } else {
        [self onQuestionNode];
    }
}

-(void)onQuestionNode{
    NSLog(@"%@,%@,%@",@"Are you think of", self.text ,@"?");
    NSLog(@"Enter 'y' for yes and 'n' for no: ");
    NSString * userInput = [self getUserInput];
    if([userInput isEqualToString:@"y"]){
        NSLog(@"I win!");
    } else {
        //update tree
    }
}

-(void)updateTree{
    NSLog(@"You beat me! What wer you thinking of?");
    NSString * userAnswer = [self getUserInput];
    NSLog(@"Please enter a question for this object: ");
    NSString * userQuestion = [self getUserInput];
    NSLog(@"%@ %@ %@",@"If you were thinking of",userAnswer,@"what would the answer to that question be? (y/n)");
    NSString * storedAnswer = [self getUserInput];
    if([storedAnswer isEqualToString:@"y"]){
        self.no = [[QuestionNode alloc] initWithText:userQuestion];
        self.yes = [[QuestionNode alloc] initWithText:userAnswer];
    } else {
        self.yes = [[QuestionNode alloc] initWithText:self.text];
        self.no = [[QuestionNode alloc] initWithText:userAnswer];
    }
    NSLog(@"You have taught me well...");
    self.text = userQuestion;
}

-(NSString *)getUserInput{
    return @"";
}

@end 
