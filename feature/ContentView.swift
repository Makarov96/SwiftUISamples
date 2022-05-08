//
//  ContentView.swift
//  Shared
//
//  Created by Guerin Steven Colocho Chacon on 4/05/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @StateObject var screenProtector:ScreenProtector=ScreenProtector()
    @State var searchText:String=""
    @State var show:Bool = false;
    @State var loadingView:Bool=false
    @Namespace var nameSpace
    
 
    var body: some View {
        if self.screenProtector.isNecessaryHideScreen{
            ZStack{
                Color(.white).frame( maxWidth: .infinity,maxHeight: .infinity)
                Text("Vaya descubrimos que estasgrabando la pantalla")
            }
        }else{
            NavigationView{
                ZStack(alignment: .top){
                    Color(.white).ignoresSafeArea()
                    BubleBackground()
                    
                    VStack(alignment:.leading, spacing: 25){
                        CustomHeaderApp()
                       
                        Text("AudioBooks for all lovers of listening!")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .font(.title)
                        ScrollView(showsIndicators:false){
                           
                            
                            ZStack(alignment: .trailing){
                                TextField("Search", text: $searchText).padding(.leading, 20.0)
                                    .frame(height: 50, alignment: .center).background(.white).clipShape(RoundedRectangle(cornerRadius: 10)).shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 0)
                                
                                Button(action: {
                                    print( self.screenProtector.isNecessaryHideScreen);
                                }, label: {
                                    Image(systemName: "mic.fill").frame(width: 50, height: 50, alignment: .center)
                                }).frame(width: 50, height:.infinity, alignment: .trailing).background(Color(hex: 0xFFF2F4FF)).clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                            Spacer(minLength: 20)
                            Button(action: {}, label: {
                                HStack(alignment:.center,spacing: 20){
                                    Image(systemName: "bookmark.fill").resizable().aspectRatio(contentMode: .fill).frame(width: 15, height: 15).foregroundColor(.white)
                                    Text("Books Catalog").foregroundColor(.white).fontWeight(.bold)
                                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(LinearGradient(gradient:Gradient(colors:[Color(hex: 0xFF2F2EB9),Color(hex:0xFF4A49D4)]),startPoint:.leading,endPoint: .trailing )).clipShape(RoundedRectangle(cornerRadius: 15))
                            }).frame(width: .infinity, height: 70)
                            Spacer(minLength: 20)
                            ZStack{
                                Rectangle().frame(width: .infinity, height: 200).foregroundColor(Color(hex: 0xFFC3C5B2)).clipShape(RoundedRectangle(cornerRadius: 10))
                                HStack{
                                  
                                        AsyncImage(url: URL(string: "https://www.jordanbpeterson.com/wp-content/uploads/2015/03/maps_of_meaning_cover.png"), content: {
                                            image in
                                            image.resizable().aspectRatio(contentMode: .fill).frame(width: 120, height: 170).clipShape(RoundedRectangle(cornerRadius: 10))
                                            
                                        }, placeholder: {
                                            ProgressView()
                                        }).onTapGesture {
                                            withAnimation(.spring()){
                                                show.toggle()
                                                DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
                                                    loadingView.toggle()
                                                }
                                            }
                                        }.matchedGeometryEffect(id:"1234" , in: self.nameSpace)
                                  //  NavigationLink(destination: DetailBookView(show: //self.show),isActive: $show , label: {
                                  //      EmptyView()
                                  //  })
                                  //  Spacer()
                                    
                                    VStack(alignment: .leading){
                                        Text("Maps of meaning")
                                        Text("Would War I. The Definitve Guide")
                                            .fontWeight(.bold)
                                            .font(.title2)
                                        
                                        Button(action: {}, label:{
                                            Text("More").fontWeight(.bold).foregroundColor(.black).frame(width: 100, height: 40).background(.white).clipShape(RoundedRectangle(cornerRadius: 10)).shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 0)
                                        })
                                    }
                                }.padding()
                            }
                            
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    CustomItem(title: "All Books", subTitle: "6678" )
                                    CustomItem(iconName:"triangle.lefthalf.filled",title: "Design", subTitle: "109").padding()
                                    CustomItem(iconName:"tshirt",title: "Style", subTitle: "30")
                                }
                            }.frame(width: .infinity, height: 100)
                            
                            Text("Continue listen").fontWeight(.bold)
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    VideoCardDetail(onTap: {
                                        
                                    })
                                    VideoCardDetail(urlImage:"https://s03.s3c.es/imag/_v0/770x420/a/b/3/600x400_La-orilla-del-mar-con-el-sol-poniendose-al-fondo-iStock.jpg",onTap: {
                                        
                                    }).padding()
                                    VideoCardDetail(urlImage: "https://img.lalr.co/cms/2015/04/07171155/Caba%C3%B1as.jpg?size=sm&ratio=sq&f=jpg",onTap: {
                                        
                                    })
                                }
                            }.frame(width: .infinity, height: 350)
                        }
                        
                        
                    }.frame(  maxWidth: 380,alignment: .center)
                    
                    
                    if show{
                        ScrollView( showsIndicators: false){
                            VStack{
                                AsyncImage(url: URL(string: "https://www.jordanbpeterson.com/wp-content/uploads/2015/03/maps_of_meaning_cover.png"), content: {
                                    image in
                                    image.resizable().aspectRatio(contentMode: .fill).frame(width: 220, height: 270).clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                }, placeholder: {
                                    ProgressView()
                                }).onTapGesture {
                                    withAnimation(.spring()){
                                        show.toggle()
                                        loadingView.toggle()
                                    }
                                }.matchedGeometryEffect(id:"1234" , in: self.nameSpace).padding(.top,40)
                             
                                Spacer(minLength: 30)
                                Text("Map Of Meaning By \n Jordan Perterson").fontWeight(.bold).font(.title).foregroundColor(.black)
                                
                                TextView(text:"Maps of Meaning: The Architecture of Belief is a 1999 book by Canadian clinical psychologist and psychology professor Jordan Peterson. The book describes a theory for how people construct meaning, in a way that is compatible with the modern scientific understanding of how the brain functions.It examines the structure of systems of belief and the role those systems play in the regulation of emotion, using multiple academic fields to show that connecting myths and beliefs with science is essential to fully understand how people make meaning").frame(width: .infinity, height: 300).background(.white).foregroundColor(.white)
                                
                                Spacer(minLength: 0)
                                Text("Reviews +100").fontWeight(.bold).font(.title2).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.black)
                                HStack{
                                  
                                    ForEach(0..<data.count) { i in
                                        AsyncImage(url: URL(string: (data[i])), content: {
                                            image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fill).frame(width: 50,height: 50)
                                                .clipShape(Circle())
                                                .offset(x: -CGFloat(i*25))
                                        }, placeholder: {
                                            ProgressView()
                                        })
                                    }
                                }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10)
                            }.frame( maxWidth: 400, maxHeight: .infinity)
                            
                        }
                        .frame( maxWidth: .infinity, maxHeight: .infinity)
                        .background(.white)
                    }
                }.navigationBarTitle("")
                    .navigationBarHidden(true)
            }
        }
    }
}

 var data:Array<String>=["https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80", "https://www.nlgja.org/wp-content/uploads/2015/01/TJ-Thomson-Square.jpg", "https://www.architecturalrecord.com/ext/resources/Contact/thumb/bridget-cogley-square-portrait.jpg?1616699583", "https://i.pinimg.com/originals/13/03/69/130369231ecba23d5e0e1230d015fb6e.jpg"]
struct TextView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.textAlignment = .justified
        textView.backgroundColor = .white
        textView.textColor = .black
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}


struct DetailBookView:View{
   
    @Binding var show:Bool
    @Namespace var nameSpace
    
   
    var body: some View{
        VStack{
            AsyncImage(url: URL(string: "https://www.jordanbpeterson.com/wp-content/uploads/2015/03/maps_of_meaning_cover.png"), content: {
                image in
                image.resizable().aspectRatio(contentMode: .fill).frame(width: 120, height: 170).clipShape(RoundedRectangle(cornerRadius: 10))
                
            }, placeholder: {
                ProgressView()
            }).onTapGesture {
                withAnimation(.spring()){
                    self.show.toggle()
                }
            }.matchedGeometryEffect(id:"1234" , in: self.nameSpace)
            Spacer()
        }.frame( maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
   
    static var previews: some View {
        ContentView()
    }
}


struct BubleBackground:View{
    var body: some View{
  
        RoundedRectangle(cornerSize: .zero)
            .cornerRadius(radius: 20.0, corners: [.bottomRight,.bottomLeft])
            .foregroundColor(Color(hex: 0x002F2FAC)).frame(maxWidth: .infinity,maxHeight: 300.0, alignment: .top).ignoresSafeArea()
    }
}


struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
struct CornerRadiusStyle: ViewModifier {
      var radius: CGFloat
      var corners: UIRectCorner
  
      func body(content: Content) -> some View {
          content
              .clipShape(CornerRadiusShape(radius: radius, corners: corners))
      }
  }



extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct CustomHeaderApp:View{
    var body: some View{
        HStack(alignment: .center){
            Button(action: {}, label: {
                HStack(alignment: .center, spacing: 20){
                    Image(systemName: "text.justify").resizable().foregroundColor(.white).aspectRatio(contentMode: .fill).frame(width: 15, height: 15).foregroundColor(.white)
                    
                }
            })
            Text("Books").foregroundColor(.white).fontWeight(.medium).font(.title2)
            Spacer(minLength: 10)
            Button(action: {}, label: {
                ZStack{
                    
                    Circle().foregroundColor(.white.opacity(0.2)).frame(width: 30, height: 30)
                    Image(systemName: "bell.fill").resizable().aspectRatio(contentMode: .fill).frame(width: 15, height: 15).foregroundColor(.white)
                    Circle().frame(width: 8, height: 8).foregroundColor(Color(hex: 0xFFE4D412)).offset(x: 8, y: -10)
                }
            })
            
            Button(action: {}, label: {
                ZStack{
                    Circle().foregroundColor(.white.opacity(0.2)).frame(width: 30, height: 30)
                    Image(systemName: "magnifyingglass").resizable().aspectRatio(contentMode: .fill).frame(width: 15, height: 15).foregroundColor(.white)
                }
            }).padding(.horizontal,3)
            
            Button(action: {}, label: {
                AsyncImage(url: URL(string: "https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png"), content: {
                    image in
                    image.resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50).clipShape(Circle())
                }, placeholder: {
                    ProgressView()
                })
            })
            
        }
    }
}

/**
 
 
 */
