//
//  HomeView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 05/07/23.
//

import SwiftUI

struct HomeView: View {
    @State var hamBurgerButtonTapped = false
    @AppStorage("homeScreen") var homeScreen = false
    @AppStorage("ShowLog") var showLog = false
    @State var burgerButtonTapped = ""
    @State private var logOutAleart = false
    @State var myCourse = false
    @State var profile = false
    @State var notification = false
    @State var settings = false
    
    @State var myOngoingCourse = false
    
    @ObservedObject var helper = HelperClass.shared
        
    func performOperation() {
        print(burgerButtonTapped)
        switch burgerButtonTapped {
        case "Home":
            withAnimation(.easeOut){
                hamBurgerButtonTapped = false
            }
            burgerButtonTapped = ""
        case "My Course":
            myCourse = true
            hamBurgerButtonTapped = false
            burgerButtonTapped = ""
        case "My Profile":
            withAnimation(.easeOut){
                hamBurgerButtonTapped = false
            }
            profile = true
            burgerButtonTapped = ""
        case "Notification":
            withAnimation(.easeOut){
                hamBurgerButtonTapped = false
            }
            notification = true
            burgerButtonTapped = ""
        case "Setting":
            withAnimation(.easeOut){
                hamBurgerButtonTapped = false
            }
            settings = true
            burgerButtonTapped = ""
        case "Logout":
            withAnimation(.easeOut){
                hamBurgerButtonTapped = false
                logOutAleart = true
            }
            burgerButtonTapped = ""
        default:
            print("Performing default operation")
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center,spacing: 0){
                    HeaderView(hamBurgerButtonTapped: $hamBurgerButtonTapped)
                        .padding(.top, 0)
                        .padding(.trailing)
                    
                    GreetingNameView()
                        .padding(.top, 30)
                    
                    CollectionView01()
                    
                    if !helper.ongoingCourse.isEmpty{
                      Image("img_course_ongoing1")
                            .padding(.trailing)
                            .padding(.top, -20)
                            .overlay(
                                VStack(alignment: .leading, spacing: 0){
                                    Text("Ongoing")
                                        .font(.footnote)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.white)
                                    
                                    Text(helper.ongoingCourse[helper.ongoingCourse.count - 1].title)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.white)
                                        .padding(.top, 20)
                                    Text(helper.ongoingCourse[helper.ongoingCourse.count - 1].chapters)
                                        .font(.footnote)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.white)
                                    
                                    Button{
                                        myOngoingCourse = true
                                    }label:{
                                        Text("Continue")
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
                                    .padding(.top, 7)
                                    .padding(.leading, 40),
                                alignment: .topLeading
                            )
                            
                    }
                        
                    
                    Group{
                        HeadlineButtonView(healine: "Categories")
                            .padding(.trailing)
                        
                        CategoriesView()
                        .padding(.top, 15)
                        
                        HeadlineButtonView(healine: "Choice your course")
                            .padding(.top, 20)
                            .padding(.trailing)
                        
                        ChoiceButtonView()
                        .padding(.top, 20)
                        
                        ChoiceYourCourseView()
                    }
                    Group{
                    HeadlineButtonView(healine: "Top courses in Business")
                        .padding(.top, 20)
                        .padding(.trailing)
                    
                    TopBusinessCourcesView()
                    
                    HeadlineButtonView(healine: "Top courses in Design")
                        .padding(.top, 20)
                        .padding(.trailing)
                    
                        TopBusinessCourcesView()
                          //MARK: - Side menu navigation start
                        if !helper.ongoingCourse.isEmpty{
                            NavigationLink(destination: CourseDetailsView(collectionViewIndex: helper.ongoingCourse[helper.ongoingCourse.count - 1].courseCountNum, itemDetal: helper.ongoingCourse[helper.ongoingCourse.count - 1], overviewTapped: false, chaptersTapped: true, joinTheCourse: true, indexTapped: helper.ongoingCourse[helper.ongoingCourse.count - 1].tappedIndex), isActive: $myOngoingCourse){
                                EmptyView()
                            }
                        }
                        
                        NavigationLink(destination: MyCourseView(), isActive: $myCourse){
                            EmptyView()
                        }
                        
                        NavigationLink(destination: ProfileView(showSideMenu: $hamBurgerButtonTapped), isActive: $profile){
                            EmptyView()
                        }
                        NavigationLink(destination: NotificationView(), isActive: $notification){
                            EmptyView()
                        }
                        
                        NavigationLink(destination: SettingsView(), isActive: $settings){
                            EmptyView()
                        }
                        //MARK: - Side menu navigation end
                    }
                    .navigationBarHidden(true)
                }
                .onAppear{
                    showLog = false
                    homeScreen = true
                }
            .padding(.leading)
            }
            .offset(x: hamBurgerButtonTapped ? UIScreen.screenWidth / 1.25 : 0)
            //MARK: - Burger menu
            
            ZStack{
                Color.black.opacity( hamBurgerButtonTapped ? 0.4 : 0)
                    .edgesIgnoringSafeArea(.all)
            }
            .onTapGesture {
                withAnimation(.easeIn){
                    hamBurgerButtonTapped = false
                }
            }
            
            HStack(alignment: .center, spacing: 0){
                VStack(alignment: .center, spacing: 0){
                    Image("img_menubg")
                        .resizable()
                        .scaledToFit()
                        .overlay(
                            HStack(alignment: .center, spacing: 15){
                                Image("img_profile pic_menu")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 58, height: 58)
                                VStack(alignment: .leading, spacing: 6){
                                    Text("Harsha R Mundaragi")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.white)
                                    Text("UI/UX Designer")
                                        .font(.footnote)
                                        .fontWeight(.regular)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.white)
                                }
                            }
                                .padding(.leading, 22)
                                .padding(.bottom, 45),
                            alignment: .bottomLeading
                        )
                    BurgerButtonView(imageIs: "house", name: "Home", tappedItem: $burgerButtonTapped)
                        .padding(.top, 20)
                    BurgerButtonView(imageIs: "bag", name: "My Course", tappedItem: $burgerButtonTapped)
                        .padding(.top, 0)
                    BurgerButtonView(imageIs: "person", name: "My Profile", tappedItem: $burgerButtonTapped)
                        .padding(.top, 0)
                    BurgerButtonView(imageIs: "bell", name: "Notification", tappedItem: $burgerButtonTapped)
                        .padding(.top, 0)
                    BurgerButtonView(imageIs: "gearshape", name: "Setting", tappedItem: $burgerButtonTapped)
                        .padding(.top, 0)
                    BurgerButtonView(imageIs: "power", name: "Logout", tappedItem: $burgerButtonTapped)
                        .padding(.top, 0)
                    Spacer()
                }
                .background(.white)
                .offset(x: hamBurgerButtonTapped ? 0 : -UIScreen.screenWidth / 1.25)
                .frame(width: UIScreen.screenWidth / 1.25)
                .edgesIgnoringSafeArea(.vertical)
                Spacer()
            }
            .onChange(of: burgerButtonTapped) { newValue in
                performOperation()
            }
        }
        .alert(isPresented: $logOutAleart){
            Alert(
                title: Text("Are you sure want ti logout?"),
                primaryButton: .cancel(Text("Cancel")),
                secondaryButton: .destructive(Text("Logout"),action:{
                    print("log out tapped")
                    homeScreen = false
                    showLog = true
                })
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HeaderView: View{
    @Binding var hamBurgerButtonTapped : Bool
    @State var goHome = false
    var body: some View{
        HStack(alignment: .center,spacing: 0){
            Image("icn_hamburgermenu")
                .onTapGesture {
                    withAnimation(.easeInOut){
                        hamBurgerButtonTapped = true
                    }
                }
            Spacer()
            NavigationLink(destination: SearchView(gotoHome: $goHome)){
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.black)
            }
        }
    }
}

struct CollectionView01: View{
    let images = ["img_banner1_home","img_banner2_home@1.5x","img_course1_bg"]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center,spacing: 40){
                ForEach(0..<3){ x in
                    Image(images[x])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 260, height: 180)
                }
            }
        }
    }
}

struct HeadlineButtonView: View{
    let healine: String
    var body: some View{
        HStack(alignment: .center, spacing: 0){
            Text(healine)
                .fontWeight(.medium)
                .fontDesign(.rounded)
            Spacer()
                if healine == "Categories"{
                    NavigationLink(destination: HomeCategoryDetailView()){
                        Text("See All")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                }else if healine == "Choice your course"{
                    NavigationLink(destination: HomeChoiceYourCourseDetailView()){
                        Text("See All")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                }else{
                    Text("See All")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }
        }
    }
}

struct GreetingNameView: View{
    var body: some View{
        HStack(alignment: .center, spacing: 0){
            VStack(alignment: .leading, spacing: 10){
                Text("Hello!")
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                Text("Harsh R Mundaragi")
                    .font(.title3)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(.accentColor)
            }
            Spacer()
        }
    }
}

struct CategoriesView: View{
    @State var home = false
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<5){ num in
                    NavigationLink(destination: ItemDetailsView(goHome: $home)){
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
                                .foregroundColor(.black)
                        }
                        .background(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                    )
                    }
                }
                Spacer()
            }
            .padding(1)
            HStack{
                ForEach(6..<11){ num in
                    NavigationLink(destination: ItemDetailsView(goHome: $home)){
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
                            .foregroundColor(.black)
                        }
                        .background(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.gray.opacity(0.6), lineWidth: 0.7)
                        )
                    }
                }
                Spacer()
            }
            .padding(1)
        }
    }
}

struct ChoiceButtonView: View{
    
    @State private var allTapped = true
    @State private var popularTapped = false
    @State private var newestTapped = false
    
    var body: some View{
        HStack(alignment: .center, spacing: 10){
            Text("All")
                .padding(.vertical, 6)
                .padding(.horizontal)
                .foregroundColor(allTapped ? Color(uiColor: darkBlue) : .gray)
                .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(allTapped ? Color("ColorblueLight") : Color.clear)
                )
                .onTapGesture {
                    allTapped = true
                    popularTapped =  false
                    newestTapped = false
                }
            Text("Popular")
                .padding(.vertical, 6)
                .padding(.horizontal)
                .foregroundColor(popularTapped ? Color(uiColor: darkBlue) : .gray)
                .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(popularTapped ? Color("ColorblueLight") : Color.clear)
                )
                .onTapGesture {
                    allTapped =  false
                    popularTapped = true
                    newestTapped = false
                }
            Text("Newest")
                .padding(.vertical, 6)
                .padding(.horizontal)
                .foregroundColor(newestTapped ? Color(uiColor: darkBlue) : .gray)
                .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(newestTapped ? Color("ColorblueLight") : Color.clear)
                )
                .onTapGesture {
                    allTapped = false
                    popularTapped = false
                    newestTapped =  true
                }
            Spacer()
        }
        .font(.footnote)
        .fontDesign(.rounded)
        .foregroundColor(.gray)
    }
}

struct ChoiceYourCourseView: View{
    @ObservedObject var helper = HelperClass.shared
    var body: some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment: .center, spacing: 0){
                ForEach(0..<helper.homeChoiceYourCourseCollectionViewdata.count){ num in
                    NavigationLink(destination: CourseDetailsView(collectionViewIndex: num, itemDetal: helper.homeChoiceYourCourseCollectionViewdata[num])){
                        VStack(alignment: .center,spacing: 0) {
                            Image(helper.homeChoiceYourCourseCollectionViewdata[num].image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 175, height: 100)
                            .padding(.leading, 0)
                            VStack(alignment: .leading, spacing: 5){
                                Text(helper.homeChoiceYourCourseCollectionViewdata[num].title)
                                    .font(.system(size: 10))
                                    .fontWeight(.medium)
                                    .fontDesign(.rounded)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                Text(helper.homeChoiceYourCourseCollectionViewdata[num].chapters)
                                    .font(.system(size: 8))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 8)
                            }
                            .frame(width: 140,height: 55)
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.1), radius: 2, x: -2,y: 5)
                        .frame(width: 175)
                        .padding(.leading, 11)
                    }
                }
            }
            .padding(.vertical)
        }
        .padding(.leading, -9)
    }
}

struct TopBusinessCourcesView: View{
    var body: some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment: .center, spacing: 0){
                ForEach(topBusinessCourse, id: \.id){ item in
                    VStack(alignment: .leading, spacing: -10){
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .offset(x: -18)
                            .overlay(
                            Image("icn_play-play-button2")
                            )
                        VStack(alignment: .leading,spacing: 4){
                            Text(item.headLine)
                                .font(.system(size: 15))
                                .fontWeight(.light)
                                .fontDesign(.rounded)
                            HStack(alignment: .center,spacing: 0){
                                Text(item.chapters)
                                    .fontWeight(.light)
                                    .foregroundColor(.gray)
                                    .padding(.trailing)
                                Image(systemName: "clock")
                                    .fontWeight(.light)
                                    .foregroundColor(.gray)
                                Text(item.hours)
                                    .fontWeight(.light)
                                    .foregroundColor(.gray)
                                    .padding(.leading, 3)
                            }
                            .font(.system(size: 12))
                        }
                    }
                }
            }
        }
    }
}
