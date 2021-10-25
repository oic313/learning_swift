import SwiftUI

struct LandmarkList: View {
    // @EnvironmentObject: アプリ全体で共通のインスタンス
    @EnvironmentObject var modelData: ModelData
    // @State: 変更可能なプロパティ。基本SwiftUIはプロパティの値を変更できない
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
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
            //            // LandmarkにswiftIdentifiableを追加することで、以下のように簡略化できる
            //            List(filteredLandmarks) { landmark in
            // お気に入りフィルターのオンオフ切り替えに合わせてリストを切り替える
            List {
                // @Stateプロパティの値を変更するアクセスには$をつける
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
        //            LandmarkList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
        //        }
        
        // EnvironmentObjectであるModelDataのインスタンスを紐付ける
        LandmarkList()
            .environmentObject(ModelData())        
    }
}
