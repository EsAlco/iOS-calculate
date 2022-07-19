//
//  HomeViewController.swift
//  iOS-calculate
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/8/21.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets
    
    // Result
    @IBOutlet weak var resultLabel: UILabel!
    
    // Numbers
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    // Operators
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorSubstraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    // MARK: - Variables
    var total: Double = 0 // Total
    var temp: Double = 0  // Valor por pantalla
    var operating = false // Indicar si se ha seleccionado un operador
    var decimal = false   // Indicar si el valor es decimal
    var operation: OperationType = .none // Operación actual
    
    // MARK: - Constantes
    let kDecimalSeparator = Locale.current.decimalSeparator!  // Separador decimal de cada país
    let kMaxLength = 9  // Máximo número de dígitos que se pueden introducir
    let kTotal = "total"
//    private let kMaxValue: Double = 999999999  // Valor máximo que se admite
//    private let kMinValue: Double = 0.00000001  // Valor minimo que se admite

    enum OperationType {
        case none, addition, substraction, multiplication, division, percent
    }
    
    
    // Formateo de valores auxiliares
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter() // definimos el formateador
        let locale = Locale.current  // definimos el locale del país
        formatter.groupingSeparator = ""  // definimos que el separador de miles, cienmiles... sea vacío
        formatter.decimalSeparator = locale.decimalSeparator  // decimos que el sewparador decimal sea el del país
        formatter.numberStyle = .decimal  // decimos que el estilo del número sea decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumIntegerDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // Formateo de valores auxiliares
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter() // definimos el formateador
        formatter.groupingSeparator = ""  // definimos que el separador de miles, cienmiles... sea vacío
        formatter.decimalSeparator = ""  // no queremos tener en cuenta el separador, sólo el número de dígitos
        formatter.numberStyle = .decimal  // decimos que el estilo del número sea decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumIntegerDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // Formateo de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator // vamos a usar el separador de grupos del país
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal  // el estilo del número es decimal
        formatter.maximumIntegerDigits = 9  // número entero de dígitos máximo 9
        formatter.minimumFractionDigits = 0  // como números decimales minimo tenemos 0 digitos
        formatter.maximumFractionDigits = 8  // como número decimales máximo tenemos 8 dígitos
        return formatter
    }()
    
    // Formateo de valores por pantalla en formato científico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    
    // MARK: - Initialization
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()


        
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)  // Le pedimos que cambie el titulo al correspondiente del país
        
        total = UserDefaults.standard.double(forKey: kTotal)
        
        result()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // UI
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlusMinus.round()
        operatorPercent.round()
        operatorResult.round()
        operatorAddition.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        operatorDivision.round()
    }

    // MARK: - Button Actions
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        
        clear()
        
        sender.shine()  // Le decimos que cuando se pulse brille
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        
        if operation != .percent{
            result()
        }
        operating = true
        operation = .percent
        result()
        
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        
        result()
        
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .addition
        sender.selectOperation(selected: true)
        
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .substraction
        sender.selectOperation(selected: true)
        
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .multiplication
        sender.selectOperation(selected: true)
        
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .division
        sender.selectOperation(selected: true)
        
        sender.shine()
    }

    @IBAction func numberDecimalAction(_ sender: UIButton) {
        
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
            
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true
        
        selectVisualOperation()
        
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        
        operatorAC.setTitle("C", for: .normal)
        
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        // Hemos seleccionado una operación
        if operating {
            total = total == 0 ? temp : total  // Si nuestro total es igual a 0 entonces nuestro total será el temporal, en                                         caso contrario será el total.
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        // Hemos seleccionado decimales
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        selectVisualOperation()
        
        sender.shine()
    }
    
    // Limpia todos los valores
    func clear(){
        operation = .none   // decimos aque no tiene ningún valor
        operatorAC?.setTitle("AC", for: .normal)
        if temp != 0{
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    
    
    // Optiene el resultado final
    func result(){
        
        switch operation {
        case .none:
            // No hacemos nada
            break
        case .addition:
            total += temp
            break
        case .substraction:
            total -= temp
            break
        case .multiplication:
            total *= temp
            break
        case .division:
            total /= temp
            break
        case .percent:
            total = temp / 100
            break
        }
        
        // Formateo en pantalla
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLength{
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        }else{
            resultLabel?.text = printFormatter.string(from: NSNumber (value: total))
        }

        operation = .none
        
        selectVisualOperation()
        
        UserDefaults.standard.set(total, forKey: kTotal)
              
        print("TOTAL:\(total)")
    }
    
    
    // Muestra de forma visual la operación seleccionada
    private func selectVisualOperation() {
        if !operating{
            // No estamos operando
            operatorAddition?.selectOperation(selected: false)
            operatorSubstraction?.selectOperation(selected: false)
            operatorMultiplication?.selectOperation(selected: false)
            operatorDivision?.selectOperation(selected: false)
        }else{
            switch operation {
            case .none, .percent:
                operatorAddition.selectOperation(selected: false)
                operatorSubstraction.selectOperation(selected: false)
                operatorMultiplication.selectOperation(selected: false)
                operatorDivision.selectOperation(selected: false)
                break
            case .addition:
                operatorAddition.selectOperation(selected: true)
                operatorSubstraction.selectOperation(selected: false)
                operatorMultiplication.selectOperation(selected: false)
                operatorDivision.selectOperation(selected: false)
                break
            case .substraction:
                operatorAddition.selectOperation(selected: false)
                operatorSubstraction.selectOperation(selected: true)
                operatorMultiplication.selectOperation(selected: false)
                operatorDivision.selectOperation(selected: false)
                break
            case .multiplication:
                operatorAddition.selectOperation(selected: false)
                operatorSubstraction.selectOperation(selected: false)
                operatorMultiplication.selectOperation(selected: true)
                operatorDivision.selectOperation(selected: false)
                break
            case .division:
                operatorAddition.selectOperation(selected: false)
                operatorSubstraction.selectOperation(selected: false)
                operatorMultiplication.selectOperation(selected: false)
                operatorDivision.selectOperation(selected: true)
                break
            }
        }
    }
    
    
}
