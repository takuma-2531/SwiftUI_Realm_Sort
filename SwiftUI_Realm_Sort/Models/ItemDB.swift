//
//  ItemDB.swift
//  SwiftUI_Realm_Sort
//
//  Created by 小川卓馬 on 2020/11/23.
//

import RealmSwift

class ItemDB: Object {
  @objc dynamic var id = ""
  @objc dynamic var title = ""
  @objc dynamic var order = 0

  override class func primaryKey() -> String? {
    "id"
  }
}
