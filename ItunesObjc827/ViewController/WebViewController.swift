//
//  WebViewController.swift
//  ItunesObjc827
//
//  Created by mac on 10/10/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import WebKit

@objcMembers class WebViewController: UIViewController {
    
    let webView = WKWebView()
    
    let loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 25
        return view
    }()
    
    let loadingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Loading.."
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.hidesWhenStopped = true
        activity.startAnimating()
        activity.style = .whiteLarge
        return activity
    }()
    
    var album: Album!
    
    override func loadView() {
        super.loadView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupWeb()
        
    }
    
    
    private func setupViews() {
        
        //Create StackView
        let horizontalStack = UIStackView(arrangedSubviews: [activityIndicator, loadingLabel])
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fill
        horizontalStack.spacing = 10
        
        //LoadingView SubViews
        loadingView.addSubview(horizontalStack)
        
        //WebView SubViews
        webView.addSubview(loadingView)
        
        //Add all subviews BEFORE settings constraints
        horizontalStack.leadingAnchor.constraint(equalTo: loadingView.leadingAnchor, constant: 10).isActive = true
        horizontalStack.trailingAnchor.constraint(equalTo: loadingView.trailingAnchor).isActive = true
        horizontalStack.topAnchor.constraint(equalTo: loadingView.topAnchor).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: loadingView.bottomAnchor).isActive = true
        
        loadingView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loadingView.centerXAnchor.constraint(equalTo: webView.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: webView.centerYAnchor).isActive = true
        
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        loadingView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupWeb() {
        
        guard let url = URL(string: "https://www.google.com") else {
            return
        }
        
        webView.navigationDelegate = self
        let request = URLRequest(url: url)
        webView.load(request)
    }
    

}

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        loadingView.isHidden = true
    }
    
    
}
