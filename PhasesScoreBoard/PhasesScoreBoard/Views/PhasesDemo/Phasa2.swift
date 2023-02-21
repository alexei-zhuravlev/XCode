//
//  Phasa2.swift
//  TestFor10Phases
//
//  Created by Алексей Журавлев on 20.02.2023.
//

import SwiftUI

struct Phasa2: View {
    var body: some View {
        VStack(spacing: 10){
            HStack{
                ForEach(0...2, id: \.self) { index in
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
                    .fontWeight(.semibold)
                
                ForEach(1...4, id: \.self) { index in
                    ZStack{
                        Image(systemName: "rectangle.portrait")
                            .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(.black, lineWidth: 2))
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 5, x: 3, y: 3)
                        Text("\(index)")
                            .font(.title2)
                            .bold()
                    }
                }
            }
            
            Text("Три одинаковые + четыре подряд")
                .fontWeight(.semibold)
                .fontWidth(.compressed)
                .lineLimit(1)
                .frame(maxWidth: .infinity)
            
        }
    }
}

struct Phasa2_Previews: PreviewProvider {
    static var previews: some View {
        Phasa2()
    }
}
