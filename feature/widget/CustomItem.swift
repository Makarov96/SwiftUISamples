//
//  CustomItem.swift
//  sample (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 5/05/22.
//

import SwiftUI

struct CustomItem: View {
    var backgroundColor:Color;
    var iconName:String;
    var title:String;
    var subTitle:String;
    init(backgroundColor:Color = .white, iconName:String="books.vertical.fill", title:String, subTitle:String){
        self.backgroundColor = backgroundColor
        self.iconName = iconName
        self.title=title
        self.subTitle=subTitle
    }
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack(){
                Image(systemName: self.iconName)
                    .foregroundColor(Color(hex: 0xFF2A2AC7))
                VStack(alignment:.leading){
                    Text(title).foregroundColor(.black).fontWeight(.black).font(.headline)
                    Text(subTitle).foregroundColor(.gray)
                }
            }.padding()
        })
       
        .frame(width: 150, height: 70).background(backgroundColor).clipShape(RoundedRectangle(cornerRadius: 15)).shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}

struct CustomItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomItem(title: "Sample", subTitle: "sample")
    }
}
