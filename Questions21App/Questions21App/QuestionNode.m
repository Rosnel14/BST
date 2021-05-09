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

-(instancetype)initWithFull:(NSString *)textObj yesNode:(QuestionNode *)yesNode noNode:(QuestionNode *)noNode{
    if(self){
           self = [super init];
           self.yes= yesNode;
           self.no = noNode;
           self.text = textObj;
       }
       return self;
}
-(instancetype)initWithText:(NSString *)text{
    if(self){
        self = [super init];
        self.yes = nil;
        self.no = nil;
        self.text = text;
    }
    return self;
}


@end 
