//
//  ContentView.swift
//  SwiftUI_Realm_Sort
//
//  Created by 小川卓馬 on 2020/11/23.
//

// 参考資料
// https://ja.stackoverflow.com/questions/35653/realmをデータソースにしてテーブルビューの並べ替えをしたい
// https://www.yururiwork.net/【swiftui】onmove時の-source-と-destination-の値が並び替え方向の違いで/
// https://qiita.com/yokirin/items/588d3fdeb3610a639dc7


import SwiftUI

struct ContentView: View {
  @EnvironmentObject var store: ItemStore
  
  var body: some View {
    ItemListView(items: store.items)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
