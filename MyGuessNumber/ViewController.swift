//
//  ViewController.swift
//  MyGuessNumber
//
//  Created by 江宗益 on 2017/9/8.
//  Copyright © 2017年 江宗益. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var answer = ""
    
    @IBOutlet weak var guess: NSTextField!
    
    @IBOutlet weak var hist: NSTextField!
    
    
    
    @IBAction func doGuess(_ sender: Any) {
        let gvalue = guess.stringValue
        let result = checkAB(guess: guess.stringValue, answer: answer)
        hist.stringValue += gvalue + " => " + result + "\n"
        
        if result == "3A0B" {
        showDilaog(title: "恭喜", mesg: result)
        }else {
            showDilaog(title: "結果", mesg: result)
            guess.stringValue = ""
        }
        
        
    }
    
    
    
    @IBAction func doReset(_ sender: Any) {
        
        
    }
    
    func initGames (){
        answer = createAnswer()
        print(answer)
    }
    
    func showDilaog(title: String, mesg: String) {
        let alert = NSAlert()
        alert.informativeText = title
        alert.messageText = mesg
        alert.alertStyle = NSAlertStyle.informational
        alert.addButton(withTitle: "知道了")
        alert.runModal()
        
    }
    
    
    
    
    func checkAB(guess:String, answer:String) -> String {
        let len = guess.characters.count
        var A = 0, B = 0
        for i in 0..<len {
            let gchar = mysubstrv2(source: guess, from: i, to: i+1)
            let achar = mysubstrv2(source: answer, from: i, to: i+1)
            if gchar == achar {
                A += 1
            }else if answer.contains(gchar) {
                B += 1
            }
        }
        
        
        return "\(A)A\(B)B"
    }
    
    
    func mysubstrv2(source:String,from:Int, to:Int) -> String {
        let cs = Array(source.characters)
        var ret = ""
        for i in from..<to {
            ret += String(cs[i])
        }
        return ret
    }
    

    
    
    
    
    
    
    
    
    func createAnswer() -> String {
        var num = Array(0 ... 9)
        num = shullfe(source: Array(num))
        var ret = ""
        for v in 0 ... 2 {
            ret += String(num[v])
        }
        return ret
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func shullfe(source:Array<Int>) -> Array<Int> {
        var poker = source
        let n = poker.count
        var rand = -1
        var temp = -1
        var max = -1
        for i in 0 ..< n {
            max = n - i
            rand = Int(arc4random_uniform(UInt32(max)))
            temp = poker[rand]
            poker[rand] = poker[max-1]
            poker[max-1] = temp
        }
        return poker
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       initGames()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

