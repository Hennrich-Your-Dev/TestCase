//
//  ViewModel.swift
//  TestCase
//
//  Created by Douglas Hennrich on 23/03/22.
//

import Foundation

// MARK: Delegate
protocol ViewModelDelegate: AnyObject {

}

// MARK: ViewModel
class ViewModel {
  // MARK: Properties
  let service: Service

  // MARK: Init
  init(service: Service = Service()) {
    self.service = service
  }
}

// MARK: Delegate Conforms
extension ViewModel: ViewModelDelegate {

}
