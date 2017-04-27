//
//  WebViewControllerI.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Stipe Vucemilovic on 4/27/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class WebViewControllerI: UIViewController {

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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
