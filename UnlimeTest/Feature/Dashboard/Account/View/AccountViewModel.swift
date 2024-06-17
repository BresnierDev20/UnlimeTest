//
//  ProfileViewModel.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 16/6/24.
//

import Foundation
import Stinsen
import Factory

class AccountViewViewModel : ObservableObject {
    var authCoordinator = Container.shared.mainCoordinator()
    var datastore = Container.datastore
    
    let sections: [SectionData] = [
        SectionData(title: "General", items: ["Notificaciones", "Pagos", "Mis viajes", "Cambiar contraseña"]),
        SectionData(title: "Acerca De", items: ["Acuerdo de Usuario", "Acuerdo de Privacidad", "Informacion Legal"])
    ]
    
    func logout() {
        datastore.deleteUserKey()
        
          self.authCoordinator
            .popToRoot()
            .route(to: \.auth)
    }
}

