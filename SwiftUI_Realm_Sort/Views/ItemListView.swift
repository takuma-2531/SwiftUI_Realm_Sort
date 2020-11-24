//
//  ItemListView.swift
//  SwiftUI_Realm_Sort
//
//  Created by 小川卓馬 on 2020/11/23.
//

import SwiftUI

struct ItemListView: View {
  @EnvironmentObject var store: ItemStore
  @State var title = ""
  var items: [Item]
  
  var body: some View {
    VStack {
      HStack {
        Button("プリント", action: {store.printRealm()})
        EditButton()
      }
      
      HStack {
        TextField("タイトルの入力", text: $title)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        Button("決定", action: {
          store.create(title: title, order: items.count)
          title = ""
        })
      }
      .padding()
      List {
        ForEach(items) { item in
          HStack {
            Text(item.title)
            Spacer()
            Text("order:\(item.order)")
          }
        }
        .onDelete { offsets in
          delete(offsets: offsets)
        }
        .onMove { source, destination in
          move(source: source, destination: destination)
        }
      }
    }
  }
}

extension ItemListView {
  private func delete(offsets: IndexSet) {
    guard let index = offsets.first else {
      return
    }
    let deleteId = items[index].id
    let deleteOrder = items[index].order
    for i in (deleteOrder + 1)..<items.count {
      store.update(id: items[i].id, order: items[i].order - 1)
    }
    store.delete(id: deleteId)
  }
  
  private func move(source: IndexSet, destination: Int) {
    store.move(source: source, destination: destination)
  }
}

struct ItemListView_Previews: PreviewProvider {
  static var previews: some View {
    ItemListView(items: ItemMock.itemMock)
  }
}
