//
//  GameRunner.h
//  Questions21App
//
//  Created by Rosnel Leyva-Cortés on 5/6/21.
//

#ifndef GameRunner_h
#define GameRunner_h

#import "QuestionNode.h"
#import "QuestionTree.h"

@interface GameRunner: NSObject

-(QuestionTree *)startNewGame;

-(instancetype)init;

-(void)runGame;

-(BOOL)playAgain;

-(void)playFullGame;

@end

#endif /* GameRunner_h */
