//
//  DetailsInteractor.swift
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

protocol DetailsBusinessLogic
{
  func doSomething(request: Details.Something.Request)
}

protocol DetailsDataStore
{
    var imageDataModdel: Home.ImageList.Response.ImageListModelElement! { get set }
}

class DetailsInteractor: DetailsBusinessLogic, DetailsDataStore
{
    var imageDataModdel: Home.ImageList.Response.ImageListModelElement!
    
  var presenter: DetailsPresentationLogic?
  var worker: DetailsWorker?
  
  // MARK: Do something
  
  func doSomething(request: Details.Something.Request)
  {
    worker = DetailsWorker()
    worker?.doSomeWork()
    
    let response = Details.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
