//
//  ViewController.swift
//  ProtocolNetwork_Demo
//
//  Created by sunze on 2018/5/25.
//  Copyright © 2018年 sz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var networkManager: NetworkManager!
    
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        networkManager.getNewMovies(page: 1) { (movies, error) in
            print(movies,error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

