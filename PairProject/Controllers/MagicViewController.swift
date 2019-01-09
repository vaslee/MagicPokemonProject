//
//  ViewController.swift
//  PairProject
//
//  Created by Jane Zhu on 1/9/19.
//  Copyright © 2019 JaneZhu. All rights reserved.
//

import UIKit

class MagicViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MagicAPIClient.getMagicCards { (appError, magic) in
            if let appError = appError {
                print(appError)
            } else if let magic = magic {
                print(magic.cards.count)
            }
        }
    }


}

