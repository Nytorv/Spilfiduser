//
//  FirstViewController.swift
//  Spilfiduser
//
//  Created by Dennis Schmidt on 04/08/2018.
//  Copyright © 2018 Dennis Schmidt. All rights reserved.
//

import UIKit

class MainView: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    //MARK: Initialize
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        
        print("viewWillTransition")
        
        prepareLayout(to: CGSize(width: size.width, height: size.height))
        
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        print("viewWillLayoutSubviews")
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        prepareLayout(to: CGSize(width: screenSize.width, height: screenSize.height))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        webView.scalesPageToFit = true
        
        guard let url = URL(string: "http://www.spilfiduser.dk") else { return }
        
        webView.loadRequest(URLRequest(url: url, cachePolicy:NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0))
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
        
    }
    
    //MARK: Prepare layout
    
    func prepareLayout(to size: CGSize) {
        
        print("prepareLayout")
        
        var xtraY: CGFloat = 0
        
        if self.view.safeAreaInsets.top == 0 {
            
            xtraY = 20
        }
        
        webView.frame = CGRect(x: 0, y: self.view.safeAreaInsets.top + xtraY, width: size.width, height: size.height - self.view.safeAreaInsets.bottom)
        
    }
    
}
