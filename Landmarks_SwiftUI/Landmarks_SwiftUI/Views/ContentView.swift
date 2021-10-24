import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//                .previewDevice("iPhone X")
            /** プレビューデバイスの変更方法
             https://qiita.com/Michimae/items/87512856bf63ea0fbe65
             */
        }
    }
}
