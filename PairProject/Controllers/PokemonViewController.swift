//
//  PokemonViewController.swift
//  PairProject
//
//  Created by Jane Zhu on 1/9/19.
//  Copyright © 2019 JaneZhu. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        PokemonAPIClient.getPokemonCards { (appError, pokemon) in
            if let appError = appError {
                print(appError)
            } else if let pokemon = pokemon {
                print(pokemon.cards.count)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
