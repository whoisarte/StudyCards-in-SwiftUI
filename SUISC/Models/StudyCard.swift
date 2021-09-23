import FirebaseFirestoreSwift


struct StudyCard: Identifiable, Codable {
    @DocumentID var id: String?
    var question: String
    var answer: String
    var passed: Bool = false
}
