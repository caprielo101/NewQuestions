//
//  Challenges.swift
//  RealmDemo
//
//  Created by Indra Sumawi on 26/04/19.
//  Copyright © 2019 Indra Sumawi. All rights reserved.
//

import Foundation
import RealmSwift

class Challenges: Object {
    @objc dynamic var id = 0
    @objc dynamic var tiitle: String?
    @objc dynamic var desc: String?
}
