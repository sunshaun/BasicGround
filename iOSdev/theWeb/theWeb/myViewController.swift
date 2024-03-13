//
//  myViewController.swift
//  theWeb
//
//  Created by Fong on 3/13/24.
//

import UIKit
import WebKit
class myViewController: UIViewController {

    @IBOutlet weak var theBtnF: UIButton!
    @IBOutlet weak var theBtnB: UIButton!
    @IBOutlet weak var theAddress: UITextField!
    @IBOutlet weak var theTools: UIView!
    @IBOutlet weak var theWindow: WKWebView!
    let IndexUrl = "https://www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        theGo(IndexUrl)
        theWindow.navigationDelegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func theForward(_ sender: Any) {
        theWindow.goForward()
        theAddress.text = theWindow.url?.absoluteString
        
    }
    @IBAction func theBack(_ sender: Any) {
        theWindow.goBack()
        theAddress.text = theWindow.url?.absoluteString
    }
    @IBAction func theRun(_ sender: Any) {
        var url = theAddress.text ?? ""
        if !url.lowercased().contains("https://"){
            url = "https://\(url)"
        }
        theGo(url)

    }
    func theGo(_ url: String){
        if let url = URL(string: url){
            let request = URLRequest(url: url)
            theWindow.load(request)
        }
    }
}

extension myViewController:WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        theBtnB.isHidden = !theWindow.canGoBack
        theBtnF.isHidden = !theWindow.canGoForward
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.theAddress.text = webView.url?.absoluteString
        
        if let url = webView.url?.absoluteString{
            if url.lowercased().contains("google.com"){
                print("got it")
            }else{
                theGo(IndexUrl)
                let alert = UIAlertController(title: "Warning", message: "you need to goto google", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "got it", style: .default))
                present(alert, animated: true)
            }
           
        }
    }
}
