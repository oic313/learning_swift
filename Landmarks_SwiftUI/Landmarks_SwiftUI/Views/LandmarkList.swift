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
        
        NavigationView {
            // LandmarkにswiftIdentifiableを追加することで、以下のように簡略化できる
            
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }

    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
