//
//  Extensions.swift
//  InstagramV1
//
//  Created by Hitesh Nalamwar on 2019-05-30.
//  Copyright © 2019 Hitesh Nalamwar. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor? , right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingBottom: CGFloat, paddingLeft: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat ){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom  {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
}

var imageCache = [String: UIImage]()

extension UIImageView {
        
    func loadImage(with urlString: String) {
        
        if let cacheImage = imageCache[urlString] {
            self.image = cacheImage
            return
        }
        //url for image location
        guard let url = URL(string: urlString) else {return}
        //fetch content of url
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            //image data
            
            guard let imageData = data else {return}
            // create image using data
            let photoImage = UIImage(data: imageData)
            // set key and value for image cache
            imageCache[url.absoluteString] = photoImage
            // set image
            DispatchQueue.main.async {
                self.image = photoImage
            }
        }.resume()
    }

}
        

