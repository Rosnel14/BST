//
//  QuestionTree.h
//  Questions21App
//
//  Created by Rosnel Leyva-Cortés on 5/6/21.
//

#ifndef QuestionTree_h
#define QuestionTree_h

#import "QuestionNode.h"

@interface QuestionTree: NSObject

@property QuestionNode * root;

//start with a question
-(instancetype)initWithRoot: (NSString *)rootObj yesQuestion:(NSString *)yesQ noQuestion:(NSString *)noQ;

-(void)Delete: (NSString *)text;

-(int)height; //for debugging

-(void)inorder; //print in order traversal, might be useful later

-(void)put:(NSString *)text;

-(int)size;

-(void)playGame;

@end

#endif /* QuestionTree_h */
