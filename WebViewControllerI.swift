//
//  WebViewControllerI.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Stipe Vucemilovic on 4/27/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class WebViewControllerI: UIViewController {

    @IBOutlet var webView: UIWebView?
    var webEventData : String = ""                                                ///STORED PROPERTY TO MANAGE FROM VIEWCONTROLLER
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWebEventData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getWebEventData() {                                                       ///LOAD WEBVIEW WITH EVENT URL DATA
        
        webView?.loadRequest(URLRequest(url: URL(string: "\(webEventData)")!))
    }

    
    @IBAction func dismissWebView(_ sender: Any) {                                 ///DISMISS CHILDVIEW
        
         dismiss(animated: true, completion: nil)
        
        
    }

}
