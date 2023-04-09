//
//  BookwormApp.swift
//  Bookworm
//
//  Created by 박수호 on 2023/04/09.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            // managedObjectContext: 데이터의 live 버전
            // 객체를 로드하고 변경할 때, 이러한 변경 사항은 특히 영구 저장소에 다시 저장할 때까지 메모리에만 존재
        }
    }
}
