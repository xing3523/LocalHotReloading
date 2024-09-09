//
//  ViewController.swift
//  LocalHotReloadingDemo
//
//  Created by xing on 2024/8/2.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonClick(_ sender: UIButton) {
        let title = "title1"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel))
        present(alert, animated: true)
        sender.setTitle("Change title-[\(title)]，Save and click", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    @objc func injected() {
        changeBgColor()
    }

    func changeBgColor() {
        let red = CGFloat.random(in: 0 ... 1)
        let green = CGFloat.random(in: 0 ... 1)
        let blue = CGFloat.random(in: 0 ... 1)
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
