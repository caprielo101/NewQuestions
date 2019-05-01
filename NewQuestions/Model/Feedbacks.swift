//
//  Feedbacks.swift
//  RealmDemo
//
//  Created by Indra Sumawi on 26/04/19.
//  Copyright © 2019 Indra Sumawi. All rights reserved.
//

import Foundation
import RealmSwift

class Feedbacks: Object {
    @objc dynamic var challenge_id: Int = 0
    @objc dynamic var score: Int = 0
    @objc dynamic var challenge_no: Int = 0
    @objc dynamic var timestamp: Date = Date()
}
