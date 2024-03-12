//
//  myViewController.swift
//  theCollection
//
//  Created by Fong on 3/12/24.
//

import UIKit

class myViewController: UIViewController {
    var preImage:UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        anImage.image = preImage
    }
    
    @IBOutlet weak var anImage: UIImageView!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
