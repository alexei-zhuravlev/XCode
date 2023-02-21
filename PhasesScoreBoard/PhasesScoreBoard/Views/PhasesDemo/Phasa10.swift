//
//  Phasa10.swift
//  TestFor10Phases
//
//  Created by Алексей Журавлев on 20.02.2023.
//

import SwiftUI

struct Phasa10: View {
    var body: some View {
        VStack(spacing: 10){
            HStack{
                ForEach(0...4, id: \.self) { index in
                    ZStack{
                        Image(systemName: "rectangle.portrait")
                            .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(.black, lineWidth: 2))
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        Text("1")
                            .font(.title2)
                            .bold()
                    }
                }
                
                Image(systemName: "plus")
                
                ForEach(0...2, id: \.self) { index in
                    ZStack{
                        Image(systemName: "rectangle.portrait")
                            .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(.black, lineWidth: 2))
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        Text("3")
                            .font(.title2)
                            .bold()
                    }
                }
            }
            
            HStack {
                Text("пять одинаковых и три одинаковых")
                    .fontWeight(.semibold)
                    .fontWidth(.compressed)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct Phasa10_Previews: PreviewProvider {
    static var previews: some View {
        Phasa10()
    }
}
