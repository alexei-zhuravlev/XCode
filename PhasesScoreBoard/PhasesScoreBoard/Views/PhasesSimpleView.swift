//
//  PhasesSimpleView.swift
//  PhasesScoreBoard
//
//  Created by Алексей Журавлев on 11.02.2023.
//

import SwiftUI

struct PhasesSimpleView: View {
    
    var numerOfPhase:Int
    var isDone:Bool
    
    var body: some View {
        
        ZStack {
            Image(systemName: isDone ? "circle.fill" : "circle")
                .font(.title)
            Text("\(numerOfPhase)")
                .font(.title2)
                .bold()
                .foregroundColor(isDone ? .white : .black)
        }
        .frame(width: 10, height: 10)
        .padding(2)
    }
}

struct PhasesSimpleView_Previews: PreviewProvider {
    static var previews: some View {
        PhasesSimpleView(numerOfPhase: 1, isDone: false)
    }
}
