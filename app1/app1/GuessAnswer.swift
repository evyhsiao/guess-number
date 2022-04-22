//
//  GuessAnswer.swift
//  app1
//
//  Created by Evy Hsiao on 2021/11/13.
//

import UIKit

class GetTheAnswer {
    //產生1~100的隨機數
    var answerNumber = Int(arc4random_uniform(10))+1
    
    var maxNumber = 10
    var minNumber = 1
    var guessTimes = 0
    //判斷遊戲是否結束
    var isOver = false
    

    //比較數字的函式 接受一個String的inputText參數 回傳一個String結果
    func compareNumber(inputText:String) -> String {
        guessTimes = guessTimes + 1
        
        //在console視窗中print出答案
        print(answerNumber)
        
        //將使用者的輸入值(字串)轉型成Int
        let inputNumber = Int(inputText)
        
        //遊戲尚未結束的情況
        if isOver == false && guessTimes < 5{
            //inputNumber為空值
            if inputNumber == nil {
                return "Please . Between \(minNumber)~\(maxNumber)"
            }
            else{
                //輸入值為解答 遊戲結束
                if inputNumber == answerNumber {
                    //將isOver變成true
                    isOver = true
                    return "Correct!"
                }
                else{
                    //輸入值超出範圍
                    if inputNumber! > maxNumber || inputNumber! < minNumber {
                        return "Out Of Range . Between \(minNumber)~\(maxNumber)"
                    }
                    else{
                        //輸入值小於答案值 則將輸入值丟給minNumber
                        if inputNumber! < answerNumber{
                            return "Great than  \(inputNumber!)"
                        }
                        //輸入值大於答案值 則將輸入值丟給maxNumber
                        else{
                            return "Less than \(inputNumber!)"
                        }
//                        return "Between \(minNumber)~\(maxNumber)"
                    }
                }
            }
        }
        //遊戲結束的情況
        else if isOver == false && guessTimes == 5{
            //重新將isOver變回false
            isOver = true

            //產生新的隨機整數做為解答
//            answerNumber = Int(arc4random_uniform(10))+1

            //重新賦予最大最小值
//            maxNumber = 100
//            minNumber = 1
            

            return "Fail the game!"
        }
        else{
            return "Please start a new game."
        }
    }
}
