import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class CardRepository: ObservableObject {
    private let store = Firestore.firestore()
    private let path = "studyCards"
    @Published var studyCards: [StudyCard] = []
    
    init(){
        get()
    }
    
    func get(){
        store.collection(path).addSnapshotListener { snapshot, error in
            if let error = error {
                print(error)
                return
            }
            self.studyCards = snapshot?.documents.compactMap{
                try? $0.data(as: StudyCard.self)
            } ?? []
        }
    }
    
    func add(_ studyCard: StudyCard){
        do {
            _ = try store.collection(path).addDocument(from: studyCard)
        } catch {
            fatalError("The studycard can not be added to the database")
        }
    }
    
    func remove(_ studyCard: StudyCard){
        guard let documentId = studyCard.id else { return }
        store.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Unable to delete. \(error.localizedDescription)")
            }
        }
    }
    
    func update(_ studyCard: StudyCard){
        guard let documentId = studyCard.id else { return }
        do {
            try store.collection(path).document(documentId).setData(from: studyCard)
        } catch {
            fatalError("Updating the studyCard failed")
        }
    }
}
