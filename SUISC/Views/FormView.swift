//
//  FormView.swift
//  SUILoginFirebase
//
//  Created by Artemio on 23/09/21.
//
import SwiftUI

struct FormView: View {
    @State private var question: String = ""
    @State private var answer: String = ""
    
    var didAddCard: (_ studyCard: StudyCard) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Pregunta", text: $question)
                    TextField("Respuesta", text: $answer)
                }
                Button ("Crear tarjeta") {
                    let card = StudyCard(question: question, answer: answer)
                    didAddCard(card)
                }.disabled(question.isEmpty || answer.isEmpty).padding()
            }.navigationTitle("Nueva tarjeta de estudio")
        }
    }
}
