//
//  ImageCell.swift
//  Clean_Swift_Architecture_Example
//
//  Created by ADMIN on 21/05/20.
//  Copyright © 2020 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    let nameLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let likeView: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents(){
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1.0),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 1.0),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -1.0),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -54.0),
        ])
        
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0.0),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 1.0),
        ])
        
        contentView.addSubview(likeView)
        NSLayoutConstraint.activate([
            likeView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2.0),
            likeView.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 2.0),
            likeView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -2.0),
            likeView.heightAnchor.constraint(equalTo: nameLabel.heightAnchor, constant: -4),
            likeView.widthAnchor.constraint(equalToConstant: 52),
        ])

        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0.0),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 1.0),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -2.0),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1.0),
            descriptionLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor, constant: 0.0)
        ])
    }
}
