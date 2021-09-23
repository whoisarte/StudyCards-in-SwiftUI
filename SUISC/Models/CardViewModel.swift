//
//  CardViewModel.swift
//  SUILoginFirebase
//
//  Created by Artemio on 23/09/21.
//

import Combine

final class CardViewModel: ObservableObject, Identifiable {
    private let cardRepository = CardRepository()
    @Published var studyCard: StudyCard
    
    var id = ""
    init(studyCard: StudyCard){
        self.studyCard = studyCard
        $studyCard.compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    private var cancellables: Set<AnyCancellable> = []
}
