//
//  Category.swift
//  SwipeList
//
//  Created by Carlos Solana on 12/26/18.
//  Copyright © 2018 Cybermoth. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
