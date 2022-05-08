//
//  VideoCardDetail.swift
//  sample (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 5/05/22.
//

import SwiftUI

typealias MethodHandler = ()  -> Void
struct VideoCardDetail: View {
    var  onTap:MethodHandler
    var urlImage:String
    
    init(urlImage:String="https://www.cuerpomente.com/medio/2021/04/12/mar-transformacion_85b1486d_465x800.jpg", onTap:@escaping MethodHandler){
        self.urlImage=urlImage
        self.onTap = onTap
    }
    var body: some View {
        Button(action:{
            onTap()
        }, label: {
            ZStack{
                AsyncImage(url: URL(string: urlImage), content: { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                }, placeholder: {
                    ProgressView()
                })
                Rectangle()
                                .fill(Color.black.opacity(0.3))
                Image(systemName: "play.circle.fill").resizable().frame(width: 80, height: 80, alignment: .center).foregroundColor(.white)
            }
        }).frame( maxWidth: 190, maxHeight: 300).background().clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct VideoCardDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoCardDetail(onTap:{
            
        })
    }
}
