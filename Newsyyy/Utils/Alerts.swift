//
//  Alerts.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-23.
//

import SwiftUI

class Alerts {
    static let shared = Alerts()
}

extension Alerts {
    func showErrorAlert(title: String = "Error", message: String, action: @escaping (()->())) -> Alert {
        return Alert(title: Text(title),
                     message: Text(message),
                     dismissButton: .cancel(Text("OK"), action: action))
    }
}
