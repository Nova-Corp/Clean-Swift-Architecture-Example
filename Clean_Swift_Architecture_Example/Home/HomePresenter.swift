//
//  HomePresenter.swift
//  Clean_Swift_Architecture_Example
//
//  Created by ADMIN on 21/05/20.
//  Copyright (c) 2020 Success Resource Pte Ltd.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic
{
    func presentParsedImageList(response: Home.ImageList.Response.ImageListModel)
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
    func presentParsedImageList(response: Home.ImageList.Response.ImageListModel)
  {
    let viewModel = response
    viewController?.displayParsedImageList(viewModel: viewModel)
  }
}
