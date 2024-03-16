//
//  ViewController.swift
//  theProfile
//
//  Created by Fong on 3/15/24.
//

import UIKit
import SwiftyJSON
import SDWebImage


class ViewController: UIViewController {
    
    
    @IBAction func theBtn(_ sender: UIButton) {
        updateScreen()
    }
    @IBOutlet weak var theIndicator: UIActivityIndicatorView!
    @IBOutlet weak var theEmailLabel: UILabel!
    @IBOutlet weak var theNameLabel: UILabel!
    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var theImageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theImage.layer.cornerRadius = theImage.bounds.width / 2
        theImageView.layer.cornerRadius = theImage.bounds.width / 2
        theImageView.layer.borderColor = UIColor.black.cgColor
        theImageView.layer.borderWidth = 1.5
        updateScreen()
        // Do any additional setup after loading the view.
        
    }
    
    func updateScreen(){
        getUserData { data, error in
            self.theIndicator.startAnimating()
            if let error = error{
                let alert = UIAlertController(title: "Error", message: "Get data error: \(error)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"OK", style: .default, handler: { alert in
                    
                }))
                self.present(alert, animated: true)
                self.theIndicator.stopAnimating()
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                if let user = data{
                    if let imageUrl = URL(string: user["picture"]["large"].stringValue){
                        self.theImage.sd_setImage(with: imageUrl) { image, error, type, url in
                            
                            self.theNameLabel.text = "\(user["name"]["first"].stringValue) \(user["name"]["last"].stringValue)"
                            self.theEmailLabel.text = user["email"].stringValue
                            
                            self.theIndicator.stopAnimating()}
                    }
                }
            })
        }
    }
    
    func getUserData(_ handler: @escaping(_ data:JSON?, _ error:Error?)->()){
        RandomUserModel.model.requestUser { data, error in
            if let error = error{
                print("Somethins Wrong:\(error)")
                handler(nil, error)
                return
            }
            if let data = data {
                let user = JSON(data)["results"].arrayValue[0]
                handler(user, nil)
                
            }
        }
        
        
    }
    
    
}

