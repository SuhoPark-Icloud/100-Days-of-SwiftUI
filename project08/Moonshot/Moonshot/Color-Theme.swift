//
//  Color-Theme.swift
//  Moonshot
//
//  Created by 박수호 on 2023/02/05.
//

import SwiftUI

// background()에서 Color가 아닌 ShapeStyle을 사용하기 때문에
// Color 타입으로 제한을 두는 ShapeStyle에 대한 extenstion
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
