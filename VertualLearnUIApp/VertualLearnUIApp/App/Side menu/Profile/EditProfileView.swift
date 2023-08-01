//
//  EditProfileView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 27/07/23.
//

import SwiftUI
struct EditProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var fieldString = ""
    @State var tapped01 = false
    @State var tapped02 = false
    @State var tapped03 = false
    @State var tapped04 = false
    @State var tapped05 = false
    @State var tapped06 = false
    @State var tapped07 = false
    @State var tapped08 = false
    @State var tapped09 = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                Image("img_profiledetails_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width:UIScreen.screenWidth,height: 320)
                    .overlay(
                        VStack(alignment: .center, spacing: 20){
                            HStack(alignment: .center){
                                Image(systemName: "arrow.left")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                Spacer()
                            }
                            
                            HStack(alignment: .center){
                                Text("Edit Profile")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            
                            Image("img_profile change")
                                .overlay(
                                Image("icn_change profilepic")
                                    .offset(x: 5, y: 5),
                                alignment: .bottomTrailing
                                )
                            HStack{
                                Spacer()
                                Text("Change Image")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .fontDesign(.rounded)
                                    .foregroundColor(Color("ColorOrenge"))
                            }
                        }
                            .padding(.top, 40)
                            .fontDesign(.rounded)
                            .padding(.horizontal),
                        alignment: .center
                    )
                
                VStack(alignment: .center,spacing: 30){
                    //MARK: - Full name
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text("Full Name")
                                .modifier(txtMofifier())
                            Spacer()
                        }
                        .onTapGesture {
                            withAnimation(.easeOut){
                                tapped01.toggle()
                            }
                        }
                        if tapped01{
                            TextField("", text: $fieldString)
                                .modifier(FieldModifier())
                                .padding(.top, tapped01 ? 10 : -20)
                        }
                            
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(tapped01 ? .accentColor : .gray)
                            .padding(.top, 10)
                    }
                    //MARK: - User Name
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text("User Name")
                                .modifier(txtMofifier())
                            Spacer()
                        }
                        .onTapGesture {
                            withAnimation(.easeOut){
                                tapped02.toggle()
                            }
                        }
                        if tapped02{
                            TextField("", text: $fieldString)
                                .modifier(FieldModifier())
                                .padding(.top, tapped02 ? 10 : -20)
                        }
                            
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(tapped02 ? .accentColor : .gray)
                            .padding(.top, 10)
                    }
                    //MARK: - Email
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text("Email")
                                .modifier(txtMofifier())
                            Spacer()
                        }
                        .onTapGesture {
                            withAnimation(.easeOut){
                                tapped03.toggle()
                            }
                        }
                        if tapped03{
                            TextField("", text: $fieldString)
                                .modifier(FieldModifier())
                                .padding(.top, tapped03 ? 10 : -20)
                        }
                            
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(tapped03 ? .accentColor : .gray)
                            .padding(.top, 10)
                    }
                    //MARK: - Mobile Number
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text("Mobile Number")
                                .modifier(txtMofifier())
                            Spacer()
                        }
                        .onTapGesture {
                            withAnimation(.easeOut){
                                tapped04.toggle()
                            }
                        }
                        if tapped04{
                            TextField("", text: $fieldString)
                                .modifier(FieldModifier())
                                .padding(.top, tapped04 ? 10 : -20)
                        }
                            
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(tapped04 ? .accentColor : .gray)
                            .padding(.top, 10)
                    }
                    //MARK: - Occupation
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text("Occupation")
                                .modifier(txtMofifier())
                            Spacer()
                        }
                        .onTapGesture {
                            withAnimation(.easeOut){
                                tapped05.toggle()
                            }
                        }
                        if tapped05{
                            TextField("", text: $fieldString)
                                .modifier(FieldModifier())
                                .padding(.top, tapped05 ? 10 : -20)
                        }
                            
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(tapped05 ? .accentColor : .gray)
                            .padding(.top, 10)
                    }
                    //MARK: - Gender
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text("Gender")
                                .modifier(txtMofifier())
                            Spacer()
                        }
                        .onTapGesture {
                            withAnimation(.easeOut){
                                tapped06.toggle()
                            }
                        }
                        if tapped06{
                            TextField("", text: $fieldString)
                                .modifier(FieldModifier())
                                .padding(.top, tapped06 ? 10 : -20)
                        }
                            
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(tapped06 ? .accentColor : .gray)
                            .padding(.top, 10)
                    }
                    //MARK: - Date of Birth
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text("Date of Birth")
                                .modifier(txtMofifier())
                            Spacer()
                        }
                        .onTapGesture {
                            withAnimation(.easeOut){
                                tapped07.toggle()
                            }
                        }
                        if tapped07{
                            TextField("", text: $fieldString)
                                .modifier(FieldModifier())
                                .padding(.top, tapped07 ? 10 : -20)
                        }
                            
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(tapped07 ? .accentColor : .gray)
                            .padding(.top, 10)
                    }
                    //MARK: - Twitter link
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text("Twitter link")
                                .modifier(txtMofifier())
                            Spacer()
                        }
                        .onTapGesture {
                            withAnimation(.easeOut){
                                tapped08.toggle()
                            }
                        }
                        if tapped08{
                            TextField("", text: $fieldString)
                                .modifier(FieldModifier())
                                .padding(.top, tapped08 ? 10 : -20)
                        }
                            
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(tapped08 ? .accentColor : .gray)
                            .padding(.top, 10)
                    }
                    //MARK: - Twitter link
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text("Twitter link")
                                .modifier(txtMofifier())
                            Spacer()
                        }
                        .onTapGesture {
                            withAnimation(.easeOut){
                                tapped09.toggle()
                            }
                        }
                        if tapped09{
                            TextField("", text: $fieldString)
                                .modifier(FieldModifier())
                                .padding(.top, tapped09 ? 10 : -20)
                        }
                            
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(tapped09 ? .accentColor : .gray)
                            .padding(.top, 10)
                    }
                }
                .padding(.top, 35)
                .padding(.horizontal)
                .fontDesign(.rounded)
                
                Text("Save")
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.screenWidth - 30,height: 46)
                    .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("ColorOrenge"))
                    )
                    .padding(.top, 40)
                
                    .navigationBarHidden(true)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

//struct EditProfileView: View {
//    @Environment(\.presentationMode) var presentationMode
//
//    struct FieldData {
//        var title: String
//        @Binding var fieldString: String
//        @State var tapped: Bool = false
//    }
//
//    @State private var fields: [FieldData] = [
//        FieldData(title: "Full Name", fieldString: .constant("")),
//        FieldData(title: "User Name", fieldString: .constant("")),
//        FieldData(title: "Email", fieldString: .constant("")),
//        FieldData(title: "Mobile Number", fieldString: .constant("")),
//        FieldData(title: "Occupation", fieldString: .constant("")),
//        FieldData(title: "Gender", fieldString: .constant("")),
//        FieldData(title: "Date of Birth", fieldString: .constant("")),
//        FieldData(title: "Twitter link", fieldString: .constant("")),
//        FieldData(title: "Twitter link", fieldString: .constant(""))
//    ]
//
//    var body: some View {
//        ScrollView {
//            VStack {
//                Image("img_profiledetails_bg")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width:UIScreen.screenWidth,height: 320)
//                    .overlay(
//                        VStack(alignment: .center, spacing: 20){
//                            HStack(alignment: .center){
//                                Image(systemName: "arrow.left")
//                                    .font(.title2)
//                                    .fontWeight(.medium)
//                                    .foregroundColor(.white)
//                                    .onTapGesture {
//                                        presentationMode.wrappedValue.dismiss()
//                                    }
//                                Spacer()
//                            }
//
//                            HStack(alignment: .center){
//                                Text("Edit Profile")
//                                    .font(.title)
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.white)
//                                Spacer()
//                            }
//
//                            Image("img_profile change")
//                                .overlay(
//                                Image("icn_change profilepic")
//                                    .offset(x: 5, y: 5),
//                                alignment: .bottomTrailing
//                                )
//                            HStack{
//                                Spacer()
//                                Text("Change Image")
//                                    .font(.system(size: 15))
//                                    .fontWeight(.bold)
//                                    .fontDesign(.rounded)
//                                    .foregroundColor(Color("ColorOrenge"))
//                            }
//                        }
//                            .padding(.top, 40)
//                            .fontDesign(.rounded)
//                            .padding(.horizontal),
//                        alignment: .center
//                    )
//
//                VStack(alignment: .center, spacing: 30) {
//                    ForEach(0..<fields.count) { index in
//                        generateField(index: index)
//                    }
//                }
//                .padding(.top, 35)
//                .padding(.horizontal)
//                .fontDesign(.rounded)
//                .navigationBarHidden(true)
//            }
//        }
//        .edgesIgnoringSafeArea(.top)
//    }
//
//    private func generateField(index: Int) -> some View {
//        VStack(alignment: .leading, spacing: 0) {
//            HStack {
//                Text(fields[index].title)
//                    .modifier(txtMofifier())
//                Spacer()
//            }
//            .onTapGesture {
//                withAnimation(.easeOut) {
//                    fields[index].tapped.toggle()
//                }
//            }
//
//            if fields[index].tapped {
//                TextField("", text: fields[index].$fieldString)
//                    .modifier(FieldModifier())
//                    .padding(.top, fields[index].tapped ? 10 : -20)
//            }
//
//            Rectangle()
//                .frame(height: 1)
//                .foregroundColor(fields[index].tapped ? .accentColor : .gray)
//                .padding(.top, 10)
//        }
//    }
//}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

struct txtMofifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(.gray)
    }
}
struct FieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.body)
            .fontWeight(.medium)
            .foregroundColor(.accentColor)
    }
}
