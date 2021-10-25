import SwiftUI

@main
struct Landmarks_SwiftUIApp: App {
    // @StateObject: modelDataの初期化
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
