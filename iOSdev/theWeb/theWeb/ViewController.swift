//
//  ViewController.swift
//  theWeb
//
//  Created by Fong on 3/13/24.
//

import UIKit
import SafariServices
import WebKit
class ViewController: UIViewController {
    let urlstring = "https://www.microsoft.com/ko-kr/"


    @IBOutlet weak var theView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func theBtn(_ sender: Any) {
        if let url = URL(string: urlstring) {
            let app = UIApplication.shared
            app.open(url)
        }
 
    }
    
    @IBAction func theBtn2(_ sender: Any) {
        if let url = URL(string: urlstring) {
            let view = SFSafariViewController(url: url)
            present(view, animated: true)
        }
        
    }
    @IBAction func theBtn3(_ sender: Any) {
        if let url = URL(string: urlstring){
            theView.load(URLRequest(url:url))
        }
    }
    
    @IBAction func theBtn4(_ sender: Any) {
        if let url = Bundle.main.url(forResource: "sample", withExtension: "html"){
            do{
                let htmlRaw = try String(contentsOf: url)
                theView.loadHTMLString(htmlRaw, baseURL: nil)
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }
}

