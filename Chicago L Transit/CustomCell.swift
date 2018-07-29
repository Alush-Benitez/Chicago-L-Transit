//
//  CustomCell.swift
//  Chicago L Transit
//
//  Created by Alush Benitez on 7/27/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    var name: String?
    var colorLineImage: UIImage?
    var distance: String?
    
    var messageView: UITextView = {
        var textView = UITextView()
        textView.font = .systemFont(ofSize: 25.0, weight: UIFont.Weight(rawValue: 7))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var mainImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var distanceView: UITextView = {
        var textView = UITextView()
        textView.font = .systemFont(ofSize: 10.0, weight: UIFont.Weight(rawValue: 3))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(messageView)
        self.addSubview(mainImageView)
        self.addSubview(distanceView)
        
        distanceView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        distanceView.widthAnchor.constraint(equalToConstant: 23).isActive = true
        distanceView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        distanceView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        mainImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 161).isActive = true
        //161

        messageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        messageView.rightAnchor.constraint(equalTo: self.mainImageView.leftAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        messageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let name = name {
            messageView.text = name
        }
        if let image = colorLineImage {
            mainImageView.image = image
        }
        if let distance = distance {
            distanceView.text = distance
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
