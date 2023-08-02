//
//  MyCourseView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 12/07/23.
//

import SwiftUI

struct MyCourseView: View {
    @ObservedObject var helper = HelperClass.shared
    @State var ongoingTap = true
    @State var completedTap = false
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            HeaderView2()
            
            HStack {
                VStack(alignment: .leading, spacing: 0){
                    Text("My Course")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        
                    OngoingCompletedButtonView(ongoingTapped: $ongoingTap)
                }
                Spacer()
            }
            .padding(.top, 20)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: -15){
                    if ongoingTap {
                        withAnimation(.default){
                            ForEach(0..<helper.ongoingCourse.count){ num in
                                CourseCardImageView(ongointTapped: $ongoingTap, item: myCourseOngoing[num], tappedIndex: num)
                            }
                        }
                        
                    }else{
                        withAnimation(.default){
                            ForEach(0..<helper.completedCourseArray.count){ num in
                                CourseCardImageView(ongointTapped: $ongoingTap, item: myCourseCompleted[num], tappedIndex: num)
                            }
                        }
                        
                    }
                }
            }
            .padding(.top, 20)
            
            Spacer()
                .navigationBarHidden(true)
        }
        .padding(.horizontal)
    }
}

struct MyCourseView_Previews: PreviewProvider {
    static var previews: some View {
        MyCourseView()
    }
}


struct HeaderView2: View{
    @State var goHome = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        HStack(alignment: .center,spacing: 0){
            Image(systemName: "arrow.left")
                .font(.title2)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer()
            NavigationLink(destination: SearchView(gotoHome: $goHome)){
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.black)
            }
        }
        .onChange(of: goHome){ newValu in
            if goHome{
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct OngoingCompletedButtonView: View {
    @Binding var ongoingTapped: Bool
    var body: some View {
        HStack(alignment: .center, spacing: 20){
            Text("Ongoing")
                .foregroundColor(ongoingTapped ? .white : .gray)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill( ongoingTapped ? Color(cgColor: CGColor(red: 0, green: 0, blue: 0.5, alpha: 1)) :  Color.white)
                )
                .onTapGesture {
                    withAnimation(.easeOut){
                        ongoingTapped = true
                    }
                }
            Text("Completed")
                .foregroundColor(ongoingTapped ? .gray : .white)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill( ongoingTapped ? Color.white : Color(cgColor: CGColor(red: 0, green: 0, blue: 0.5, alpha: 1)))
                )
                .onTapGesture {
                    print("COmpleted course count: \(HelperClass.shared.completedCourseArray.count)")
                    withAnimation(.easeIn){
                        ongoingTapped = false
                    }

                }
        }
        .font(.footnote)
        .fontWeight(.medium)
        .fontDesign(.rounded)
        .foregroundColor(.gray)
        .padding(.top, 35)
    }
}


struct CourseCardImageView: View{
    @ObservedObject var helper = HelperClass.shared
    @Binding var ongointTapped: Bool
    @State var continueButtonTapped = false
    @State var viewCertificateButtonTapped = false
    let item: MyOngoingCourse
    let tappedIndex: Int
    var body: some View{
        Image(item.image)
            .padding(.trailing)
            .padding(.top, -10)
            .overlay(
                VStack(alignment: .leading, spacing: 0){
                    Text(item.status)
                        .font(.footnote)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                    
                    Text( ongointTapped ? helper.ongoingCourse[tappedIndex].title : helper.completedCourseArray[tappedIndex].title)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    Text(item.chapters_approverate)
                        .font(.footnote)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                    
                    if !helper.ongoingCourse.isEmpty{
                        NavigationLink(destination: CourseDetailsView(collectionViewIndex: helper.ongoingCourse[tappedIndex].courseCountNum, itemDetal: helper.ongoingCourse[tappedIndex],overviewTapped: false, chaptersTapped: true, joinTheCourse: true, indexTapped: helper.ongoingCourse[tappedIndex].tappedIndex), isActive: $continueButtonTapped){
                            EmptyView()
                        }
                    }
                    
                    if !helper.completedCourseArray.isEmpty{
                        NavigationLink(destination: CourseDetailsView(collectionViewIndex: helper.completedCourseArray[tappedIndex].courseCountNum, itemDetal: helper.completedCourseArray[tappedIndex],overviewTapped: false, chaptersTapped: true, joinTheCourse: true,showCourseReport: true), isActive: $viewCertificateButtonTapped){
                            EmptyView()
                        }
                    }
                    
                    
                    
                    Button{
                        if item.buttonTitle.lowercased() == "continue"{
                            print("but num01: \(tappedIndex)")
                            print("tapped title: \(helper.ongoingCourse[tappedIndex].title)")
                            continueButtonTapped = true
                        }else{
                            print("but num02: \(tappedIndex)")
                            viewCertificateButtonTapped = true
                        }
                    }label: {
                        Text(item.buttonTitle)
                            .font(.footnote)
                            .fontDesign(.rounded)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("ColorOrenge"))
                            )
                            .padding(.top, 20)
                    }
                        
                }
                    .padding(.top, 14)
                    .padding(.leading, 40),
                alignment: .topLeading
            )
    }
}
