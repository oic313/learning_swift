import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkRow(landmark: landmarks[1])
//            .previewLayout(.fixed(width: 300, height: 70))    // Previewの表示領域を表示したいUIに合わせて小さくしている
//        LandmarkRow(landmark: landmarks[2])
//            .previewLayout(.fixed(width: 300, height: 70))
        
        
        // 上記を簡略的に書く方法
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))    // Previewの表示領域を表示したいUIに合わせて小さくしている
    }
}
