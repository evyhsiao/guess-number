//
//  ViewController.swift
//  app1
//
//  Created by Evy Hsiao on 2021/11/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var guessText: UITextField!
    @IBOutlet weak var guessResult: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    //建立一個GetTheAnswer類別的物件 名為answer
    var answer = GetTheAnswer()
    
    @IBAction func guessButton(_ sender: UIButton) {
        //每次按下guessButton 會呼叫answer物件中的compareNumber函式 並將該韓式回傳的字串存入resultLabel
        guessResult.text = answer.compareNumber(inputText: guessText.text!)
        guessText.placeholder = "input your guess (1~10)"
        guessText.text = ""
        if answer.isOver == true{
            restartButton.isHidden = false
        }
    }
    @IBAction func restartButton(_ sender: Any) {
        guessText.placeholder = "input your guess (1~10)"
        answer.isOver = false
        answer.guessTimes = 0
        answer.answerNumber = Int(arc4random_uniform(10))+1
        restartButton.isHidden = true
        guessResult.text = ""
    }
    
    override func viewDidLoad() {
        guessText.placeholder = "input your guess (1~10)"
        super.viewDidLoad()
        restartButton.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        
        //讓guessText控制項第一個回應 即可讓鍵盤在城市載入完畢後自動滑出
        guessText.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

