//
//  MissionView.swift
//  Moonshot
//
//  Created by 박수호 on 2023/02/07.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    // VStack 내부에 VStack을 두면서
                    // 개별적인 alignment를 적용할 수 있다.
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        MissionView(mission: missions[0])
        // 이 Preview는 컬러 테마 세팅이 dark로 되어 있는
        // 것을 모르기 때문에 별도로 dark 모드 세팅 필수
            .preferredColorScheme(.dark)
    }
}
