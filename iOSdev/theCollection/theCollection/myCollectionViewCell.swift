//
//  myCollectionViewCell.swift
//  theCollection
//
//  Created by Fong on 3/12/24.
//

import UIKit

class myCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var theImage: UIImageView!
    var anAction:(() -> ())? = nil
    
    func setCell(){
        theImage.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        addGestureRecognizer(singleTap)
    }
    
    @objc func imageViewTapped(_ sender: Any?) {
        anAction?()
        print("Image 被點擊了！")
}
}
