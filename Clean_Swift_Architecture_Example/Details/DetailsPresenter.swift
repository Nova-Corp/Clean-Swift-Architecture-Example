//
//  DetailsPresenter.swift
//  Clean_Swift_Architecture_Example
//
//  Created by ADMIN on 22/05/20.
//  Copyright (c) 2020 Success Resource Pte Ltd.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailsPresentationLogic
{
  func presentSomething(response: Details.Something.Response)
}

class DetailsPresenter: DetailsPresentationLogic
{
  weak var viewController: DetailsDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Details.Something.Response)
  {
    let viewModel = Details.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
