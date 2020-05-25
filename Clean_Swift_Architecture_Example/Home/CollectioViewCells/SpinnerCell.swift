//
//  SpinnerCell.swift
//  Clean_Swift_Architecture_Example
//
//  Created by ADMIN on 24/05/20.
//  Copyright © 2020 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class SpinnerCell: UICollectionViewCell {
    var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    func setupComponents(){
        contentView.addSubview(spinner)
        NSLayoutConstraint.activate([
             spinner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
             spinner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
