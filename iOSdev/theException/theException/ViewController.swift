//
//  ViewController.swift
//  theException
//
//  Created by Fong on 3/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getImageFromUrl(url: "https://previews.123rf.com/images/barks/barks1903/barks190300063/119203073-thumb-up-like-good-icon.jpg")
    }

    func getImageFromUrl(url: String = ""){
        if let urlCon = URL(string: url){
            DispatchQueue.global().async {
                do{
                    let data = try Data(contentsOf: urlCon)
                    DispatchQueue.main.async {
                        self.theImage.image = UIImage(data: data)
                    }
                    
                }catch{
                    DispatchQueue.main.async {
                        let alertVC = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                        alertVC.addAction(UIAlertAction(title: "Ok", style: .default))
                        self.present(alertVC, animated: true)
                    }

                }
            }

            

        }
        
    }

}

