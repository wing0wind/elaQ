//
//  InputViewController.swift
//  elaQ
//
//  Created by ビ ユウ on 2018/11/11.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextView.layer.borderWidth = 1
        inputTextView.layer.cornerRadius = 6
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }

    @IBAction func submitButtonAction(_ sender: Any) {
        
    }

}
