//
//  Item.swift
//  SwiftUI_Realm_Sort
//
//  Created by 小川卓馬 on 2020/11/23.
//

import Foundation

struct Item: Identifiable {
  let id: Int
  let title: String
  let order: Int
}

extension Item {
  init(itemDB: ItemDB) {
    id = itemDB.id
    title = itemDB.title
    order = itemDB.order
  }
}
