//
//  DepressionTests.swift
//  RealmDemo
//
//  Created by Indra Sumawi on 26/04/19.
//  Copyright © 2019 Indra Sumawi. All rights reserved.
//

import Foundation
import RealmSwift

class DepressionTests: Object {
    @objc dynamic var lowerRange: Int = 0
    @objc dynamic var upperRange: Int = 0
    @objc dynamic var category: String?
    @objc dynamic var comment: String?
}
