//
//  Phasa8.swift
//  TestFor10Phases
//
//  Created by Алексей Журавлев on 20.02.2023.
//

import SwiftUI

struct Phasa8: View {
    var body: some View {
        VStack(spacing: 10){
            HStack{
                ForEach(1...7, id: \.self) { index in
                    ZStack{
                        Image(systemName: "rectangle.portrait.fill")
                            .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(.black, lineWidth: 2))
                            .font(.title)
                            .foregroundColor(.gray)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    }
                }
            }
            
            HStack {
                Text("Семь карт одного цвета")
                    .fontWeight(.semibold)
                    .fontWidth(.compressed)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct Phasa8_Previews: PreviewProvider {
    static var previews: some View {
        Phasa8()
    }
}
