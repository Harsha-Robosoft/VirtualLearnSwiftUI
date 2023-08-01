//
//  TestCompletedView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 24/07/23.
//

import SwiftUI

struct TestCompletedView: View {
    @Binding var showResultsScreen: Bool
    let chapter: ChaptersList
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .center,spacing: 0){
            HStack{
                Image(systemName: "xmark")
                    .font(.title2)
                    .onTapGesture{
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
            }
            .padding(.top, 35)
            Spacer()
            Image("img_moduletest_success_illustration")
            Text("Congratulations!")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding(.top, 40)
                
            Text("You have completed \(chapter.chapterName) from Course: \(chapter.courseName)")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top)
            Spacer()
            
            Button{
                presentationMode.wrappedValue.dismiss()
                showResultsScreen = true
            }label: {
                Text("Result")
                    .fontWeight(.medium)
                    .foregroundColor(.red.opacity(0.8))
            }
            Spacer()
        }
        .fontDesign(.rounded)
        .padding(.horizontal)
    }
}

struct TestCompletedView_Previews: PreviewProvider {
    @State static var showResultcSreen = false
    static var previews: some View {
        TestCompletedView(showResultsScreen: $showResultcSreen, chapter: HelperClass.shared.homeChoiceYourCourseCollectionViewdata[0].chaptersList[0])
    }
}
