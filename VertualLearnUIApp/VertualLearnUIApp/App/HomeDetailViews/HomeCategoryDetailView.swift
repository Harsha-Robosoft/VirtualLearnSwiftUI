//
//  HomeCategoryDetailView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 11/07/23.
//

import SwiftUI

struct HomeCategoryDetailView: View {
    
    @State var goToHome = false
    
    
    let column: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .center,spacing: 0) {
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
            VStack(alignment: .leading, spacing: 15){
                Text("Categories")
                    .font(.title)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                Text("Please choose a topic on which you want to start a course.")
                    .font(.body)
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    
            }
            .padding(.top)
            
            LazyVGrid(columns: column, spacing: 20){
                ForEach(0..<11){ i in
                    NavigationLink(destination: ItemDetailsView(goHome: $goToHome)){
                        VStack(alignment: .center,spacing: 10){
                            Image(collectionItem[i].image)
                            Text(collectionItem[i].item)
                                .font(.system(size: 12))
                                .foregroundColor(.black
                                )
                        }
                        .frame(width: 100, height: 80)
                        .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray.opacity(0.5), lineWidth: 0.8)
                        )
                    }
                }
            }
            .padding(.top, 30)
            Spacer()
                .navigationBarHidden(true)
        }
        .padding(.horizontal)
        .onChange(of: goToHome){ newvalue in
            if newvalue{
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct HomeCategoryDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeCategoryDetailView()
    }
}
