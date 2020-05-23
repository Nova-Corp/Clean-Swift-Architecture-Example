//
//  DetailsViewController.swift
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

protocol DetailsDisplayLogic: class
{
  func displaySomething(viewModel: Details.Something.ViewModel)
}

class DetailsViewController: UIViewController, DetailsDisplayLogic
{
  var interactor: DetailsBusinessLogic?
  var router: (NSObjectProtocol & DetailsRoutingLogic & DetailsDataPassing)?
    
    let imagePreview: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()

    let closeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let nameLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

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
    let interactor = DetailsInteractor()
    let presenter = DetailsPresenter()
    let router = DetailsRouter()
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
    view.backgroundColor = .black
    detailsViewSetup()
    setupContentView()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func setupContentView()
  {
//    let request = Details.Something.Request()
//    interactor?.doSomething(request: request)
    
    guard let thumbURL = URL(string: (router?.dataStore?.imageDataModdel.urls?.regular)!) else { return }
    let data = try? Data(contentsOf: thumbURL)
    if let imageData = data {
        let image = UIImage(data: imageData)
        imagePreview.image = image
    }
    
    guard let width = router?.dataStore?.imageDataModdel.width else {return}
    guard let height = router?.dataStore?.imageDataModdel.height else {return}
    descriptionLabel.text = (router?.dataStore?.imageDataModdel.altDescription)! + " (\(width)X\(height))"
    
    nameLabel.text = router?.dataStore?.imageDataModdel.user?.name
    
    closeBtn.addTarget(self, action: #selector(dismissPrenstation), for: .touchUpInside)
  }
    
    
    
    @objc func dismissPrenstation() {
        self.dismiss(animated: true)
    }
  
  func displaySomething(viewModel: Details.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}


extension DetailsViewController {
    func detailsViewSetup() {
        self.view.addSubview(imagePreview)
        NSLayoutConstraint.activate([
            imagePreview.topAnchor.constraint(equalTo: self.view.topAnchor),
            imagePreview.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            imagePreview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            imagePreview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        self.view.addSubview(closeBtn)
        NSLayoutConstraint.activate([
            closeBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 12),
            closeBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -12),
            closeBtn.widthAnchor.constraint(equalToConstant: 38),
            closeBtn.heightAnchor.constraint(equalTo: closeBtn.widthAnchor),
        ])
        
        self.view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
        
        self.view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor),
            nameLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
}