//
//  Phasa6.swift
//  TestFor10Phases
//
//  Created by Алексей Журавлев on 20.02.2023.
//

import SwiftUI

struct Phasa6: View {
    var body: some View {
        VStack(spacing: 10){
            HStack{
                ForEach(1...9, id: \.self) { index in
                    ZStack{
                        Image(systemName: "rectangle.portrait")
                            .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(.black, lineWidth: 2))
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        Text("\(index)")
                            .font(.title2)
                            .bold()
                    }
                }
            }
            
            HStack {
                Text("Девять карт подряд")
                    .fontWeight(.semibold)
                    .fontWidth(.compressed)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct Phasa6_Previews: PreviewProvider {
    static var previews: some View {
        Phasa6()
    }
}
