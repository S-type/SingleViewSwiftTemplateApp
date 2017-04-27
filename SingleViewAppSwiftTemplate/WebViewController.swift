//
//  WebViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Stipe Vucemilovic on 4/25/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getEventURL()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getEventURL() {                                                           ///GET EVENT VIEW FROM WEB
    
        let eventURL = URL(string: "\(getRandomEventsData().dataURL)")
        let eventURLRequest = URLRequest(url: eventURL!)
        webView.loadRequest(eventURLRequest)
    
    }
    
    
    @IBAction func dismissWebView(_ sender: Any) {                                 ///DISMISS CHILDVIEW
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
