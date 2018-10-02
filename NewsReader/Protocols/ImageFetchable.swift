//
//  ImageFetchable.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

protocol ImageFetchable {
    func loadImage(url : URL,imageView : UIImageView)
}

extension ImageFetchable{
    func loadImage(url : URL,imageView : UIImageView){
        //Set SDWebImage to download image async
        imageView.sd_setShowActivityIndicatorView(true)
        
        imageView.sd_setIndicatorStyle(.gray)
        
        imageView.sd_setImage(with: url) { (image, error, cache, url) in
            DispatchQueue.main.async {
                guard error == nil else {
                    imageView.image = UIImage(named: "imageplaceholder")
                    return
                }
                
                imageView.image = image
            }
        }
    }
}
