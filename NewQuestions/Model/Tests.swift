//
//  Tests.swift
//  RealmDemo
//
//  Created by Indra Sumawi on 26/04/19.
//  Copyright © 2019 Indra Sumawi. All rights reserved.
//

import Foundation
import RealmSwift

class Tests: Object {
    @objc dynamic var uuid: String?
    @objc dynamic var score: Int = 0
    @objc dynamic var timestamp: Date = Date()
}
