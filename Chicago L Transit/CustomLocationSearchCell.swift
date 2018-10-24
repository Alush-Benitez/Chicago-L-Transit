//
//  CustomLocationSearchCell.swift
//  Chicago L Transit
//
//  Created by Alush Benitez on 8/18/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import Foundation
import UIKit

class CustomLocationSearchCell: UITableViewCell {
    var name: String?
    var address: String?
    var distance: String?
    var eta: String?
    var mainImage: UIImage?
    
    
    // *******************************
    // SET UP TEXT VIEW AND IMAGE VIEW
    // *******************************
    var nameView: UITextView = {
        var textView = UITextView()
        textView.font = .systemFont(ofSize: 17.0, weight: UIFont.Weight(rawValue: 1))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var addressView: UITextView = {
        var textView = UITextView()
        textView.font = .systemFont(ofSize: 10.0, weight: UIFont.Weight(rawValue: 1))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var distanceView: UITextView = {
        var textView = UITextView()
        textView.font = .systemFont(ofSize: 10.0, weight: UIFont.Weight(rawValue: 1))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var etaView: UITextView = {
        var textView = UITextView()
        textView.font = .systemFont(ofSize: 10.0, weight: UIFont.Weight(rawValue: 1))
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
    
    // ***********************
    // SET UP CELL CONSTRAINTS
    // ***********************
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(nameView)
        self.addSubview(mainImageView)
        self.addSubview(distanceView)
        self.addSubview(etaView)
        self.addSubview(addressView)
        
        distanceView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        distanceView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        distanceView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        distanceView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        etaView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        etaView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        etaView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        etaView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 5).isActive = true
        
        nameView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        nameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        addressView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        addressView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addressView.topAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let name = name {
            nameView.text = name
        }
        if let image = mainImage {
            mainImageView.image = image
        }
        if let distance = distance {
            distanceView.text = distance
        }
        if let address = address {
            addressView.text = address
        }
        if let eta = eta {
            etaView.text = eta
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
