//
//  ContentView.swift
//  SwiftUI_Realm_Sort
//
//  Created by 小川卓馬 on 2020/11/23.
//

// 参考資料
// https://ja.stackoverflow.com/questions/35653/realmをデータソースにしてテーブルビューの並べ替えをしたい
// https://www.yururiwork.net/%E3%80%90swiftui%E3%80%91onmove%E6%99%82%E3%81%AE-source-%E3%81%A8-destination-%E3%81%AE%E5%80%A4%E3%81%8C%E4%B8%A6%E3%81%B3%E6%9B%BF%E3%81%88%E6%96%B9%E5%90%91%E3%81%AE%E9%81%95%E3%81%84%E3%81%A7/
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
