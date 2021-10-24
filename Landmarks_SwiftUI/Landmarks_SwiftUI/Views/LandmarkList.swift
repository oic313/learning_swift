import SwiftUI

struct LandmarkList: View {
    var body: some View {
//        // LandmarkRowをリストにして出力
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
        
//        // 上記を動的なリストに変更したい
//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
        // LandmarkにswiftIdentifiableを追加することで、以下のように簡略化できる
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }

    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
