//
//  ViewController.swift
//  Counter
//
//  Created by Анна Лапухина on 09.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var decButton: UIButton!
    @IBOutlet weak var incButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    private var counter: Int = 0
    private var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH.mm"
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        decButton.layer.borderWidth = 1
        decButton.layer.borderColor = UIColor.black.cgColor
        incButton.layer.borderWidth = 1
        incButton.layer.borderColor = UIColor.black.cgColor
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor.black.cgColor
    }
    //update text for counter
    private func updateValueForButton(_ newValue:Int){
        countLabel.text = "Значение счётчика: " +
            "\(newValue)"
    }
    //add text to the protocol
    private func updateHistory(_ dateTimeOfChange:Date,_ newText:String){
        historyTextView.text += "\n" + formatter.string(from:dateTimeOfChange) + ": " + newText
        let range = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(range)
    }

    @IBAction func incValue(_ sender: UIButton) {
        let dateTimeOfChange = Date()
        counter += 1
        updateValueForButton(counter)
        updateHistory (dateTimeOfChange ,"значение изменено на +1")
    }
    
    @IBAction func decValue(_ sender: UIButton) {
        let dateTimeOfChange = Date()
        if counter == 0 {
            updateHistory (dateTimeOfChange,"попытка уменьшить значение счётчика ниже 0")
        }
        else {
            counter-=1
            updateValueForButton(counter)
            updateHistory (dateTimeOfChange,"значение изменено на -1")
        }
 
    }
    @IBAction func resetCount(_ sender: UIButton) {
        let dateTimeOfChange = Date()
        counter = 0
        updateValueForButton(counter)
        updateHistory (dateTimeOfChange,"значение сброшено")
    }
}

