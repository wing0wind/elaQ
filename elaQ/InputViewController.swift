//
//  InputViewController.swift
//  elaQ
//
//  Created by ビ ユウ on 2018/11/11.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextView.layer.borderWidth = 1
        inputTextView.layer.cornerRadius = 6
        
        // 仮のサイズでツールバー生成
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        kbToolBar.barStyle = UIBarStyle.default  // スタイルを設定
        
        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
        
        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(InputViewController.commitButtonTapped))
        kbToolBar.items = [spacer, commitButton]
        
        inputTextView.inputAccessoryView = kbToolBar
    }
    
    @objc func commitButtonTapped() {
        inputTextView.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        inputTextView.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        titleField.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }

    @IBAction func submitButtonAction(_ sender: Any) {
        let title = titleField.text ?? "No title"
        let detail = inputTextView.text ?? "No detail"
        NetWorkUtil.testPostArticle(title: title, detail: detail, completion: {result in
            self.postSuccess(result: result)
        })
    }
    
    func postSuccess(result: postResult) {
        //save token
        let userDef = UserDefaults.standard
        var aList = userDef.object(forKey: NetWorkUtil.USERDEF_ARTICLE_LIST_ID_KEY) as! [String]
        aList.append(result.result)
        userDef.setValue(aList, forKey: NetWorkUtil.USERDEF_ARTICLE_LIST_ID_KEY)
        print(aList)
        userDef.synchronize()
        
        navigationController?.popViewController(animated: true)
    }

}
