//
//  ListNode.m
//  Assignment6
//
//  Created by Rosnel Leyva-Cortés on 4/29/21.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"

@implementation ListNode

-(instancetype)init{
    if(self){
        self = [super init];
        self.left = nil;
        self.right = nil;
        self.object = 0;
    }
    return self;
}

-(instancetype)initWithObject:(int)object {
    if(self){
        self = [super init];
        self.left = nil;
        self.right = nil;
        self.object = object;
    }
    return self;
}

@end
