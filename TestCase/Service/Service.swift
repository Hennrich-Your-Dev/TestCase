//
//  Service.swift
//  TestCase
//
//  Created by Douglas Hennrich on 23/03/22.
//

import Foundation

class Service {
  // MARK: Properties

  // MARK: Actions
  func buscaTodosParceiros(onCompletion completion: @escaping ([Partner]) -> Void) {
    let allPartners: [Partner] = [
      "Dario Perez",
      "Matheus Costa",
      "Felipe Moreno",
      "João Dezembro",
      "Guilherme Morgado"
    ].sorted().map {
      Partner(
        name: $0.components(separatedBy: " ")[0],
        lastName: $0.components(separatedBy: " ")[1]
      )
    }

    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
      completion(allPartners)
    }
  }
}
