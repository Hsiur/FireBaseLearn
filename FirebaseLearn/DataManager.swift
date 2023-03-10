//
//  DataManager.swift
//  FirebaseLearn
//
//  Created by Руслан Ишмухаметов on 10.03.2023.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    
    @Published var dogs: [Dog] = []
    
    init() {
        fetchDogs()
    }
    
    func fetchDogs() {
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments { snapshot, error in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let breed = data["breed"] as? String ?? ""
                    
                    let dog = Dog(id: id, breed: breed)
                    self.dogs.append(dog)

                }
            }
        }
        
    }
    
    func addDog(dogBreed: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Dogs").document(dogBreed)
        ref.setData(["Breed": dogBreed, "id" : 10]) { error in
            if let error = error {
                print(error.localizedDescription )
            }
        }
    }
}
