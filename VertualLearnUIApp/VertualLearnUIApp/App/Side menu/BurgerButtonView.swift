//
//  BurgerButtonView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 07/07/23.
//

import SwiftUI

struct BurgerButtonView: View {
    let imageIs: String
    let name: String
    
    @Binding var tappedItem: String
    @State var buttonTapped = false
    
    var body: some View {
        HStack(alignment: .center,spacing: 0){
            Button{
//                self.buttonTapped = true
                if name == "Home"{
                    tappedItem = name
                }else if name == "My Course"{
                    tappedItem = name
                }
                else if name == "My Profile"{
                    tappedItem = name
                }
                else if name == "Notification"{
                    tappedItem = name
                }
                else if name == "Setting"{
                    tappedItem = name
                }
                else if name == "Logout"{
                    tappedItem = name
                }
            }label: {
                HStack(alignment: .center, spacing: 25){
                    Image(systemName: imageIs)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 14.67, height: 16)
                        .padding(.leading, 25)
                    Text(name)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                    Spacer()
                }
                .foregroundColor(buttonTapped ? .pink : .black)
                .frame(width: UIScreen.screenWidth / 1.25, height: 55)
            }
        }

    }
}

struct BurgerButtonView_Previews: PreviewProvider {
    @State static var tapped = ""
    static var previews: some View {
        BurgerButtonView(imageIs: "house", name: "Home", tappedItem: $tapped)
            .previewLayout(.sizeThatFits)
    }
}
