////
////  Testingview.swift
////  VertualLearnUIApp
////
////  Created by Harsha R Mundaragi  on 10/07/23.
////
//
//import SwiftUI
//
//
////struct TestingView: View {
////    @State var isActive : Bool = false
////
////    var body: some View {
////        NavigationView {
////            NavigationLink(
////                destination: ContentView2(rootIsActive: self.$isActive),
////                isActive: self.$isActive
////            ) {
////                Text("Hello, World!")
////            }
////            .isDetailLink(false)
////            .navigationBarTitle("Root")
////        }
////    }
////}
////
////struct ContentView2: View {
////    @Binding var rootIsActive : Bool
////
////    var body: some View {
////        NavigationLink(destination: ContentView3(shouldPopToRootView: self.$rootIsActive)) {
////            Text("Hello, World #2!")
////        }
////        .isDetailLink(false)
////        .navigationBarTitle("Two")
////    }
////}
////
////struct ContentView3: View {
////    @Binding var shouldPopToRootView : Bool
////
////    var body: some View {
////        VStack {
////            Text("Hello, World #3!")
////            Button (action: {
////                print("before test : \(shouldPopToRootView)")
////                self.shouldPopToRootView = false
////                print("After test : \(shouldPopToRootView)")
////            } ){
////                Text("Pop to root")
////            }
////        }.navigationBarTitle("Three")
////    }
////}
//
////struct TestingView_Previews: PreviewProvider {
////    static var previews: some View {
////        TestingView()
////    }
////}
//
//
//import SwiftUI
//
//struct TestingView: View {
//    @State private var showFullText = false
//
//    let originalText = "Figma is a very powerful application that runs online. There are virtually no platform boundaries when it comes to using Figma because you can design within a web browser or using their desktop application made for Windows and Macs. Figma is similar to Sketch and Adobe XD but is the more powerful of the three when it comes to."
//
//    var displayedText: String {
//        if showFullText {
//            return originalText
//        } else {
//            let truncatedText = originalText.prefix(200) + "..."
//            return String(truncatedText)
//        }
//    }
//
//    var body: some View {
//        VStack {
//            Text(displayedText)
//                .padding()
//
//            Button(action: {
//                showFullText.toggle()
//            }) {
//                Text(showFullText ? "Show Less" : "Show More")
//                    .font(.headline)
//                    .foregroundColor(.blue)
//                    .padding()
//            }
//        }
//    }
//}
//
//struct TestingView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestingView()
//    }
//}
//
//
//
//


//import SwiftUI
//
//struct TimerView: View {
//    @State private var remainingTime = 60 // 10 minutes in seconds
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    var body: some View {
//        VStack {
//            Text("Remaining Time is:")
//                .font(.headline)
//            Text("\(timeString(remainingTime))")
//                .font(.title)
//        }
//        .onReceive(timer) { _ in
//            if remainingTime > 0 {
//                remainingTime -= 1
//            }
//        }
//    }
//
//    private func timeString(_ time: Int) -> String {
//        let minutes = time / 60
//        let seconds = time % 60
//        return String(format: "%d:%02d", minutes, seconds)
//    }
//}
//
//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView()
//    }
//}


