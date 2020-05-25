//
//  HomeRouter.swift
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

@objc protocol HomeRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing
{
  var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing
{
  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?
  
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
  
  func navigateToDetailsViewController(source: HomeViewController, destination: DetailsViewController)
  {
    var destinationDS = destination.router!.dataStore!
    viewController = source
    dataStore = source.router?.dataStore
    dataStore?.imageDataModdel = source.homePageViewModel
    passDataToDetailView(source: dataStore!, destination: &destinationDS)
    destination.modalPresentationStyle = .overFullScreen
    source.present(destination, animated: true)
  }
    
    func navigateToSearchViewController(source: HomeViewController, destination: ImageSearchViewController)
    {
        destination.modalPresentationStyle = .formSheet
      source.present(destination, animated: true)
    }
  
  // MARK: Passing data
  
  func passDataToDetailView(source: HomeDataStore, destination: inout DetailsDataStore)
  {
    let indexPath = viewController?.imageGrid.indexPathsForSelectedItems?.first
    destination.imageDataModdel = source.imageDataModdel[indexPath!.item]
  }
}
