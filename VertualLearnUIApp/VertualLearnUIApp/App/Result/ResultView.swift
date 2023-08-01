//
//  ResultView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 25/07/23.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var helper = HelperClass.shared
    let chapter: ChaptersList
    let collectionIndex: Int
    let tappedIndex: Int
    
    @State var showDetails = false
    @State var tappedQuestion = 0
    
    @State var option01 = 0
    @State var option02 = 0
    @State var option03 = 0
    @State var option04 = 0
    
    func checkForCondition(){
        if let chap = chapter.testIs?.testDetsails[tappedQuestion]{

            if chap.questionAttempted{
                if chap.answer  == chap.correctAnswer  && chap.correctAnswer == chap.option01 || chap.correctAnswer == chap.option01 {
                    option01 = 1
                }else if chap.correctAnswer != chap.answer && chap.answer == chap.option01{
                    option01 = 2
                }else{
                    option01 = 0
                }

                if chap.answer  == chap.correctAnswer  && chap.correctAnswer == chap.option02 || chap.correctAnswer == chap.option02{
                    option02 = 1
                }else if chap.correctAnswer != chap.answer && chap.answer == chap.option02{
                    option02 = 2
                }else{
                    option02 = 0
                }

                if chap.answer  == chap.correctAnswer  && chap.correctAnswer == chap.option03 || chap.correctAnswer == chap.option03{
                    option03 = 1
                }else if chap.correctAnswer != chap.answer && chap.answer == chap.option03{
                    option03 = 2
                }else{
                    option03 = 0
                }

                if chap.answer  == chap.correctAnswer  && chap.correctAnswer == chap.option04 || chap.correctAnswer == chap.option04{
                    option04 = 1
                }else if chap.correctAnswer != chap.answer && chap.answer == chap.option04{
                    option04 = 2
                }else{
                    option04 = 0
                }
            }
            else{
                if chap.correctAnswer == chap.option01{
                    option01 = 1
                    option02 = 0
                    option03 = 0
                    option04 = 0
                }else if chap.correctAnswer == chap.option02{
                    option02 = 1
                    option01 = 0
                    option03 = 0
                    option04 = 0
                }else if chap.correctAnswer == chap.option03{
                    option03 = 1
                    option02 = 0
                    option01 = 0
                    option04 = 0
                }else if chap.correctAnswer == chap.option04{
                    option04 = 1
                    option02 = 0
                    option03 = 0
                    option01 = 0
                }
            }

        }
    }
    
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0){
                VStack(alignment: .leading, spacing: 25){
                    HStack{
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.white)
                            .onTapGesture{
                                presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                    }
                    .padding(.top, 50)
                    
                    HStack(alignment: .center, spacing: 10){
                        Text("80")
                            .font(.system(size: 45))
                            .foregroundColor(.white)
                            .padding(4)
                            .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.yellow)
                            )
                        
                        Text(helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapterName)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .frame(height: 60)
                    }
                    
                    Text("Course: \(helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].courseName)")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    ZStack{
                        Color.white
                        HStack(alignment: .center, spacing: 0){
                            ResultSegmentView(text01: "Passing Grade", text02: "\(helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testResult.passgrad ?? "00")/100")
                                .padding(.trailing)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(width: 1, height: 34)
                                .padding(.horizontal, 10)
                            
                            ResultSegmentView(text01: "Correct", text02: "\(helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testResult.correctAnswer ?? "0")/\(chapter.testIs?.testDetsails.count ?? 00)")
                                .padding(.horizontal)
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(width: 1, height: 34)
                                .padding(.horizontal, 10)
                            
                            ResultSegmentView(text01: "   Wrong    ", text02: "\(helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testResult.wrongAnswer ?? "0")/\(chapter.testIs?.testDetsails.count ?? 00)")
                                .padding(.leading)
                        }
                        
                    }
                    .cornerRadius(8)
                    .padding(.top, 20)
                    .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 10)
                    
                }
                .padding(.horizontal)
                .frame(width: UIScreen.screenWidth, height: 250)
                .background(Color.accentColor)
                
                VStack(alignment: .leading, spacing: 0){
                    HStack{
                        Text("List of questions")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    ForEach(0..<chapter.testIs!.testDetsails.count) { num in
                        VStack(alignment: .center, spacing: 0) {
                            VStack(alignment: .center, spacing: 10) {
                                HStack(alignment: .center){
                                    VStack(alignment: .leading, spacing: 5){
                                        Text("Question \(num + 1)")
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        
                                        Text( chapter.testIs!.testDetsails[num].correctAnswer == chapter.testIs!.testDetsails[num].answer ? "Correct Answer" : chapter.testIs!.testDetsails[num].questionAttempted ? "Wrong Answer" : "You have not attemted this question")
                                            .font(.footnote)
                                            .foregroundColor( chapter.testIs!.testDetsails[num].correctAnswer == chapter.testIs!.testDetsails[num].answer ? .green : .red)
                                    }
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                Divider()
                            }
                        }
                        .onTapGesture{
                            tappedQuestion = num
                            checkForCondition()
                            withAnimation(.easeOut){
                                showDetails = true
                            }
                        }
                        .padding(.top, 30)
                    }
                    
                    
                }
                .padding(.top, 70)
                .padding(.horizontal)

                Spacer()
                
                    .navigationBarHidden(true)
            }
            .fontDesign(.rounded)
        .padding(.horizontal)
            
            //MARK: - Question Details
            
            ZStack{
                Color.black.opacity( showDetails ? 0.5 : 0)
            }
            .onTapGesture{
                withAnimation(.easeIn){
                    showDetails = false
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 0){
                    HStack{
                        Spacer()
                        Text("Question \(tappedQuestion + 1)")
                            .font(.body)
                            .fontWeight(.medium)
                            .padding(30)
                        Spacer()
                    }
                    .overlay(
                        Image(systemName: "xmark")
                            .fontWeight(.medium)
                            .padding(.vertical)
                            .padding(.trailing, 40)
                            .onTapGesture{
                                withAnimation(.easeIn){
                                    showDetails = false
                                }
                            },
                        alignment: .trailing
                    )
                    
                    HStack {
                        Text(chapter.testIs!.testDetsails[tappedQuestion].question)
                            .font(.body)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                        .lineSpacing(5)
                        Spacer()
                    }
                    
                    VStack(spacing: 20){
                        OptionView(option: chapter.testIs!.testDetsails[tappedQuestion].option01,status: $option01  )
                        
                        OptionView(option: chapter.testIs!.testDetsails[tappedQuestion].option02, status: $option02 )
                        
                        OptionView(option: chapter.testIs!.testDetsails[tappedQuestion].option03,status: $option03   )
                        
                        OptionView(option: chapter.testIs!.testDetsails[tappedQuestion].option04, status: $option04  )
                    }
                    .padding(.top, 30)
                    .padding(.horizontal)
                    
                    HStack{
                        Text( chapter.testIs!.testDetsails[tappedQuestion].correctAnswer == chapter.testIs!.testDetsails[tappedQuestion].answer ? "Correct Answer" : chapter.testIs!.testDetsails[tappedQuestion].questionAttempted ? "Wrong Answer" : "Answer to not attempted question.")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor( chapter.testIs!.testDetsails[tappedQuestion].correctAnswer == chapter.testIs!.testDetsails[tappedQuestion].answer ? .green : .red)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    Spacer()
                }
                .fontDesign(.rounded)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.55)
                .background(.white)
                .cornerRadius(20)
                .offset(y: showDetails ? 35 : UIScreen.screenHeight * 0.55)
            }
            
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(chapter: HelperClass.shared.homeChoiceYourCourseCollectionViewdata[0].chaptersList[2], collectionIndex: 0, tappedIndex: 2)
    }
}


struct OptionView: View{
    let option: String
    @Binding var status: Int
    
    var body: some View{
        HStack(alignment: .center, spacing: 0){
            
            if status == 1 {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .padding(.leading, 20)
            }else if status == 2 {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .padding(.leading, 20)
            }else{
                Circle()
                    .fill(.gray.opacity(0.1))
                    .frame(width: 20, height: 20)
                    .background(
                        Circle()
                            .stroke(.gray.opacity(0.4), lineWidth: 0.8)
                    )
                    .padding(.leading, 20)
            }

            Text(option)
                .font(.system(size: 14))
                .fontWeight(.regular)
                .foregroundColor( status == 1 || status == 2 ? .white : .black)
                .padding(.leading)
            Spacer()
        }
        .padding(.vertical, 15)
        .background{
            if status == 1 {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.green)
            }else if status == 2{
                RoundedRectangle(cornerRadius: 5)
                    .fill(.red)
            }else{
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.1), lineWidth: 1)
            }
        }
    }
}
