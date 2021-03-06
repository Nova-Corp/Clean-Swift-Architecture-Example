//
//  ImageSearchViewController.swift
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

protocol ImageSearchDisplayLogic: class
{
    func displayKeywordList(viewModel: ImageSearch.SearchContents.Response.SearchKeyWord)
}

protocol SendSearchKeywordDelegate {
    func didSendSearchKeyword(_ keyword: String)
}

class ImageSearchViewController: UIViewController, ImageSearchDisplayLogic
{
    var sendSearchKeywordDelegate: SendSearchKeywordDelegate?
    
  var interactor: ImageSearchBusinessLogic?
  var router: (NSObjectProtocol & ImageSearchRoutingLogic & ImageSearchDataPassing)?
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.showsCancelButton = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var searchKeyWordList = ImageSearch.SearchContents.Response.SearchKeyWord()
    


  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ImageSearchInteractor()
    let presenter = ImageSearchPresenter()
    let router = ImageSearchRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    
    searchBar.delegate = self
    tableView.delegate = self
    tableView.dataSource = self
    
    setupSearchView()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        self.dismiss(animated: true)
    }
  
    func displayKeywordList(viewModel: ImageSearch.SearchContents.Response.SearchKeyWord)
  {
    searchKeyWordList.removeAll()
    searchKeyWordList = viewModel
    
    DispatchQueue.main.async {
        self.tableView.reloadData()
    }
  }
}

extension ImageSearchViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func setupSearchView() {
        self.view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            searchBar.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            searchBar.leftAnchor.constraint(equalTo: self.view.leftAnchor),
        ])
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchKeyWordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = searchKeyWordList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let router = ImageSearchRouter()
        sendSearchKeywordDelegate?.didSendSearchKeyword(searchKeyWordList[indexPath.row])
        router.dimissToSearchController(source: self, destination: HomeViewController())
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        var request = ImageSearch.SearchContents.Request()
        let searchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if searchText != "" {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                request.searchKeywordURL += searchText
                self.interactor?.getParsedJSONKeywordList(request: request)
            }
        }else{
            return
        }
    }
}

