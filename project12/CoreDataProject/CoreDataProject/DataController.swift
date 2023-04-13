//
//  DataController.swift
//  Bookworm
//
//  Created by 박수호 on 2023/04/09.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    // NS: NeXTSTEP, 스티브 잡스가 1997년에 돌아왔을 때 인수한 기업
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
