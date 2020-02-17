//
//  ViewController.swift
//  PrimalityTestApp
//
//  Created by Aoyagi Hiroki on 2020/02/17.
//  Copyright © 2020 Aoyagi Hiroki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func judge(_ sender: Any) {
        //判定buttonの処理
        print("clicked")
        let inputValue = Int(self.textField.text ?? "")!
        print(inputValue)
        
        var isPrime: Bool = true
        if inputValue <= 0 {
            showAlert(title: "Error", message: "正の整数を入力してください")
            return
        }
        if inputValue==1{
            isPrime = false
        }else if inputValue==2 || inputValue==3{
            isPrime = true
        }else{
            for i in 2...Int(sqrt(Double(inputValue))){
                if inputValue % i == 0{
                    isPrime = false
                }
            }
        }
        if isPrime{
            showAlert(title: "結果", message: "\(inputValue)は素数です。")
        }else{
            showAlert(title: "結果", message: "\(inputValue)は素数ではありません。")
        }
        print(isPrime)
        
    }
    
    
    func showAlert(title: String, message: String)  {
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
