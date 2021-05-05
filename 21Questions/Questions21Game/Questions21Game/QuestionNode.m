//
//  QuestionNode.m
//  Questions21Game
//
//  Created by hackIntosh on 5/5/21.
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


@end
