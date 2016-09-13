//
//  VideoCell.swift
//  NSURLSessionB
//
//  Created by Lin Wei on 9/12/16.
//  Copyright © 2016 Lin Wei. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    
    let videoImageView:UIImageView = {
        
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .ScaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
        
    }()
    
    let textView : UITextView = {
        
        
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.userInteractionEnabled = true
        view.editable = false
        return view
        
    }()
    
    let detailedTextView : UITextView = {
        
        let view = UITextView()
        view.editable = false
        view.userInteractionEnabled = true
        
        view.textColor = UIColor.darkGrayColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
        
        
        
        addSubview(videoImageView)
        addSubview(textView)
        addSubview(detailedTextView)
        
        videoImageView.leftAnchor.constraintEqualToAnchor(self.leftAnchor,constant: 5).active = true
        videoImageView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
        videoImageView.widthAnchor.constraintEqualToConstant(50).active = true
        videoImageView.heightAnchor.constraintEqualToConstant(50).active = true
        
        textView.leftAnchor.constraintEqualToAnchor(videoImageView.rightAnchor,constant: 5).active = true
        textView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor,constant: -5).active = true
        textView.heightAnchor.constraintEqualToConstant(40).active = true
        textView.rightAnchor.constraintEqualToAnchor(self.rightAnchor,constant: -5).active = true
        
        detailedTextView.leftAnchor.constraintEqualToAnchor(videoImageView.rightAnchor,constant: 5).active = true
        detailedTextView.centerYAnchor.constraintEqualToAnchor(textView.centerYAnchor,constant: 15).active = true
        detailedTextView.heightAnchor.constraintEqualToConstant(20).active = true
        detailedTextView.rightAnchor.constraintEqualToAnchor(self.rightAnchor,constant: -5).active = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

