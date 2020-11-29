//
//  ItemStore.swift
//  SwiftUI_Realm_Sort
//
//  Created by 小川卓馬 on 2020/11/23.
//

import RealmSwift

final class ItemStore: ObservableObject {
  
  private var itemResults: Results<ItemDB>
  
  init(realm: Realm) {
    itemResults = realm.objects(ItemDB.self)
      .sorted(byKeyPath: "order")
  }
  
  var items: [Item] {
    itemResults.map(Item.init)
  }
}

extension ItemStore {
  func create(title: String, order: Int) {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      
      let itemDB = ItemDB()
      itemDB.id = UUID().hashValue
      itemDB.title = title
      itemDB.order = order
      try realm.write {
        realm.add(itemDB)
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func delete(id: Int) {
    objectWillChange.send()
    
    guard let itemDB = itemResults.first(where: { $0.id == id }) else {
      return
    }
    
    do {
      let realm = try Realm()
      try realm.write {
        realm.delete(itemDB)
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func update(id: Int, order: Int) {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      try realm.write {
        realm.create(ItemDB.self,
                     value: ["id": id,
                             "order": order],
                     update: .modified)
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func move(sourceIndexSet: IndexSet, destination: Int) {
    guard let source = sourceIndexSet.first else {
      return
    }
    
    let moveId = items[source].id
    
    if source < destination {
      for i in (source + 1)...(destination - 1) {
        update(id: items[i].id, order: items[i].order - 1)
      }
      update(id: moveId, order: destination - 1)
      
    } else if destination < source {
      for i in destination...(source - 1) {
        update(id: items[i].id, order: items[i].order + 1)
      }
      update(id: moveId, order: destination)
      
    } else {
      return
    }
  }
  
  func printRealm() {
    print(itemResults)
  }
}
