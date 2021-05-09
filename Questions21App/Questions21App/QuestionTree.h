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
-(instancetype)init;

-(int)height; //for debugging

-(void)inorder; //print in order traversal, might be useful later

-(void)put:(NSString *)text;

-(int)size;


@end

#endif /* QuestionTree_h */
