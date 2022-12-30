//
//  Slider.swift
//  Khalo
//
//  Created by Furqan on 28/12/2022.
//

import SwiftUI

struct Slider: View {
    @State var value:Color = Color.red
    var body: some View {
       
            ZStack(alignment: .leading)
            {
//                Text("\(proxy.size.width)")
//                    .offset(x:100 , y:100)
                BackgroundComponent()
                DraggingComponent(maxWidth:(UIScreen.main.bounds.width/2)+90, val: $value)
                    .frame(height: 50)
                
                
            }.frame(width:UIScreen.main.bounds.width , height: 75)
            .background(value)
                .padding()
//        }
       
    }
}
struct DraggingComponent:View{
    let maxWidth: CGFloat
    @Binding var val:Color
    private let minWidth = CGFloat(50)
    @State private var width = CGFloat(50)
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
             .fill(Color.clear)
             .frame(width: width)
             .overlay(alignment: .trailing)
              { image()}
              .gesture(
                DragGesture()
                  .onChanged { value in
                      if value.translation.width > 0 {
                      width = min(
                         max(value.translation.width + minWidth, minWidth)
                         , maxWidth)
                      }
                      if (width > ((UIScreen.main.bounds.width-20)/2))
                      {
                          val = Color.green
                      }
                      else
                      {
                          val = Color.red
                      }
                   
                }
                   
                
              )
              .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0), value: width)
             
    }
    private func image() -> some View {
        ZStack
        {
        RoundedRectangle(cornerRadius: 35)
            .frame(width: 130, height: 50)
            .foregroundColor(.white)
            .overlay(alignment:.center)
            {
                Text("swipe")
                 .foregroundColor(.black)
            }
        }.offset(x: 70)
//        .opacity(isShown ? 1 : 0)
//        .scaleEffect(isShown ? 1 : 0.01)
    }
    
}

struct BackgroundComponent: View {

    var body: some View {
      
        VStack
        {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.blue.opacity(0.4))
                .frame(width:UIScreen.main.bounds.width-20 , height: 50)
                .overlay(alignment: .leading)
            {
         
                Text("Slide to unlock")
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .offset(x:(UIScreen.main.bounds.width/4)+15)
            
        }

            
                
        }
               
           
   
    }

}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider()
    }
}

