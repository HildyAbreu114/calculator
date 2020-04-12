//
//  CalculatorViewController.swift
//  practiceCalculator
//
//  Created by hildy abreu on 4/8/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: VARIABLES
    
    var currentNumber: Int = 0
    var initialNumber: Int = 0
    var answer: Int = 0
    var operation = 0
//    let operation = ["\", "*", "-", "+", "="]
    
    //MARK: UI OBJECTS
    
    lazy var calculationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont (name: "Helvetica", size: 65)
        label.textColor = #colorLiteral(red: 0.7103883028, green: 0.7257936597, blue: 0.9296966195, alpha: 1)
        label.text = "0"
        label.textAlignment = .right
        label.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return label
    }()
    
    lazy var clearButton: UIButton = {
        let clear = UIButton()
        clear.setTitle("C",for: .normal)
        clear.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
        clear.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        clear.titleLabel?.textAlignment = .center
        clear.backgroundColor = #colorLiteral(red: 0.7103882432, green: 0.7257937193, blue: 0.9296966195, alpha: 1)
        clear.layer.cornerRadius = 20
        clear.addTarget(self, action: #selector(clearButtonTapped),for:.touchUpInside)
        return clear
    }()
    
    lazy var percentageButton: UIButton = {
        let percent = UIButton()
         percent.setTitle("%",for: .normal)
         percent.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         percent.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
         percent.titleLabel?.textAlignment = .center
         percent.backgroundColor = #colorLiteral(red: 0.7103883028, green: 0.7257936597, blue: 0.9296966195, alpha: 1)
         percent.layer.cornerRadius = 20
        //        percent.addTarget(self, action: #selector(operationButtonTapped),for:.touchUpInside)
        return percent
    }()
    
    lazy var decimalButton: UIButton = {
        let decimal = UIButton()
         decimal.setTitle(".",for: .normal)
         decimal.titleLabel?.font = UIFont (name: "Helvetica-bold", size: 30 )
         decimal.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
         decimal.titleLabel?.textAlignment = .center
         decimal.backgroundColor = #colorLiteral(red: 0.7056544423, green: 0.7259488702, blue: 0.9297499061, alpha: 1)
         decimal.layer.cornerRadius = 20
        //        decimal.addTarget(self, action: #selector(DecimalButtonTapped),for:.touchUpInside)
        return decimal
    }()
    
    lazy var divisionButton: UIButton = {
        let division = UIButton()
         division.setTitle("÷",for: .normal)
         division.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         division.setTitleColor(#colorLiteral(red: 0.7009131908, green: 0.7261030078, blue: 0.9298027158, alpha: 1), for: .normal)
         division.titleLabel?.textAlignment = .center
         division.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
         division.layer.cornerRadius = 20
         division.tag = 11
         division.addTarget(self, action: #selector(divisionButtonTapped),for:.touchUpInside)
        return division
    }()
    
    lazy var multiplicationButton: UIButton = {
        let multiply = UIButton()
         multiply.setTitle("x",for: .normal)
         multiply.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         multiply.setTitleColor(#colorLiteral(red: 0.7009131908, green: 0.7261030078, blue: 0.9298027158, alpha: 1), for: .normal)
         multiply.titleLabel?.textAlignment = .center
         multiply.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
         multiply.layer.cornerRadius = 20
         multiply.tag = 12
         multiply.addTarget(self, action: #selector(multiplicationButtonTapped),for:.touchUpInside)
        return multiply
    }()

    lazy var subtractionButton: UIButton = {
        let subtract = UIButton()
         subtract.setTitle("-",for: .normal)
         subtract.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         subtract.setTitleColor(#colorLiteral(red: 0.7009131908, green: 0.7261030078, blue: 0.9298027158, alpha: 1), for: .normal)
         subtract.titleLabel?.textAlignment = .center
         subtract.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
         subtract.layer.cornerRadius = 20
         subtract.tag = 13
         subtract.addTarget(self, action: #selector(subtractionButtonTapped),for:.touchUpInside)
        return subtract
    }()
    
    lazy var additionButton: UIButton = {
        let add = UIButton()
         add.setTitle("+",for: .normal)
         add.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         add.setTitleColor(#colorLiteral(red: 0.7010328174, green: 0.7259935737, blue: 0.9340150952, alpha: 1), for: .normal)
         add.titleLabel?.textAlignment = .center
         add.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
         add.layer.cornerRadius = 20
         add.tag = 14
         add.addTarget(self, action: #selector(additionButtonTapped),for:.touchUpInside)
        return add
    }()
    
    lazy var equalButton: UIButton = {
        let equal = UIButton()
         equal.setTitle("=",for: .normal)
         equal.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         equal.setTitleColor(#colorLiteral(red: 0.7010328174, green: 0.7259935737, blue: 0.9340150952, alpha: 1), for: .normal)
         equal.titleLabel?.textAlignment = .center
         equal.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
         equal.layer.cornerRadius = 20
         equal.tag = 15
         equal.addTarget(self, action: #selector(equalButtonTapped),for:.touchUpInside)
        return equal
    }()
    
    lazy var numZeroButton: UIButton = {
        let zero = UIButton()
         zero.setTitle("0",for: .normal)
         zero.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         zero.setTitleColor(#colorLiteral(red: 0.7010328174, green: 0.7259935737, blue: 0.9340150952, alpha: 1), for: .normal)
         zero.titleLabel?.textAlignment = .left
         zero.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         zero.layer.cornerRadius = 20
         zero.tag = 1
         zero.addTarget(self, action: #selector(numButtonTapped),for:.touchUpInside)
        return zero
    }()

    lazy var numOneButton: UIButton = {
        let one = UIButton()
         one.setTitle("1",for: .normal)
         one.titleLabel?.font = UIFont (name: "Helvetica", size: 30)
         one.setTitleColor(#colorLiteral(red: 0.7011529803, green: 0.7258835435, blue: 0.9382262826, alpha: 1), for: .normal)
         one.titleLabel?.textAlignment = .center
         one.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         one.layer.cornerRadius = 20
         one.tag = 2
         one.addTarget(self, action: #selector(numButtonTapped),for:.touchUpInside)
        return one
    }()
    
    lazy var numTwoButton: UIButton = {
        let two = UIButton()
         two.setTitle("2",for: .normal)
         two.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         two.setTitleColor(#colorLiteral(red: 0.7012736797, green: 0.7257727981, blue: 0.9424360991, alpha: 1), for: .normal)
         two.titleLabel?.textAlignment = .center
         two.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         two.layer.cornerRadius = 20
         two.tag = 3
         two.addTarget(self, action: #selector(numButtonTapped),for:.touchUpInside)
        return two
    }()
    
    lazy var numThreeButton: UIButton = {
        let three = UIButton()
         three.setTitle("3",for: .normal)
         three.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         three.setTitleColor(#colorLiteral(red: 0.696528554, green: 0.7259258032, blue: 0.9424875975, alpha: 1), for: .normal)
         three.titleLabel?.textAlignment = .center
         three.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         three.layer.cornerRadius = 20
         three.tag = 4
         three.addTarget(self, action: #selector(numButtonTapped),for:.touchUpInside)
        return three
    }()
    
    lazy var numFourButton: UIButton = {
        let four = UIButton()
         four.setTitle("4",for: .normal)
         four.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         four.setTitleColor(#colorLiteral(red: 0.696528554, green: 0.7259258032, blue: 0.9424875975, alpha: 1), for: .normal)
         four.titleLabel?.textAlignment = .center
         four.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         four.layer.cornerRadius = 20
         four.tag = 5
         four.addTarget(self, action: #selector(numButtonTapped),for:.touchUpInside)
        return four
    }()
    
    lazy var numFiveButton: UIButton = {
        let five = UIButton()
         five.setTitle("5",for: .normal)
         five.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         five.setTitleColor(#colorLiteral(red: 0.696528554, green: 0.7259258032, blue: 0.9424875975, alpha: 1), for: .normal)
         five.titleLabel?.textAlignment = .center
         five.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         five.layer.cornerRadius = 20
         five.tag = 6
         five.addTarget(self, action: #selector(numButtonTapped),for:.touchUpInside)
        return five
    }()
    
    lazy var numSixButton: UIButton = {
        let six = UIButton()
         six.setTitle("6",for: .normal)
         six.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         six.setTitleColor(#colorLiteral(red: 0.696528554, green: 0.7259258032, blue: 0.9424875975, alpha: 1), for: .normal)
         six.titleLabel?.textAlignment = .center
         six.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         six.layer.cornerRadius = 20
         six.tag = 7
         six.addTarget(self, action: #selector(numButtonTapped),for:.touchUpInside)
        return six
    }()
    
    lazy var numSevenButton: UIButton = {
        let seven = UIButton()
         seven.setTitle("7",for: .normal)
         seven.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         seven.setTitleColor(#colorLiteral(red: 0.696528554, green: 0.7259258032, blue: 0.9424875975, alpha: 1), for: .normal)
         seven.titleLabel?.textAlignment = .center
         seven.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         seven.layer.cornerRadius = 20
         seven.tag = 8
         seven.addTarget(self, action: #selector(numButtonTapped),for:.touchUpInside)
        return seven
    }()
    
    lazy var numEightButton: UIButton = {
        let eight = UIButton()
         eight.setTitle("8",for: .normal)
         eight.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         eight.setTitleColor(#colorLiteral(red: 0.6917760372, green: 0.7260776162, blue: 0.9425387979, alpha: 1), for: .normal)
         eight.titleLabel?.textAlignment = .center
         eight.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         eight.layer.cornerRadius = 20
         eight.tag = 9
         eight.addTarget(self, action: #selector(numButtonTapped),for:.touchUpInside)
        return eight
    }()
    
    lazy var numNineButton: UIButton = {
        let nine = UIButton()
         nine.setTitle("9",for: .normal)
         nine.titleLabel?.font = UIFont (name: "Helvetica", size: 30 )
         nine.setTitleColor(#colorLiteral(red: 0.6918995976, green: 0.7259662747, blue: 0.9467467666, alpha: 1), for: .normal)
         nine.titleLabel?.textAlignment = .center
         nine.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         nine.layer.cornerRadius = 20
         nine.tag = 10
         nine.addTarget(self, action: #selector(numButtonTapped),for:.touchUpInside)
        return nine
    }()

    

//MARK: LIFECYLCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        view.backgroundColor = .tertiaryLabel
    }
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
        calculationLabelConstraint()
        clearButtonConstraint()
        percentageButtonConstraint()
        divisionButtonConstraint()
        multiplicationButtonConstraint()
        numNineButtonConstraint()
        numEightButtonConstraint()
        numSevenButtonConstraint()
        numFourButtonConstraint()
        numFiveButtonConstraint()
        numSixButtonConstraint()
        subtractionButtonConstraint()
        additionButtonConstraint()
        numThreeButtonConstraint()
        numTwoButtonConstraint()
        numOneButtonConstraint()
        numZeroButtonConstraint()
        decimalButtonConstraint()
        equalButtonConstraint()
    }
    
    //MARK: OBJC FUNCTIONS
    
    @objc func clearButtonTapped(sender: UIButton) {
        calculationLabel.text = "0"
    }
    
    @objc func numButtonTapped(sender:UIButton) {
        let tag = sender.tag-1
        if calculationLabel.text == "0" {
            calculationLabel.text = "\(tag)"
        }else if
            let text = calculationLabel.text {
            calculationLabel.text = "\(text)\(tag)"
            }
        print (sender.tag)
        }
    
    @objc func divisionButtonTapped(sender:UIButton) {
        calculationLabel.text = "÷"
        if sender.tag == 11 {

            if let text = calculationLabel.text, let value = Int(text), initialNumber == 0 {
            initialNumber = value
            }
          
            if let text = calculationLabel.text, let value = Int(text), currentNumber == 0 {
            currentNumber = value
            }
//        let operation = initialNumber ÷ currentNumber

//                    calculationLabel.text = "\(initialNumber)÷\(currentNumber)"
         
        }
    }
    
    @objc func multiplicationButtonTapped(sender:UIButton) {
        calculationLabel.text = "x"
        if sender.tag == 12 {
//            calculationLabel.text = "\(initialNumber)x\(currentNumber)"
            
              if let text = calculationLabel.text, let value = Int(text), initialNumber == 0 {
              initialNumber = value
              }
            
              if let text = calculationLabel.text, let value = Int(text), currentNumber == 0 {
              currentNumber = value
              }
        }
    }
    
    @objc func subtractionButtonTapped(sender:UIButton) {
        calculationLabel.text = "-"
        if sender.tag == 13 {
//            calculationLabel.text = "\(initialNumber)-\(currentNumber)"
            
            if let text = calculationLabel.text, let value = Int(text), initialNumber == 0 {
              initialNumber = value
              }
            
              if let text = calculationLabel.text, let value = Int(text), currentNumber == 0 {
              currentNumber = value
              }
        }
    }
    
    @objc func additionButtonTapped(sender:UIButton) {
        calculationLabel.text = "+"
        if sender.tag == 14 {
//            calculationLabel.text = "\(initialNumber)+\(currentNumber)"
            
            if let text = calculationLabel.text, let value = Int(text), initialNumber == 0 {
              initialNumber = value
              }
            
              if let text = calculationLabel.text, let value = Int(text), currentNumber == 0 {
              currentNumber = value
              }
        }
    }
    
    @objc func equalButtonTapped(sender:UIButton) {
        calculationLabel.text = "="
        if sender.tag == 15 {
        operation = sender.tag
        }
       
        if operation == 11 {
                    answer = initialNumber / currentNumber
            calculationLabel.text = "\(answer)"
        }
        if operation == 12 {
            answer = initialNumber * currentNumber
            calculationLabel.text = "\(answer)"

        }
        if operation == 13 {
           answer = initialNumber - currentNumber
            calculationLabel.text = "\(answer)"

        }
        if operation == 14 {
            answer = initialNumber + currentNumber
            calculationLabel.text = "\(answer)"

        }
    }
        
    
    
    //MARK:FUNCTIONS
    
    private func addSubview() {
        view.addSubview(calculationLabel)
        view.addSubview(clearButton)
        view.addSubview(percentageButton)
        view.addSubview(divisionButton)
        view.addSubview(multiplicationButton)
        view.addSubview(numNineButton)
        view.addSubview(numEightButton)
        view.addSubview(numSevenButton)
        view.addSubview(numFourButton)
        view.addSubview(numFiveButton)
        view.addSubview(numSixButton)
        view.addSubview(subtractionButton)
        view.addSubview(additionButton)
        view.addSubview(numThreeButton)
        view.addSubview(numTwoButton)
        view.addSubview(numOneButton)
        view.addSubview(numZeroButton)
        view.addSubview(decimalButton)
        view.addSubview(equalButton)
    }
    
    //MARK: CONSTRAINTS
    
    func calculationLabelConstraint() {
        calculationLabel.translatesAutoresizingMaskIntoConstraints = false
               
               NSLayoutConstraint.activate(
                   [calculationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
                    calculationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
                    calculationLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -550 ),
                    calculationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)])
               }
    
    func clearButtonConstraint() {
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [clearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -220),
             clearButton.topAnchor.constraint(equalTo: calculationLabel.bottomAnchor,constant: 25),
             clearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450 ),
             clearButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)])
        }
    
    func percentageButtonConstraint() {
        percentageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [percentageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -125),
             percentageButton.topAnchor.constraint(equalTo: calculationLabel.bottomAnchor,constant: 25),
             percentageButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450 ),
             percentageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 215)])
    }
    
    func divisionButtonConstraint () {
        divisionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [divisionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
             divisionButton.topAnchor.constraint(equalTo: calculationLabel.bottomAnchor,constant: 25),
             divisionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450 ),
             divisionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 315)])
    }
    
    func multiplicationButtonConstraint(){
        multiplicationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [multiplicationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
             multiplicationButton.topAnchor.constraint(equalTo: divisionButton.bottomAnchor,constant: 25),
             multiplicationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350 ),
             multiplicationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 315)])
    }
    
    func numNineButtonConstraint() {
        numNineButton.translatesAutoresizingMaskIntoConstraints = false
               
               NSLayoutConstraint.activate(
                   [numNineButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -125),
                    numNineButton.topAnchor.constraint(equalTo: percentageButton.bottomAnchor,constant: 25),
                    numNineButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350 ),
                    numNineButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 215)])
    }
    
    func numEightButtonConstraint() {
        numEightButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [numEightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -220),
             numEightButton.topAnchor.constraint(equalTo: calculationLabel.bottomAnchor,constant: 125),
             numEightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350 ),
             numEightButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120)])
    }
    
    func numSevenButtonConstraint(){
        numSevenButton.translatesAutoresizingMaskIntoConstraints = false
                      
            NSLayoutConstraint.activate(
            [numSevenButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -315),
            numSevenButton.topAnchor.constraint(equalTo: clearButton.bottomAnchor,constant: 25),
            numSevenButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350 ),
            numSevenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)])
    }
    
    func numFourButtonConstraint() {
        numFourButton.translatesAutoresizingMaskIntoConstraints = false
                  
        NSLayoutConstraint.activate(
        [numFourButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -315),
        numFourButton.topAnchor.constraint(equalTo: numSevenButton.bottomAnchor,constant: 25),
        numFourButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250 ),
        numFourButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)])
    }
    
    func numFiveButtonConstraint() {
        numFiveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [numFiveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -220),
             numFiveButton.topAnchor.constraint(equalTo: numEightButton.bottomAnchor,constant: 25),
             numFiveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250 ),
             numFiveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120)])
    }
    
    func numSixButtonConstraint() {
        numSixButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [numSixButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -125),
             numSixButton.topAnchor.constraint(equalTo: numNineButton.bottomAnchor,constant: 25),
             numSixButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250 ),
             numSixButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 215)])
    }
    
    func subtractionButtonConstraint() {
        subtractionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [subtractionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
             subtractionButton.topAnchor.constraint(equalTo: multiplicationButton.bottomAnchor,constant: 25),
             subtractionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250 ),
             subtractionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 315)])
    }

    func additionButtonConstraint() {
        additionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [additionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
             additionButton.topAnchor.constraint(equalTo: subtractionButton.bottomAnchor,constant: 25),
             additionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150 ),
             additionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 315)])
    }
    
    func numThreeButtonConstraint() {
        numThreeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [numThreeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -125),
             numThreeButton.topAnchor.constraint(equalTo: numSixButton.bottomAnchor,constant: 25),
             numThreeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150 ),
             numThreeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 215)])
    }
    
    func numTwoButtonConstraint() {
        numTwoButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [numTwoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -220),
             numTwoButton.topAnchor.constraint(equalTo: numFiveButton.bottomAnchor,constant: 25),
             numTwoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150 ),
             numTwoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120)])
    }
    
    func numOneButtonConstraint() {
        numOneButton.translatesAutoresizingMaskIntoConstraints = false
                  
        NSLayoutConstraint.activate(
        [numOneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -315),
        numOneButton.topAnchor.constraint(equalTo: numFourButton.bottomAnchor,constant: 25),
        numOneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150 ),
        numOneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)])
    }

    func numZeroButtonConstraint() {
        numZeroButton.translatesAutoresizingMaskIntoConstraints = false
                  
        NSLayoutConstraint.activate(
        [numZeroButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -220),
        numZeroButton.topAnchor.constraint(equalTo: numOneButton.bottomAnchor,constant: 25),
        numZeroButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 ),
        numZeroButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)])
    }
    
    func decimalButtonConstraint() {
        decimalButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [decimalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -125),
             decimalButton.topAnchor.constraint(equalTo: numThreeButton.bottomAnchor,constant: 25),
             decimalButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 ),
             decimalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 215)])
    }

    func equalButtonConstraint() {
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [equalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
             equalButton.topAnchor.constraint(equalTo: additionButton.bottomAnchor,constant: 25),
             equalButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 ),
             equalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 315)])
    }

}
        
 
    


   


