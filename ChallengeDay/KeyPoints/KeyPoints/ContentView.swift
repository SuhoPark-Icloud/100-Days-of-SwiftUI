//
//  ContentView.swift
//  KeyPoints
//
//  Created by Suho Park on 10/29/23.
//

import SwiftUI

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable {
    var id: String
    var name: String
}

struct ContentView: View {
    @State private var users = [User]()
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                NavigationLink {
                    Form {
                        Section {
                            RowText(key: "Age", value: user.age)
                            RowText(key: "Company", value: user.company)
                            RowText(key: "Email", value: user.email)
                            RowText(key: "Address", value: user.address)
                            RowText(key: "Registered", value: formatDate(user.registered))
                            NavigationLink {
                                List {
                                    ForEach(user.tags, id: \.self) {
                                        Text($0)
                                    }
                                }
                            } label: {
                                Text("Tags")
                            }
                            NavigationLink {
                                List {
                                    ForEach(user.friends, id: \.id) {
                                        Text($0.name)
                                    }
                                }
                            } label: {
                                Text("Friends")
                            }
                        }

                        Section("About") {
                            Text(user.about)
                        }
                    }
                    .navigationTitle(user.name)
                    .navigationBarTitleDisplayMode(.inline)
                } label: {
                    HStack {
                        Text(user.name)
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .foregroundStyle(user.isActive ? .green : .gray)
                    }
                }
            }
            .task {
                if users.isEmpty {
                    await loadData()
                }
            }
            .navigationTitle("User List")
        }
    }

    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                users = try decoder.decode([User].self, from: data)
            } catch {
                print(String(describing: error))
            }
        } catch {
            print(String(describing: error))
        }
    }

    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    ContentView()
}
