//
//  TestView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 20/07/23.
//

import SwiftUI

struct TestView: View {
    
    @ObservedObject var helper = HelperClass.shared
    @ObservedObject var testHelper = TestResultCalculator.shared
    var test: ModuleTest
    var tappedIndex: Int
    var collectionIndex: Int
    
    @Binding var testCompleted: Bool
    @Binding var toggleIt: Bool
    @Binding var showNext: Bool
    
    @State var option01 = false
    @State var option02 = false
    @State var option03 = false
    @State var option04 = false
    
    
    @State private var isTimerRunning = true
    @State var remainingTime = 5 // 10 minutes in seconds
    @State var timeOver = false
    @State private var showAlert = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var totleNumberOfQuestion = 0
    @State var currentQuestion = 0
    
    @Environment(\.presentationMode) var presentaionMode
    
    func timeString(_ time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        isTimerRunning = true
//        timer.upstream.connect()
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    
    private func pauseTimer() {
        isTimerRunning = false
        timer.upstream.connect().cancel()
    }
    
    func answerAlreadThere(){
        if helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption == "01"{
            option01 = true
            option02 = false
            option03 = false
            option04 = false
        }else if helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption == "02"{
            option02 = true
            option01 = false
            option03 = false
            option04 = false
        }
        else if helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption == "03"{
            option03 = true
            option02 = false
            option01 = false
            option04 = false
        }else if helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption == "04"{
            option04 = true
            option02 = false
            option03 = false
            option01 = false
        }else{
            option01 = false
            option02 = false
            option03 = false
            option04 = false
        }
    }
    
    var body: some View {
        VStack(alignment: .center){
            HStack{
                VStack(alignment: .leading,spacing: 25){
                    Image(systemName: "xmark")
                        .font(.title3)
                        .onTapGesture{
                            pauseTimer()
                            showAlert = true
                        }
                    Text(test.module)
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .padding(.top, 10)
            
            HStack(alignment: .center, spacing: 0){
                Spacer()
                Image(systemName: "clock")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.gray.opacity(0.6))
                    .padding(.trailing, 2)
                Text("\(timeString(remainingTime)) mins remaining")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.blue.opacity(0.7))
            }
            .padding(.top, 25)
            
            HStack(alignment: .center, spacing: 0){
                Text("Question \(test.testDetsails[currentQuestion].questionNum) of \(totleNumberOfQuestion)")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.top, 25)
            
            
            HStack(alignment: .center,spacing: 0){
                Text(test.testDetsails[currentQuestion].question)
                    .font(.body)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .lineSpacing(5)
                Spacer()
            }
            .padding(.top, 25)
            
            
            VStack(alignment: .center, spacing: 0){
                
                OptionListView(option: test.testDetsails[currentQuestion].option01, optiontapped: $option01)
                    .padding(.top, 25)
                    .padding(.bottom)
                    .onTapGesture{
                        if option01{
                            option01 = false
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].answer = nil
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].questionAttempted = false
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption = ""
                        }else{
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].answer = test.testDetsails[currentQuestion].option01
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].questionAttempted = true
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption = "01"
                            option01 = true
                            option02 = false
                            option03 = false
                            option04 = false
                        }
                    }
                OptionListView(option: test.testDetsails[currentQuestion].option02, optiontapped: $option02)
                    .padding(.bottom)
                    .onTapGesture{
                        if option02{
                            option02 = false
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].answer = nil
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].questionAttempted = false
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption = ""
                        }else{
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].answer = test.testDetsails[currentQuestion].option02
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].questionAttempted = true
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption = "02"
                            option02 = true
                            option01 = false
                            option03 = false
                            option04 = false
                        }
                    }
                OptionListView(option: test.testDetsails[currentQuestion].option03, optiontapped: $option03)
                    .padding(.bottom)
                    .onTapGesture{
                        if option03{
                            option03 = false
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].answer = nil
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].questionAttempted = false
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption = ""
                        }else{
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].answer = test.testDetsails[currentQuestion].option03
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].questionAttempted = true
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption = "03"
                            option03 = true
                            option02 = false
                            option01 = false
                            option04 = false
                        }
                    }
                OptionListView(option: test.testDetsails[currentQuestion].option04, optiontapped: $option04)
                    .onTapGesture{
                        if option04{
                            option04 = false
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].answer = nil
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].questionAttempted = false
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption = ""
                        }else{
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].answer = test.testDetsails[currentQuestion].option04
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].questionAttempted = true
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testDetsails[currentQuestion].tappedoption = "04"
                            option04 = true
                            option02 = false
                            option03 = false
                            option01 = false
                        }
                    }
                
            }
            
            Spacer()
            
            ZStack{
                Color.blue.opacity(0.7)
                HStack(alignment: .center){
                    VStack(alignment: .leading, spacing: 5){
                        Text("Chapter 3")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        Text("Settingup new project")
                            .font(.footnote)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    Button{
                        if currentQuestion > 0{
                            withAnimation(.easeOut){
                                currentQuestion -= 1
                                answerAlreadThere()
                            }
                        }
                    }label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.trailing)
                    }
                    
                    Button{
                        if currentQuestion < totleNumberOfQuestion - 1 {
                            withAnimation(.easeOut){
                                currentQuestion += 1
                                answerAlreadThere()
                            }
                        }
                    }label: {
                        if currentQuestion == totleNumberOfQuestion - 1{
                            Button{
                                pauseTimer()
                                showAlert = true
                            }label: {
                                Text("Submit")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                    .frame(width: 78, height: 36)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color("ColorOrenge"))
                                    )
                            }
                        }else{
                            Image(systemName: "arrow.right")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.trailing)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(height: 90)
            .padding(.horizontal, -15)
            .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.bottom)
        .fontDesign(.rounded)
        .padding(.horizontal, 15)
        .onAppear{
            totleNumberOfQuestion = test.testDetsails.count
            debugPrint(test)
        }
        .onReceive(timer) { _ in
            if isTimerRunning && remainingTime > 0 {
                remainingTime -= 1
                if remainingTime == 0 {
                    timeOver = true
                }
            }
        }
        .alert(isPresented: $timeOver){
            Alert(title: Text("Ooops...!"),message: Text("Time Out."),dismissButton: .default(Text("wokay")))
        }
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Do you want to end the test?"),
                message: Text("""
You still have \(timeString(remainingTime)) second remaining
                              
If you want to check your answer again, press cancel button. If you want to end the test and submit your answers you can press submit button.
"""),
                primaryButton: .cancel(Text("Cancel")) {
                    // When "Cancel" button is tapped
                    showAlert = false
                    startTimer()
                },
                secondaryButton: .default(Text("Submit")) {
                    // When "Submit" button is tapped
                    
                    testHelper.test = test
                    testHelper.indextapped = tappedIndex
                    testHelper.collectionIndex = collectionIndex
                    testHelper.calculateTotalPercentage(){ status in
                        if status {
                            showAlert = false
                            toggleIt.toggle()
                            showNext = true
                            testCompleted = true
                            presentaionMode.wrappedValue.dismiss()
                        }else{
                            showAlert = false
                        }
                    }
                }
            )
        })
    }
}


struct TestView_Previews: PreviewProvider {
    @State static var testCompleted = false
    @State static var togg = false
    @State static var showNext = false
    
    @ObservedObject static var helper = HelperClass.shared
    
    static var previews: some View {
        TestView(test: helper.homeChoiceYourCourseCollectionViewdata[0].chaptersList[2].testIs ?? ModuleTest(id: UUID(), image: "", module: "", chapter: "", subTitle: "", title: "", duration: "", testCompleted: false, startTest: false, testDetsails: [], testResult: TestResult(id: UUID(), passgrad: "", correctAnswer: "", wrongAnswer: "")), tappedIndex: 2, collectionIndex: 0, testCompleted: $testCompleted, toggleIt: $togg,showNext: $showNext)
    }
}


struct OptionListView: View{
    let option: String
    @Binding var optiontapped: Bool
    var body: some View{
        HStack(alignment: .center, spacing: 0){
            if optiontapped{
                Image(systemName: "checkmark.circle.fill")
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
                .foregroundColor( optiontapped ? .white : .black)
                .padding(.leading)
            
            
            Spacer()
        }
        .padding(.vertical, 15)
        .background{
            if optiontapped{
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color("ColorOrenge"))
            }else{
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.1), lineWidth: 1)
            }
        }
    }
}
