//
//  QuestionData.swift
//  NewQuestions
//
//  Created by Josiah Elisha on 26/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import Foundation

class QuestionData{
    var list = [Questions]()
    
    init() {
        list.append(Questions(number: 1, question: "Little interest or pleasure in doing things?", answer: ["Not at all","Several days","More than half the days","Everyday"], selected: 0))
        
         list.append(Questions(number: 2, question: "Feeling down, depressed, or hopeless?", answer: ["Not at all","Several days","More than half the days","Everyday"], selected: 0))
        
         list.append(Questions(number: 3, question: "Trouble falling or staying asleep, or sleeping too much?", answer: ["Not at all","Several days","More than half the days","Everyday"], selected: 0))
        
        list.append(Questions(number: 4, question: "Feeling tired or having little energy?", answer: ["Not at all","Several days","More than half the days","Everyday"], selected: 0))
        
        list.append(Questions(number: 5, question: "Poor appetite or overeating?", answer: ["Not at all","Several days","More than half the days","Everyday"], selected: 0))
        
        list.append(Questions(number: 6, question: "Feeling bad about yourself — or that you are a failure or have let yourself or your family down?", answer: ["Not at all","Several days","More than half the days","Everyday"], selected: 0))
        
        list.append(Questions(number: 7, question: "Trouble concentrating on things, such as reading the newspaper or watching television?", answer: ["Not at all","Several days","More than half the days","Everyday"], selected: 0))
        
        list.append(Questions(number: 8, question: "Moving or speaking so slowly that other people could have noticed? Or so fidgety or restless that you have been moving a lot more than usual?", answer: ["Not at all","Several days","More than half the days","Everyday"], selected: 0))
        
        list.append(Questions(number: 9, question: "Thoughts that you would be better off dead, or thoughts of hurting yourself in some way?", answer: ["Not at all","Several days","More than half the days","Everyday"], selected: 0))
    }
}
