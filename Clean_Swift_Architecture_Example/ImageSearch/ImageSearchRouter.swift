//
//  ImageSearchRouter.swift
//  Clean_Swift_Architecture_Example
//
//  Created by ADMIN on 24/05/20.
//  Copyright (c) 2020 Success Resource Pte Ltd.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ImageSearchRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ImageSearchDataPassing
{
  var dataStore: ImageSearchDataStore? { get }
}

class ImageSearchRouter: NSObject, ImageSearchRoutingLogic, ImageSearchDataPassing
{
  weak var viewController: ImageSearchViewController?
  var dataStore: ImageSearchDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  func dimissToSearchController(source: ImageSearchViewController, destination: HomeViewController)
  {
    source.dismiss(animated: true)
  }
  
  // MARK: Passing data
  
  func passDataToHomeVC(source: ImageSearchDataStore, destination: inout HomeDataStore)
  {
  }
}
