//
//  CategorieViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 11.10.2021.
//

import UIKit

class CategorieViewController: UIViewController {
    
    lazy var tf = PaymentTextField(categorieOfPayment: categorie, deleteButton: deleteButton)
    let deleteButton = UIButton()
    var categorie: Categorie
    let dateLabel: UILabel = {
        let label = UILabel()
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "\(dateFormatter.string(from: today))"
        return label
    }()
    
    let keyNoteLabel = TextFieldView()
//    let keyNoteLabel: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Write some keynote"
//        textField.translatesAutoresizingMaskIntoConstraints = false
//
//        return textField
//    }()
    
    private var numInLabel: Double = 0 {
        didSet {
            if tf.categorieTextField.text == "0" {
                var text = String(numInLabel)
                text.removeLast()
                text.removeLast()
                tf.categorieTextField.text = text
            } else {
                guard let str = tf.categorieTextField.text else {return}
                var newStr = str + String(numInLabel)
                newStr.removeLast()
                newStr.removeLast()
                tf.categorieTextField.text = newStr
            }
        }
    }
    
    var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add!", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        button.layer.cornerRadius = 5
        
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray2
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        button.frame.size = CGSize(width: 50, height: 50)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(addPayment), for: .touchUpInside)
        return button
    }()
    
    var dotButton: UIButton = {
        let button = UIButton()
        button.setTitle(".", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        button.layer.cornerRadius = 5
        button.setBackgroundColor(.black, forState: .highlighted)
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray2
        button.layer.borderWidth = 0.2
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        
        button.setTitleColor(.black, for: .highlighted)
        button.layer.borderColor = UIColor.black.cgColor
        button.frame.size = CGSize(width: 50, height: 50)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(addDotToNumb), for: .touchUpInside)
        return button
    }()
    
    lazy var numButtons = createNumButtons()
    lazy var signButtons = createSignButtons()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.addSubview(dateLabel)
        
        
        self.view.addSubview(keyNoteLabel)
        self.keyNoteLabel.translatesAutoresizingMaskIntoConstraints = false
        self.keyNoteLabel.imageName = "pen4"
        self.keyNoteLabel.placeHolder = "Write some keynote..."
        
        
        self.view.addSubview(tf)
        self.view.addSubview(dotButton)
        //OneAndOnlyUser.shared.user.methodsOfPayment!.append(PaymentMethod(nameOfImage: "card", nameOfMethod: "carrrr"))
        
        let stackView1 = UIStackView(arrangedSubviews: [numButtons[0],numButtons[1],numButtons[2], signButtons[0]])
        let stackView2 = UIStackView(arrangedSubviews: [numButtons[3],numButtons[4],numButtons[5], signButtons[1]])
        let stackView3 = UIStackView(arrangedSubviews: [numButtons[6],numButtons[7],numButtons[8], signButtons[2]])
        let stackView4 = UIStackView(arrangedSubviews: [dotButton, numButtons[9], signButtons[4], signButtons[5]])
        let stackView5 = UIStackView(arrangedSubviews: [addButton])

        let stackViews = [stackView1, stackView2, stackView3, stackView4, stackView5]
        let newStack = configureStackView(stackViews, self.view)
        newStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(newStack)
        
        
        
        tf.translatesAutoresizingMaskIntoConstraints = false

        self.view.backgroundColor = .white
        createConstraintsForCategorieVC(newStack, dateLabel, tf)
        deleteButton.addTarget(self, action: #selector(deleteNumFromTextField), for: .touchUpInside)
    }
    
    func createSignButtons() -> [UIButton] {
        var buttons = [UIButton]()
        let titleOfButtons = ["+","−","×",".","=","÷"]
        for i in 0..<titleOfButtons.count {
            let button = UIButton()
            button.setTitle(titleOfButtons[i], for: .normal)
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
            button.layer.cornerRadius = 5
            //button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .systemOrange
            button.frame.size = CGSize(width: 50, height: 50)
            button.setTitleColor(.white, for: .normal)
            button.layer.borderWidth = 0.2
            button.layer.borderColor = UIColor.black.cgColor
            button.addTarget(self, action: #selector(chooseSignButton(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        return buttons
    }
    
    func createNumButtons() -> [UIButton] {
        var buttons = [UIButton]()
        let titleOfButtons = ["1","2","3","4","5","6","7","8","9","0"]
        for num in 0..<titleOfButtons.count {
            let button = UIButton()
            button.setTitle(titleOfButtons[num], for: .normal)
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
            button.layer.cornerRadius = 5
            //button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .systemGray2
            button.layer.borderWidth = 0.2
            button.layer.borderColor = UIColor.black.cgColor
            button.frame.size = CGSize(width: 50, height: 50)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(changeNumLabel), for: .touchUpInside)
            buttons.append(button)
            
        }
        return buttons
    }
    
    func configureStackView(_ stackView: [UIStackView], _ view: UIView) -> UIStackView {

        for i in stackView.indices {
            stackView[i].frame.size = CGSize(width: Int(view.frame.width) - 20, height: 50)
            stackView[i].spacing = 5
            stackView[i].axis = .horizontal
            stackView[i].alignment = .fill
            stackView[i].distribution = .fillEqually
        }
        
        let stack = UIStackView(arrangedSubviews: stackView)
        stack.spacing = 5
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
        
    }
    
    @objc
    func addPayment() {
        if let check = CheckArr.shared.array.last {
            self.categorie.payments.append(Payment(sum: Double(self.tf.categorieTextField.text!) ?? 0, date: Date(), keyNote: "", categorieOfPayment: self.categorie))
            OneAndOnlyUser.shared.user.methodsOfPayment![check].payments?.append(Payment(sum: Double(self.tf.categorieTextField.text!) ?? 0, date: Date(), keyNote: "\(self.keyNoteLabel.inputTextField.text ?? "")", categorieOfPayment: self.categorie))
            print(self.categorie.payments)
            print(CheckArr.shared.array.last!)
        }
        
    }
    
    @objc
    func addDotToNumb() {
        if self.tf.categorieTextField.text?.contains(".") == true {
            return
        } else {
            self.tf.categorieTextField.text! += "."
        }
    }
    
    @objc
    func changeNumLabel(_ sender: UIButton) {
        numInLabel = Double(sender.titleLabel?.text ?? "") ?? 0
       // self.categorie.payments?.append(Payment(sum: <#T##Double#>, date: <#T##Date#>, keyNote: <#T##String?#>))
    }
    
    @objc
    func chooseSignButton(_ sender: UIButton) {
        signButtons.forEach {$0.isSelected = false}
        signButtons.forEach { $0.backgroundColor = .systemOrange}
        signButtons.forEach { $0.setTitleColor(.white, for: .normal)}
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true {
            sender.backgroundColor = .white
            sender.setTitleColor(.black, for: .normal)
        } else {
            sender.backgroundColor = .systemOrange
            sender.setTitleColor(.white, for: .normal)
        }
    }
    //MARK: - Delete number from label
    @objc
    func deleteNumFromTextField() {
        if tf.categorieTextField.text?.count == 1 {
            tf.categorieTextField.text = "0"
        } else {
            tf.categorieTextField.text?.removeLast()
        }
    }
    
    init(categorie: Categorie) {
        self.categorie = categorie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CategorieViewController {
    //MARK: - Set constraints for views
    func createConstraintsForCategorieVC (_ newStack: UIStackView, _ dateLabel: UILabel, _ tf: PaymentTextField ) {
        NSLayoutConstraint.activate([
            newStack.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 2),
            newStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateLabel.heightAnchor.constraint(equalToConstant: 70)
//            dateLabel.bottomAnchor.constraint(equalTo: newStack.topAnchor, constant: 250)
        ])
        
        NSLayoutConstraint.activate([
            tf.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 40),
            tf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            tf.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            tf.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        NSLayoutConstraint.activate([
            keyNoteLabel.topAnchor.constraint(equalTo: tf.bottomAnchor, constant: 15),
            keyNoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            keyNoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            keyNoteLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        
        
    }
}
extension UIButton {
  func setBackgroundColor(_ color: UIColor, forState controlState: UIControl.State) {
    let colorImage = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image { _ in
      color.setFill()
      UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 1)).fill()
    }
    setBackgroundImage(colorImage, for: controlState)
  }
}

