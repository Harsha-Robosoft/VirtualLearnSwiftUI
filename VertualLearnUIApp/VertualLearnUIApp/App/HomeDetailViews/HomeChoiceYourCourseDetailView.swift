//
//  HomeChoiceYourCourseDetailView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 11/07/23.
//

import SwiftUI

struct HomeChoiceYourCourseDetailView: View {
    @State var searchText = ""
    @State private var showFilter = false
    @State var filteredCategory = ""
    @State var filterDuration = ""
    @State var applybuttonTap = true
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center,spacing: 0){
                    Image(systemName: "arrow.left")
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    
                }
                .font(.title2)
                .padding(.top)
                HStack(alignment: .center, spacing: 0){
                    Text("Choice your course")
                        .font(.title)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                    Spacer()
                }
                .padding(.top)
                
                SearcFieldFiletrView2(searchText: $searchText, showFilter: $showFilter)
                    .padding(.top)
                    .padding(.trailing)
                
                CategoriesView2()
                    .padding(.top, 25)
                
                VStack(alignment: .leading, spacing: 20){
                    Text("All courses")
                        .font(.body)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 0){
                            ForEach(allCource,id: \.id){ search in
                                AllCoursesView(search: search)
                                    .padding(.vertical)
                            }
                        }
                    }
                }
                .padding(.top, 30)
                .padding(.trailing)
                
                Spacer()
            }
            .padding(.leading)
            
            //MARK: - Filter view
            VStack{
                Color.black.opacity( showFilter ? 0.4 : 0)
                    .edgesIgnoringSafeArea(.all)
            }
            .onTapGesture {
                withAnimation(.easeIn){
                    showFilter = false
                }
            }
            SearchFilterView(showFilter: $showFilter, durationis: $filterDuration, categoryIs: $filteredCategory, applyButtonTapped: $applybuttonTap)
                .offset(y: showFilter ? 200 : 800)
                .navigationBarHidden(true)
        }
        .onChange(of: filteredCategory){ category in
            print("main category: \(filteredCategory)")
            print("main duration: \(filterDuration)")
        }
        .onChange(of: applybuttonTap){ apply in
            searchText = filteredCategory
            withAnimation(.easeIn){
                showFilter = false
            }
        }
    }
}

struct HomeChoiceYourCourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeChoiceYourCourseDetailView()
    }
}

struct CategoriesView2: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("Categories")
                .font(.body)
                .fontWeight(.medium)
                .fontDesign(.rounded)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<5){ num in
                        HStack(alignment: .center, spacing: 0) {
                            Image(collectionItem[num].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .padding(.leading, 15)
                            Text(collectionItem[num].item)
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
                .padding(1)
                HStack{
                    ForEach(6..<11){ num in
                        HStack(alignment: .center, spacing: 0) {
                            Image(collectionItem[num].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .padding(.leading, 15)
                            Text(collectionItem[num].item)
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
                .padding(1)
            }
        }
    }
}

struct AllCoursesView: View{
    let search: SearchResult
    var body: some View{
        HStack(alignment: .top){
            Image(search.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            VStack(alignment: .leading, spacing: 5){
                Text(search.title)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                Text(search.chapters)
                    .font(.system(size: 9))
                    .fontWeight(.regular)
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                Text(search.type)
                    .font(.system(size: 6))
                    .fontWeight(.regular)
                    .fontDesign(.rounded)
                    .padding(3)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .fill(.yellow)
                    )
            }
        }
    }
}

struct SearcFieldFiletrView2: View{
    @Binding var searchText: String
    @Binding var showFilter: Bool
    var body: some View{
        HStack(alignment: .center, spacing: 15){
            HStack(alignment: .center,spacing: 10){
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black.opacity(0.9), lineWidth: 0.7)
            )
            Image(systemName: "slider.vertical.3")
                .resizable()
                .scaledToFit()
                .frame(width: 35)
                .foregroundColor(.white)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("ColorOrenge"))
                )
                .onTapGesture {
                    withAnimation(.easeOut){
                        showFilter = true
                    }
                }
        }
    }
}

struct SearchFilterView2: View{
    @Binding var showFilter: Bool
    @State var categorySelected = ""
    @State var durationSelected = ""
    @Binding var durationis: String
    @Binding var categoryIs: String
    @State var clear = false
    @Binding var applyButtonTapped: Bool
    var body: some View{
        VStack(alignment: .center, spacing: 0){
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                Text("Search Filter")
                    .font(.body)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                Spacer()
            }
            .overlay(
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .fontWeight(.semibold)
                    .frame(width: 11, height: 11, alignment: .center)
                    .padding(.trailing)
                    .onTapGesture {
                        withAnimation(.easeIn){
                            showFilter = false
                        }
                    },
                alignment: .trailing
            )
            .padding(.top, 30)
            .padding(.horizontal)
            SearchFilterCategoriesView(clearIt: $clear, categorySelected: $categorySelected)
            DurationView(tappedDuration: $durationSelected, clearIt: $clear)
                .padding(.horizontal, 10)
            Button{
                categoryIs = categorySelected
                durationis = durationSelected
                clear.toggle()
                applyButtonTapped.toggle()
            }label: {
                Text("Apply Filter")
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .frame(width: 370,height: 46)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("ColorOrenge"))
                    )
                    .padding(.top, 30)
            }
            Button{
                print("Clear")
                clear.toggle()
                applyButtonTapped.toggle()
            }label: {
                Text("Clear All")
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .frame(width: 370,height: 46)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .padding(.top, 10)
            }
            Spacer()
        }
        .background(.white)
        .cornerRadius(25)
    }
}
