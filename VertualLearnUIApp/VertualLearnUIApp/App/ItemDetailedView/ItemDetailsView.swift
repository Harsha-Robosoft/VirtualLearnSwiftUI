//
//  ItemDetailsView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 17/07/23.
//

import SwiftUI

struct ItemDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var goToHome = false
    @Binding var goHome: Bool
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 0){
                HStack(alignment: .center,spacing: 0){
                    Image(systemName: "arrow.left")
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    NavigationLink(destination: SearchView(gotoHome: $goToHome)){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    }
                }
                .font(.title2)
                .padding(.top)
                .padding(.trailing)
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Design")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 15)
                    
                    Text("Courses to get you started")
                        .fontWeight(.medium)
                        .padding(.top, 10)
                    CourseToGetYouStartedView()
                        .padding(.top, -15)
                    
                    Text("Featured courses")
                        .fontWeight(.medium)
                        .padding(.top, 10)
                    FeaturedCourseView()
                        .padding(.top, -15)
                    
                    Text("Subcategories")
                        .fontWeight(.semibold)
                        .padding(.top, 15)
                    
                    SubcategoriesView()
                        .padding(.top, -15)
                    
                    Text("All course")
                        .fontWeight(.medium)
                        .padding(.top, 10)
                    
                    ForEach(allCource, id: \.id){ item in
                        SearchResultView(search: item)
                    }
                }
                .navigationBarHidden(true)
            }
            .onAppear{
                if goToHome{
                    goHome = true
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .fontDesign(.rounded)
        .padding(.leading)
        }
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    @State static var home = false
    static var previews: some View {
        ItemDetailsView(goHome: $home)
    }
}


struct CourseToGetYouStartedView: View{
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 25){
                ForEach(coursetoStart, id: \.id){ item in
                VStack(alignment: .leading, spacing: 0){
                        Image(item.image)
                        .overlay(
                            Image("icn_play-play-button2")
                        )
                        Text(item.headLine)
                            .font(.system(size: 15))
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding(.top, -14)
                            .padding(.leading, 18)
                        HStack(alignment: .center, spacing: 0){
                            Text(item.chapters)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                            Image(systemName: "clock")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                            Text(item.hours)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                                .padding(.leading, 4)
                        }
                        .padding(.top, 4)
                        .padding(.leading, 18)
                    }
                    .frame(width: 288)
                    
                }
                
            }
        }
    }
}

struct FeaturedCourseView: View{
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 25){
                ForEach(featuredCourse, id: \.id){ item in
                VStack(alignment: .leading, spacing: 0){
                        Image(item.image)
                        .overlay(
                            Image("icn_play-play-button2")
                        )
                        Text(item.headLine)
                            .font(.system(size: 15))
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding(.top, -14)
                            .padding(.leading, 18)
                        HStack(alignment: .center, spacing: 0){
                            Text(item.chapters)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                            Image(systemName: "clock")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                            Text(item.hours)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                                .padding(.leading, 4)
                        }
                        .padding(.top, 4)
                        .padding(.leading, 18)
                    }
                    .frame(width: 288)
                }
                
            }
        }
    }
}

struct SubcategoriesView: View{
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<5){ num in
                    HStack(alignment: .center, spacing: 0) {
                        Text(subcategories[num])
                            .font(.system(size: 14))
                            .fontWeight(.light)
                            .fontDesign(.rounded)
                            .padding(.vertical, 6)
                            .padding(.horizontal)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                    )
                }
                Spacer()
            }
            .padding(.top, 1)
            .padding(.leading, 1)
            HStack{
                ForEach(5..<10){ num in
                    HStack(alignment: .center, spacing: 0) {
                        Text(subcategories[num])
                            .font(.system(size: 14))
                            .fontWeight(.light)
                            .fontDesign(.rounded)
                            .padding(.vertical, 6)
                            .padding(.horizontal)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                    )
                }
                Spacer()
            }
            .padding(.bottom, 1)
            .padding(.leading, 1)
        }
    }
}
