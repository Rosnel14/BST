//
//  QuestionTree.h
//  Questions21Game
//
//  Created by hackIntosh on 5/5/21.
//

#ifndef QuestionTree_h
#define QuestionTree_h
#import "QuestionNode.h"

@interface QuestionTree: NSObject

@property QuestionNode * root;

-(instancetype)initWithRoot:(NSString *)root;

-(void)Delete: (NSString *)text;

-(int)height; //for debugging

-(void)inorder; //print in order traversal, might be useful later

-(void)put:(NSString *)text;

-(int)size; 

@end

#endif /* QuestionTree_h */
