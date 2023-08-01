//
//  SearchView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 10/07/23.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var gotoHome: Bool
    
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    let java = "java"
    let userinterface = "userinterface"
    @State private var showFilter = false
    @State var filteredCategory = ""
    @State var filterDuration = ""
    @State var applybuttonTap = true
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0){
                HStack(alignment: .center, spacing: 0){
                    Spacer()
                    Text("Search")
                        .font(.headline)
                        .fontDesign(.rounded)
                    Spacer()
                }
                .overlay(
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .onTapGesture {
                            gotoHome = true
                            presentationMode.wrappedValue.dismiss()
                        },
                    alignment: .leading
                )
                .padding(.top, 10)
                
                SearcFieldFiletrView(searchText: $searchText, showFilter: $showFilter)
                    .padding(.top, 50)
                    .padding(.horizontal, 10)
                
                if searchText == ""{
                    HStack {
                        Text("Top Searches")
                            .font(.body)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .padding(.top,20)
                            .padding(.horizontal, 10)
                        Spacer()
                    }
                    
                    TopSearchView()
                    
                    SearchFromCategoriesView(headeTxt: "Search from Categories")
                    
                }else if searchText.lowercased() == java.lowercased(){
                    Image("img_search no result")
                        .padding(.top, 60)
                    Text("No matching course")
                        .font(.body)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .padding(.top, 30)
                    Text("Try a different search or browse categories")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundColor(.gray.opacity(0.8))
                        .padding(.top, 5)
                    
                    SearchFromCategoriesView(headeTxt: "Search from Categories")
                }else{
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 0){
                            ForEach(searchResult,id: \.id){ search in
                                SearchResultView(search: search)
                                    .padding(.vertical)
                            }
                        }
                    }
                    .padding(.top)
                }
                Spacer()
                    .navigationBarHidden(true)
            }
            .padding(.horizontal)
            
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

struct SearchView_Previews: PreviewProvider {
    @State static var goHome = false
    static var previews: some View {
        SearchView(gotoHome: $goHome)
    }
}

//MARK: - Search Textfield & FilterButton

struct SearcFieldFiletrView: View{
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

//MARK: - Top Search view

struct TopSearchView: View{
    @State private var isScrollEnabled = false
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 8){
                ForEach(0..<5){ i in
                    Text(topSearch[i])
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .fontDesign(.rounded)
                        .foregroundColor(Color.black.opacity(0.8))
                        .padding(.vertical, 5)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.yellow)
                        )
                    
                }
                Spacer()
            }
            .padding(.top, 15)
            .padding(.leading, 10)
            HStack(alignment: .center,spacing: 8){
                ForEach(5..<8){ i in
                    Text(topSearch[i])
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .fontDesign(.rounded)
                        .foregroundColor(Color.black.opacity(0.8))
                        .padding(.vertical, 5)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.yellow)
                        )
                }
                Spacer()
            }
            .padding(.top, 0)
            .padding(.leading, 10)
        }
        .disabled(!isScrollEnabled)
    }
}

//MARK: - SearchFromCategoriesView

struct SearchFromCategoriesView: View{
    @State var headeTxt: String
    var body: some View{
        HStack {
            Text(headeTxt)
                .font(.body)
                .fontWeight(.medium)
                .fontDesign(.rounded)
                .padding(.top,30)
                .padding(.horizontal, 10)
            Spacer()
        }
        
        VStack(alignment: .center, spacing: 0){
            HStack(alignment: .center, spacing: 10){
                ForEach(0..<3){ i in
                    HStack(alignment: .center, spacing: 0) {
                        Image(collectionItem[i].image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding(.leading, 10)
                        Text(collectionItem[i].item)
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .fontDesign(.rounded)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                    )
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(.leading, 10)
            HStack(alignment: .center, spacing: 10){
                ForEach(3..<6){ i in
                    HStack(alignment: .center, spacing: 0) {
                        Image(collectionItem[i].image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding(.leading, 10)
                        Text(collectionItem[i].item)
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .fontDesign(.rounded)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 9)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                    )
                }
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 10)
            HStack(alignment: .center, spacing: 10){
                ForEach(6..<9){ i in
                    HStack(alignment: .center, spacing: 0) {
                        Image(collectionItem[i].image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding(.leading, 10)
                        Text(collectionItem[i].item)
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .fontDesign(.rounded)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                    )
                }
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 10)
            HStack(alignment: .center, spacing: 10){
                ForEach(9..<11){ i in
                    HStack(alignment: .center, spacing: 0) {
                        Image(collectionItem[i].image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding(.leading, 10)
                        Text(collectionItem[i].item)
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .fontDesign(.rounded)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                    )
                }
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 10)
        }
    }
}

struct SearchResultView: View{
    let search: SearchResult
    var body: some View{
        HStack(alignment: .top){
            Image(search.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            VStack(alignment: .leading, spacing: 5){
                Text(search.title)
                    .font(.system(size: 12))
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

struct SearchFilterView: View{
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
//MARK: - DurationView

struct DurationView: View{
    @State var tappedIndex = 13
    @Binding var tappedDuration: String
    @Binding var clearIt: Bool
    
    func tappedDurationIndex(){
        tappedDuration = searchFilterDuration[tappedIndex]
    }
    var body: some View{
        VStack(alignment: .center, spacing: 0){
            HStack {
                Text("Duration")
                    .font(.body)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .padding(.top,30)
                Spacer()
            }
            HStack(alignment: .center, spacing: 10){
                ForEach(0..<3){ i in
                    Text(searchFilterDuration[i])
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .fontDesign(.rounded)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 10)
                        .background(
                            Group {
                                if i == tappedIndex {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.yellow)
                                } else {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                                }
                            }
                        )
                        .onTapGesture{
                            if tappedIndex == i {
                                tappedIndex = 13
                                tappedDuration = ""
                            }else{
                                tappedIndex = i
                                tappedDurationIndex()
                            }
                        }
                }
                Spacer()
            }
            .padding(.top, 10)
            HStack(alignment: .center, spacing: 10){
                ForEach(3..<5){ i in
                    Text(searchFilterDuration[i])
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .fontDesign(.rounded)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 10)
                        .background(
                            Group {
                                if i == tappedIndex {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.yellow)
                                } else {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                                }
                            }
                        )
                        .onTapGesture{
                            if tappedIndex == i {
                                tappedIndex = 13
                                tappedDuration = ""
                            }else{
                                tappedIndex = i
                                tappedDurationIndex()
                            }
                        }
                }
                Spacer()
            }
            .padding(.top, 10)
        }
        .onChange(of: clearIt){ clear in
            tappedIndex = 13
            tappedDuration = ""
        }
    }
}
//MARK: - SearchFilterCategoriesView

struct SearchFilterCategoriesView: View{
    @Binding var clearIt: Bool
    @Binding var categorySelected: String
    @State var tappedIndex = 12
    
    func tappedItem(){
        categorySelected = collectionItem[tappedIndex].item
    }
    
    var body: some View{
        VStack(spacing: 0) {
            HStack {
                Text("Categories")
                    .font(.body)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .padding(.top,30)
                    .padding(.horizontal, 10)
                Spacer()
            }
            VStack(alignment: .center, spacing: 0){
                HStack(alignment: .center, spacing: 10){
                    ForEach(0..<3){ i in
                        HStack(alignment: .center, spacing: 0) {
                            Image(collectionItem[i].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .padding(.leading, 10)
                            Text(collectionItem[i].item)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .fontDesign(.rounded)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                        }
                        .background(
                            Group {
                                if i == tappedIndex {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.yellow)
                                } else {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                                }
                            }
                        )
                        .onTapGesture {
                            if tappedIndex == i{
                                tappedIndex = 12
                                categorySelected = ""
                            }else{
                                tappedIndex = i
                                tappedItem()
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 10)
                HStack(alignment: .center, spacing: 10){
                    ForEach(3..<6){ i in
                        HStack(alignment: .center, spacing: 0) {
                            Image(collectionItem[i].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .padding(.leading, 10)
                            Text(collectionItem[i].item)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .fontDesign(.rounded)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                        }
                        .background(
                            Group {
                                if i == tappedIndex {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.yellow)
                                } else {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                                }
                            }
                        )
                        .onTapGesture {
                            if tappedIndex == i{
                                tappedIndex = 12
                                categorySelected = ""
                            }else{
                                tappedIndex = i
                                tappedItem()
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 10)
                HStack(alignment: .center, spacing: 10){
                    ForEach(6..<9){ i in
                        HStack(alignment: .center, spacing: 0) {
                            Image(collectionItem[i].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .padding(.leading, 10)
                            Text(collectionItem[i].item)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .fontDesign(.rounded)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                        }
                        .background(
                            Group {
                                if i == tappedIndex {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.yellow)
                                } else {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                                }
                            }
                        )
                        .onTapGesture {
                            if tappedIndex == i{
                                tappedIndex = 12
                                categorySelected = ""
                            }else{
                                tappedIndex = i
                                tappedItem()
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 10)
                HStack(alignment: .center, spacing: 10){
                    ForEach(9..<11){ i in
                        HStack(alignment: .center, spacing: 0) {
                            Image(collectionItem[i].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .padding(.leading, 10)
                            Text(collectionItem[i].item)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .fontDesign(.rounded)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                        }
                        .background(
                            Group {
                                if i == tappedIndex {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.yellow)
                                } else {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                                }
                            }
                        )
                        .onTapGesture {
                            if tappedIndex == i{
                                tappedIndex = 12
                                categorySelected = ""
                            }else{
                                tappedIndex = i
                                tappedItem()
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 10)
            }
        }
        .onChange(of: clearIt){ clear in
            tappedIndex = 12
            categorySelected = ""
        }
    }
}
