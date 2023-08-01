//
//  CourseDetailsView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 13/07/23.
//


import SwiftUI

struct CourseDetailsView: View {
    @ObservedObject var helper = HelperClass.shared
    
    let collectionViewIndex: Int
    var itemDetal: HomeChoiceYourCourseCollectionViewdata
    
    @State var overviewTapped = true
    @State var chaptersTapped = false
    @State var joinTheCourse = false
    @State var showCourseReport = false
    @State var indexTapped = 11
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 0){
                //MARK: - Top image overlay view
                TopImageOverlayView(courseJoined: $joinTheCourse, tappedIndex: $indexTapped, collectionindex: collectionViewIndex, itemDetal: itemDetal)
                //MARK: - Over view and chapters butoons
                HStack(alignment: .center, spacing:0){
                    Text("Overview")
                        .padding(.horizontal, 45)
                        .foregroundColor(overviewTapped ? Color("ColorOrenge") : .gray.opacity(0.6))
                        .background(
                        Rectangle()
                            .fill(overviewTapped ? Color("ColorOrenge") : .gray.opacity(0.6))
                            .frame(height: 1)
                            .offset(y: 20)
                        )
                        .onTapGesture {
                            withAnimation(.easeOut){
                                overviewTapped = true
                            }
                            withAnimation(.easeIn){
                                chaptersTapped = false
                            }
                        }
                    Text("Chapters")
                        .padding(.horizontal, 45)
                        .foregroundColor(chaptersTapped ? Color("ColorOrenge") : .gray.opacity(0.6))
                        .background(
                        Rectangle()
                            .fill(chaptersTapped ? Color("ColorOrenge") : .gray.opacity(0.6))
                            .frame(height: 1)
                            .offset(y: 20)
                        )
                        .onTapGesture {
                            withAnimation(.easeOut){
                                chaptersTapped = true
                            }
                            withAnimation(.easeIn){
                                overviewTapped = false
                            }
                        }
                }
                .font(.title3)
                .fontWeight(.medium)
                .fontDesign(.rounded)
                .foregroundColor(.gray)
                .padding(.top, 35)
                
                //MARK: - Nav bar hidden
                .navigationBarHidden(true)
                
                //MARK: - Overview details
                if overviewTapped{
                    VStack(alignment: .leading, spacing: 0){
                        OverViewTopView()
                        CourseInclude()
                        YouWillLearn()
                        RequirmentView()
                        BottomView()
                    }
                    .fontDesign(.rounded)
                    .padding(.top, 40)
                    .padding(.bottom, joinTheCourse ? 35 : 0)
                    .padding(.horizontal, 23)
                    if !joinTheCourse{
                        Button{
                            joinTheCourse = true
                            overviewTapped = false
                            chaptersTapped = true
                        }label: {
                            Text("Join Course")
                                .fontWeight(.medium)
                                .fontDesign(.rounded)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.screenWidth,height: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                    .fill(Color("ColorOrenge"))
                                )
                                .padding(.top, 20)
                        }
                    }
                }
                else{
                    //MARK: - Chapters view
                    VStack {
                        VStack{
                            VStack(alignment: .leading, spacing:0){
                                //MARK: - Top content
                                HStack{
                                    VStack(alignment: .leading, spacing: 5){
                                        Text("Course Content")
                                            .fontWeight(.medium)
                                        Text("7 Chapter | 46 lessons | 6 Assignment Test | 3.5h total length")
                                            .font(.system(size: 12))
                                    }
                                    Spacer()
                                }
                                
                                VStack(alignment: .center, spacing: 0){
                                    ForEach(0..<itemDetal.chaptersList.count){ count in
                                        ChapterListView(chapIndex: itemDetal.courseCountNum, collectionIndex: collectionViewIndex, chapterLists: helper.homeChoiceYourCourseCollectionViewdata[collectionViewIndex].chaptersList[count], tappedIndex: $indexTapped, yourIndex: count, hasJoinTheCourse: $joinTheCourse, completeAleart: $showCourseReport)
                                            .onTapGesture{
                                                if joinTheCourse{
                                                    helper.homeChoiceYourCourseCollectionViewdata[collectionViewIndex].tappedIndex = count
                                                }
                                                if indexTapped == count{withAnimation(.easeIn){indexTapped = 11}}
                                                else{withAnimation(.easeOut){indexTapped = count}}
                                            }
                                    }
                                }
                                .padding(.top, 22)
                                .padding(.bottom, joinTheCourse ? 35 : 0)
                            }
                            .fontDesign(.rounded)
                            .padding(.top, 40)
                            .padding(.bottom, joinTheCourse ? 0 : 99)
                            .padding(.horizontal, 28)
                            
                            
                            if !joinTheCourse{
                                Button{
                                    joinTheCourse = true
                                    overviewTapped = false
                                    chaptersTapped = true
                                }label: {
                                    Text("Join Course")
                                        .fontWeight(.medium)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.white)
                                        .frame(width: UIScreen.screenWidth,height: 60)
                                        .background(
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(Color("ColorOrenge"))
                                        )
                                }
                            }
                            //MARK: - Test teport
                            if showCourseReport{
                                ZStack{
                                    Color.accentColor
                                    VStack(alignment: .center, spacing: 0){
                                        HStack(alignment: .center, spacing: 0){
                                            VStack(alignment: .leading, spacing: 0){
                                                Text("Course Result")
                                                    .font(.title2)
                                                    .fontWeight(.medium)
                                                    .foregroundColor(.white)
                                                    .padding(.top, 45)
                                                
                                                Text("\(itemDetal.chaptersList.last?.combinedPercentage ?? 00)%")
                                                    .font(.system(size: 74))
                                                    .fontWeight(.medium)
                                                    .foregroundColor(.green)
                                                
                                                Text("approval rate")
                                                    .font(.title3)
                                                    .fontWeight(.regular)
                                                    .foregroundColor(.white)
                                                    .padding(.top, -10)
                                            }
                                            Spacer()
                                        }
                                        
                                        ZStack{
                                            Color.white
                                            HStack(alignment: .center, spacing: 0){
                                                ResultSegmentView(text01: "Joined", text02: "20/10/2000")
                                                
                                                Rectangle()
                                                    .fill(.gray.opacity(0.6))
                                                    .frame(width: 1, height: 34)
                                                    .padding(.horizontal, 10)
                                                
                                                ResultSegmentView(text01: "Completed", text02: "20/10/2000")
                                                
                                                Rectangle()
                                                    .fill(.gray.opacity(0.6))
                                                    .frame(width: 1, height: 34)
                                                    .padding(.horizontal, 10)
                                                
                                                ResultSegmentView(text01: "   Duration    ", text02: "4h 30m")
                                            }
                                        }
                                        .cornerRadius(8)
                                        .padding(.top, 20)
                                        
                                        HStack{
                                            Text("Course Certificate")
                                                .font(.title2)
                                                .fontWeight(.medium)
                                            Spacer()
                                            Image(systemName: "arrow.down.to.line.compact")
                                                .font(.title)
                                        }
                                        .padding(.top, 35)
                                        .foregroundColor(.white)
                                        
                                        Image("Certificate")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 240)
                                            .padding(.vertical, 20)
                                        
                                    }
                                    .fontDesign(.rounded)
                                    .padding(.horizontal, 28)
                                }
                                .padding(.top, 50)
                            }
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct CourseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsView(collectionViewIndex: 3, itemDetal: HelperClass.shared.homeChoiceYourCourseCollectionViewdata[3])
    }
}

struct TopImageOverlayView: View{
    @Binding var courseJoined: Bool
    @Binding var tappedIndex: Int
    @State var collectionindex: Int
    var itemDetal: HomeChoiceYourCourseCollectionViewdata
    @ObservedObject var helper = HelperClass.shared
    @Environment(\.presentationMode) var present
    
    var body: some View{
        VStack(alignment: .center, spacing: 0) {
            Image("img_designcoursedetail1_bg")
                .resizable()
                .scaledToFill()
                .overlay(
                    HStack(alignment: .center, spacing: 0){
                        VStack(alignment: .leading, spacing: 0){
                            Image(systemName: "xmark")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .offset(y: -45)
                                .onTapGesture {
                                    if !helper.homeChoiceYourCourseCollectionViewdata[collectionindex].courseCompleted && courseJoined && !helper.ongoingCounter.contains(itemDetal.courseCountNum){
                                        
                                        helper.ongoingCounter = helper.ongoingCounter.filter{ $0 != itemDetal.courseCountNum}
                                        helper.ongoingCourse = helper.ongoingCourse.filter{$0.courseCountNum != itemDetal.courseCountNum}
                                        helper.ongoingCourse.append(helper.homeChoiceYourCourseCollectionViewdata[collectionindex])
                                        helper.ongoingCounter.append(itemDetal.courseCountNum)
                                        
                                    }else if helper.homeChoiceYourCourseCollectionViewdata[collectionindex].courseCompleted && helper.ongoingCounter.contains(itemDetal.courseCountNum){
                                        
                                        print("on on on ongoing before: \(helper.ongoingCourse.count)")
                                        print("on on on completed before: \(helper.completedCourseArray.count)")
                                        helper.ongoingCounter = helper.ongoingCounter.filter{ $0 != itemDetal.courseCountNum}
                                        helper.ongoingCourse = helper.ongoingCourse.filter{$0.courseCountNum != itemDetal.courseCountNum}
                                        helper.completedCourseArray.append(helper.homeChoiceYourCourseCollectionViewdata[collectionindex])
                                        
                                        print("on on on ongoing after: \(helper.ongoingCourse.count)")
                                        print("on on on complete after: \(helper.completedCourseArray.count)")
                                        
                                    }else if !helper.homeChoiceYourCourseCollectionViewdata[collectionindex].courseCompleted && helper.ongoingCounter.contains(itemDetal.courseCountNum){
                                        
                                        helper.ongoingCounter = helper.ongoingCounter.filter{ $0 != itemDetal.courseCountNum}
                                        helper.ongoingCourse = helper.ongoingCourse.filter{$0.courseCountNum != itemDetal.courseCountNum}
                                        helper.ongoingCourse.append(helper.homeChoiceYourCourseCollectionViewdata[collectionindex])
                                    }else if helper.homeChoiceYourCourseCollectionViewdata[collectionindex].courseCompleted && helper.ongoingCounter.isEmpty{
                                        helper.completedCourseArray.append(helper.homeChoiceYourCourseCollectionViewdata[collectionindex])
                                    }
                                    print("####### ongoing count: \(helper.ongoingCourse.count)")
                                    present.wrappedValue.dismiss()
                                }
                            Text(itemDetal.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .padding(.bottom, 12)
                            HStack(alignment: .center, spacing: 15){
                                Text(itemDetal.type)
                                    .font(.system(size: 12))
                                    .fontWeight(.light)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 8)
                                    .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.yellow)
                                    )
                                Text(itemDetal.chapterDetails)
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                            }
                        }
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        Spacer()
                    }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 10),
                    alignment: .bottomLeading
                )
        }
        .frame(width: UIScreen.screenWidth, height: 230)
    }
}

struct OverViewTopView: View{
    
    @State private var showFullText = false
    @State var showNext = false
    @State var toggleitt = false
    var displayedText: String {
        if showFullText {
            return originalText
        } else {
            let truncatedText = originalText.prefix(400)
            return String(truncatedText)
        }
    }
    var body: some View{
        VStack(alignment: .leading, spacing: 0){
            Text("Learn how to design a beautiful and engaging mobile app with Figma. Learn-by-doing approach.")
                .font(.footnote)
                .fontWeight(.medium)
                
                .foregroundColor(.blue.opacity(0.8))
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            Text("Preview this course")
                .font(.body)
                .fontWeight(.medium)
                .padding(.top, 30)
            Image("img_preview1_bg")
                .resizable()
                .scaledToFit()
                .overlay(
                    NavigationLink(destination: VideoPlayerView(chapNum: 0, videoFileName: "lion", videoFileType: "mp4", viewTitle: "Course Introduction", toggleIt: $toggleitt, showNext: $showNext)){
                        HStack(alignment: .center, spacing: 0){
                            Image("icn_play_orange")
                            VStack(alignment: .leading){
                                Text("Introduction")
                                  Text("3min")
                                    .font(.footnote)
                            }
                            .foregroundColor(.white)
                            .padding(.leading)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                            .padding(.horizontal)
                    },
                    alignment: .center
                
                )
                .padding(.top, 20)
                
                Text(displayedText)
                .font(.footnote)
                .padding(.top, 20)
                .overlay(
                    Text(showFullText ? "Show Less".uppercased() : "Show More".uppercased())
                        .foregroundColor(Color("ColorOrenge"))
                        .font(.footnote)
                    .padding(.trailing, 5)
                    .onTapGesture {
                        showFullText.toggle()
                    },
                alignment: .bottomTrailing
                )
        }
    }
}

struct CourseInclude: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 5) {
            Text("Course Includes")
                .fontWeight(.medium)
            .padding(.top, 20)
            CouresIncludesView(image: "clock.fill", txt: "3.5 total hours video")
                .padding(.top, 5)
            CouresIncludesView(image: "doc.fill", txt: "Support Files")
            CouresIncludesView(image: "chart.bar.doc.horizontal.fill", txt: "6 Module Test")
            CouresIncludesView(image: "lock.fill", txt: "Full lifetime access")
            CouresIncludesView(image: "globe", txt: "Access on mobile, desktop and tv")
            CouresIncludesView(image: "doc.text.image.fill", txt: "Certificate of Completion")
        }
    }
}

struct YouWillLearn: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("What you'll learn")
                .fontWeight(.medium)
            WhatYouWillLearnView(image: "Circle", txt: "Design Websites")
                .padding(.top, 5)
            WhatYouWillLearnView(image: "Circle", txt: "Design mobile and desktop apps")
            WhatYouWillLearnView(image: "Circle", txt: "You will have a fully interactive design and prototype at the end of this course")
            WhatYouWillLearnView(image: "Circle", txt: "You will learn how to reuse design elements for future projects")
        }
        .padding(.top, 20)
    }
}

struct CouresIncludesView: View{
    let image: String
    let txt: String
    var body: some View{
        HStack(alignment: .center, spacing: 10){
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
                .padding(3)
                .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.blue.opacity(0.8))
                )
            Text(txt)
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct WhatYouWillLearnView: View{
    let image: String
    let txt: String
    var body: some View{
        HStack(alignment: .top, spacing: 10){
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
            Text(txt)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
    }
}

struct RequirmentView: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("Requirments")
                .fontWeight(.medium)
            HStack(alignment: .center, spacing: 10){
                Circle()
                    .frame(width: 3,height: 3)
                Text("Interner access")
                    .font(.footnote)
            }
            HStack(alignment: .center, spacing: 10){
                Circle()
                    .frame(width: 3,height: 3)
                Text("You should know your way around computer basics")
                    .font(.footnote)
            }
            
        }
        .padding(.top, 20)
    }
}

struct BottomView: View{
    @State private var showFullText = false
    var displayedText: String {
        if showFullText {
            return originalText2
        } else {
            let truncatedText = originalText2.prefix(400)
            return String(truncatedText)
        }
    }
    var body: some View{
        VStack(alignment: .leading, spacing: 0){
            Text("Instructor")
                .fontWeight(.medium)
            HStack(alignment: .center, spacing: 10){
                Image("img_instructor1")
                VStack(alignment: .leading, spacing: 5){
                    Text("Harsh M R")
                        .font(.footnote)
                        .padding(.top, 7)
                    Text("User Interface teacher www.appledesigntips.com")
                        .font(.system(size: 10))
                    Spacer()
                }
            }
            .padding(.top, 20)
            Text(displayedText)
                .font(.footnote)
                .padding(.top, 10)
                .overlay(
                    Text(showFullText ? "Show Less".uppercased() : "Show More".uppercased())
                        .foregroundColor(Color("ColorOrenge"))
                        .font(.footnote)
                    .padding(.trailing, 120)
                    .onTapGesture {
                        showFullText.toggle()
                    },
                alignment: .bottomTrailing
                )
        }
        .padding(.top, 40)
    }
}

struct ChapterListView: View{
    
    @ObservedObject var helper = HelperClass.shared
    
    let chapIndex: Int
    let collectionIndex: Int
    let chapterLists: ChaptersList
    
    @Binding var tappedIndex: Int
    @State var yourIndex: Int
    @State var showNext = false
    @State var togg = false
    @Binding var hasJoinTheCourse : Bool
    @State var showAleart = false
    @Binding var completeAleart: Bool
    @State var currentVideoNum = 0
    @State var greenTitle = false
    @State var allToTest = false
    @State var testCompleted = false
    
    @State var showResultScreen = false
    
    func tappedNum(number: String) -> String {
        switch number{
        case "01":
            return videosList[0]
        case "02":
            return videosList[1]
        case "03":
            return videosList[2]
        case "04":
            return videosList[3]
        case "05":
            return videosList[4]
        case "06":
            return videosList[5]
        case "07":
            return videosList[6]
        case "08":
            return videosList[7]
        case "09":
            return videosList[8]
        case "10":
            return videosList[9]
        default:
            return ""
        }
    }
    
    var body: some View{
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center){
                Text(chapterLists.chapterName)
                    .foregroundColor( chapterLists.chapCompleted ? .green : .black)
                Spacer()
                Text( tappedIndex == yourIndex ? "-" : "+")
                    .font(.title3)
                    .foregroundColor(Color("ColorOrenge"))
            }
            .font(.footnote)
            .padding(.vertical,8)
            
            
            NavigationLink(destination: ResultView(chapter: helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[yourIndex], collectionIndex: collectionIndex, tappedIndex: tappedIndex), isActive: $showResultScreen){
                EmptyView()
            }
            
            ForEach(chapterLists.chapterContent, id: \.id){ contents in
                if tappedIndex == yourIndex {
                    if contents.start && hasJoinTheCourse {
                        NavigationLink(destination: VideoPlayerView(chapNum: chapIndex, videoFileName: tappedNum(number: contents.number), videoFileType: "mp4", viewTitle: contents.title, toggleIt: $togg, showNext: $showNext)){
                            ChapterContentView(coursejoined: $hasJoinTheCourse,testCompleted: $testCompleted,chapterContent: contents,testContent: nil)
                                .padding(.bottom, 10)
                        }
                    }else{
                        ChapterContentView(coursejoined: $hasJoinTheCourse,testCompleted: $testCompleted,chapterContent: contents,testContent: nil)
                            .padding(.bottom, 10)
                            .onTapGesture{
                                showAleart = true
                            }
                    }
                }
            }
            
            if chapterLists.testIs != nil && tappedIndex == yourIndex{
                if allToTest{
                    if helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs!.testCompleted{
                        ChapterContentView(coursejoined: $hasJoinTheCourse, testCompleted: $testCompleted,testIsThere: true, chapterContent: nil, testContent: chapterLists.testIs)
                    }else{
                        NavigationLink(destination: TestView(test: helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs!,tappedIndex: tappedIndex, collectionIndex: collectionIndex, testCompleted: $testCompleted, toggleIt: $togg,showNext: $showNext)){
                            ChapterContentView(coursejoined: $hasJoinTheCourse, testCompleted: $testCompleted,testIsThere: true, chapterContent: nil, testContent: chapterLists.testIs)
                        }
                    }
                }else{
                    ChapterContentView(coursejoined: $hasJoinTheCourse, testCompleted: $testCompleted,testIsThere: true, chapterContent: nil, testContent: chapterLists.testIs)
                }
            }
        }
        .onChange(of: togg){ val in
            if showNext{
                print("trueeee")
                let count = helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapterContent.count - 1
                if currentVideoNum == count {
                    if helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList.count - 1 == tappedIndex {
                        if helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs != nil{
                            allToTest = true
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.startTest = true
                            if testCompleted{
                                helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testCompleted = true
                                helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].courseCompleted = true
                                greenTitle = true
                                helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapCompleted = true
                                currentVideoNum = 0
                                print("Conjajulation brother ab ba ba ba party.....!")
                                completeAleart = true
                            }else{
                                helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapterContent[currentVideoNum].completed = true
                            }
                        }else{
                            greenTitle = true
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapCompleted = true
                            currentVideoNum = 0
                            print("Conjajulation brother ab ba ba ba party.....!")
                            completeAleart = true
                        }
                        
                    }else{
                        if helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs != nil{
                            allToTest = true
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.startTest = true

                            if testCompleted{
                                helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].testIs?.testCompleted = true
                                greenTitle = true
                                helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapCompleted = true
                                helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapterContent[currentVideoNum].completed = true
                                currentVideoNum = 0
                                helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex + 1].chapterContent[currentVideoNum].start = true
                                
                            }else{
                                helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapterContent[currentVideoNum].completed = true
                            }
                        }else{
                            greenTitle = true
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapCompleted = true
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapterContent[currentVideoNum].completed = true
                            currentVideoNum = 0
                            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex + 1].chapterContent[currentVideoNum].start = true
                        }
                    }
                }else{
                    if currentVideoNum < count{
                        helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapterContent[currentVideoNum + 1].start = true
                        helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[tappedIndex].chapterContent[currentVideoNum].completed = true
                        currentVideoNum += 1
                    }
                }
            }else{
                print("falsssssss")
            }
                        
        }
        .alert(isPresented: $showAleart,content: {
            Alert(title: Text("Reminder..!"),message: hasJoinTheCourse ? Text("To access this lesson please complete the ongoing lecture.") : Text("Please join the course to access the contents."),dismissButton: .default(Text("Wokey")))
        })
        .sheet(isPresented: $testCompleted){
            TestCompletedView(showResultsScreen: $showResultScreen, chapter: helper.homeChoiceYourCourseCollectionViewdata[collectionIndex].chaptersList[yourIndex])
        }
//        .onChange(of: testCompleted){ val in
//            print("test com: \(testCompleted)")
//        }
//        .alert(isPresented: $completeAleart,content: {
//            Alert(title: Text("Reminder..!"),message: Text("Congradulations you have successfully completed the course 🤘."),dismissButton: .default(Text("Wokey")))
//        })

    }
}

struct ChapterContentView: View{
    @Binding var coursejoined: Bool
    @Binding var testCompleted: Bool
//    @State var allowToTest = false
    @State var testIsThere =  false
    let chapterContent: ChapterContent?
    let testContent: ModuleTest?
    var body: some View{
        HStack(alignment: .center, spacing: 10) {
            if coursejoined{
                if chapterContent?.start ?? false {
                    if chapterContent?.completed ?? true{
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.green)
                    }else{
                        Circle()
                            .fill(.white)
                            .frame(width: 5, height: 5)
                            .background(
                            Circle()
                                .fill(.green)
                                .frame(width: 22, height: 22)
                            )
                            .padding(4)
                    }
                    
                }else if testContent?.startTest ?? false {
                        if testContent?.testCompleted ?? false{
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22)
                                .foregroundColor(.green)
                        }else{
                            Circle()
                                .fill(.white)
                                .frame(width: 5, height: 5)
                                .background(
                                Circle()
                                    .fill(.green)
                                    .frame(width: 22, height: 22)
                                )
                                .padding(4)
                        }
                }else{
                    Circle()
                        .fill(.white)
                        .frame(width: 5, height: 5)
                        .background(
                        Circle()
                            .fill(.gray.opacity(0.5))
                            .frame(width: 22, height: 22)
                        )
                        .padding(4)
                }
            }
            HStack(alignment: .center, spacing: 0){
                HStack(alignment: .top, spacing: 15){
                    if testIsThere{
                        Image(testContent?.image ?? "")
                    }else{
                        Text(chapterContent?.number ?? "No")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black.opacity( chapterContent?.completed ?? true ? 0.9 : 0.5))
                    }
                    VStack(alignment: .leading, spacing: 8){
                        if testIsThere{
                            Text(testContent?.title ?? "No")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor( testContent?.startTest ?? true ? Color(cgColor: CGColor(red: 0, green: 0, blue: 0.4, alpha: 1)) : .black.opacity(0.6))
                        }else{
                            Text(chapterContent?.title ?? "No")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor( chapterContent?.start ?? true ? Color(cgColor: CGColor(red: 0, green: 0, blue: 0.4, alpha: 1)) : .black.opacity(0.6))
                        }
                        
                        Text( testIsThere ? testContent?.duration ?? "00" : chapterContent?.duration ?? "000")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                }
                .fontDesign(.rounded)
                Spacer()
                if !testIsThere{
                    Image(systemName: "play.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(chapterContent?.start ?? true ? Color("ColorOrenge") : .black.opacity(0.8))
                        .background(
                        Circle()
                            .fill( chapterContent?.start ?? true ? Color("ColorOrenge").opacity(0.1) : .black.opacity(0.1))
                        )
                }else{
                    if testContent!.testCompleted{
                        HStack(alignment: .top, spacing: 0) {
                            VStack(alignment: .trailing,spacing: 0){
                                Text("\(testContent!.testResult.passgrad)")
                                    .font(.system(size: 38))
                                    .foregroundColor(Int(testContent!.testResult.passgrad) ?? 0 > Int("35") ?? 0 ? .green : .red )
                                Text(Int(testContent!.testResult.passgrad) ?? 0 > Int("35") ?? 0 ? "Approval Rate" : "Not Approved")
                                    .font(.system(size: 8))
                                    .padding(.top, -5)
                            }
                            Text("%")
                                .font(.system(size: 10))
                                .foregroundColor(Int(testContent!.testResult.passgrad) ?? 0 > Int("35") ?? 0 ? .green : .red )
                                .padding(.top, 8)
                                .padding(.leading, 0)
                        }
                    }
                }
                
            }
            .foregroundColor(.gray)
            .padding(.horizontal)
            .padding(.vertical)
            .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(Color("ChapterContent"))
        )
        }
    }
}

struct ResultSegmentView: View{
    let text01: String
    let text02: String
    
    var body: some View{
        VStack(alignment: .center, spacing: 8){
            Text(text01)
                .font(.footnote)
                .fontWeight(.light)
                
            Text(text02)
                .font(.system(size: 17))
                .fontWeight(.medium)
                .foregroundColor(Color.blue.opacity(0.8))
        }
        .padding(.vertical)
    }
}
