//
//  CardView.swift
//  SUILoginFirebase
//
//  Created by Artemio on 23/09/21.
//
import SwiftUI

struct CardView: View {
    @State private var flipped = false
    var cardViewModel: CardViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(flipped ? Color.gray : Color.purple)
            .frame(height: 120)
            .overlay(ZStack {
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: cardViewModel.studyCard.passed ? "star.fill" : "star")
                        Spacer()
                    }
                }
                Text(flipped ? cardViewModel.studyCard.answer: cardViewModel.studyCard.question)
                    .foregroundColor(flipped ? Color.black : Color.white)
                    .font(.custom("Avenir", size: 24))
            }.padding()
        )
            .onTapGesture {
                flipped.toggle()
            }
    }
}
