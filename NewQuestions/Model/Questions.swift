//
//  Questions.swift
//  NewQuestions
//
//  Created by Josiah Elisha on 26/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class Questions {
    let questionNumber:Int
    let questionText:String
    let answerText:[String]
    var selectedAnswer:Int?
    
    init(number:Int, question: String, answer: [String], selected:Int) {
        questionNumber = number
        questionText = question
        answerText = answer
        selectedAnswer = selected
    }
}
