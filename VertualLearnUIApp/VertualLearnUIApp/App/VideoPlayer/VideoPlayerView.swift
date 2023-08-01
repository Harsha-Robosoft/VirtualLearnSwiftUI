//
//  VideoPlayerView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 18/07/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @Environment(\.presentationMode) var presentationMode
    let chapNum: Int
    let videoFileName: String
    let videoFileType: String
    let viewTitle: String
    @ObservedObject var helper = HelperClass.shared
    @Binding var toggleIt: Bool
    @Binding var showNext: Bool
    var body: some View {
        VStack{
            VideoPlayer(player: playVideo(fileName: videoFileName, fileFormat: videoFileType))
                .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.all)
        .overlay(
            HStack(alignment: .center, spacing: 0){
                Spacer()
                Text(viewTitle)
                    .font(.body)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                Spacer()
            }.overlay(
                Image(systemName: "arrowshape.left.fill")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(.leading)
                    .onTapGesture {
                        if helper.completedVideos.contains(viewTitle){
                            toggleIt.toggle()
                            showNext = false
                        }else{
                            let str = viewTitle + String(chapNum)
                            helper.completedVideos.append(str)
                            toggleIt.toggle()
                            showNext = true
                        }
                        presentationMode.wrappedValue.dismiss()
                    },
                alignment: .leading
            ),
            alignment: .top
        )
    }
}

//import SwiftUI
//import AVKit
//
//struct VideoPlayerView: View {
//    @Environment(\.presentationMode) var presentationMode
//    let videoFileName: String
//    let videoFileType: String
//    let viewTitle: String
//
//    @State private var player: AVPlayer?
//    @State private var isPlaying = true
//
//    var body: some View {
//        VStack {
//            if let player = player {
//                VideoPlayer(player: player)
//                    .navigationBarHidden(true)
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//        .onAppear(perform: {
//            setupPlayer()
//        })
//        .overlay(
//            HStack(alignment: .center, spacing: 0){
//                Spacer()
//                Text(viewTitle)
//                    .font(.body)
//                    .fontWeight(.medium)
//                    .fontDesign(.rounded)
//                    .foregroundColor(.white)
//                Spacer()
//            }.overlay(
//                Image(systemName: "arrowshape.left.fill")
//                    .foregroundColor(.white)
//                    .font(.title2)
//                    .padding(.leading)
//                    .onTapGesture {
//                        printVideoDuration()
//                        presentationMode.wrappedValue.dismiss()
//                    },
//                alignment: .leading
//            ),
//            alignment: .top
//        )
//    }
//
//    private func setupPlayer() {
//        guard let url = Bundle.main.url(forResource: videoFileName, withExtension: videoFileType) else {
//            print("Error: Video file not found.")
//            return
//        }
//
//        let player = AVPlayer(url: url)
//        self.player = player
//
//        // Add an observer to monitor playback status changes
//        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 600), queue: .main) { time in
//            self.isPlaying = player.rate != 0 && player.error == nil
//
//            // Print the status of the video (true for playing, false for paused)
//            print("Video is playing: \(self.isPlaying)")
//        }
//
//        player.play()
//    }
//
//    private func printVideoDuration() {
//        guard let player = player else {
//            return
//        }
//
//        let duration = player.currentItem?.duration.seconds ?? 0
//        print("Video duration: \(duration) seconds")
//    }
//}
