//
//  StatisticViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 05.01.2022.
//

import UIKit
import Charts

class StatisticViewController: UIViewController {
    
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributString = NSMutableAttributedString(string: "Statistic", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36.0)])
        label.attributedText = attributString
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let barChart = PieChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        barChart.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainLabel)
        
        barChart.delegate = self
        barChart.holeRadiusPercent = 0.5
        
        var entries = [PieChartDataEntry]()
        var arrOfPayments = [Payment]()
        for value in OneAndOnlyUser.shared.user.methodsOfPayment! {
            guard let payments = value.payments else {return}
            for payment in payments {
                arrOfPayments.append(payment)
            }
        }
        if arrOfPayments.count < 1 {
            entries.append(PieChartDataEntry(value: 1))
            
        } else {
            for value in Categories.shared.categories {
                var sumOfPayments = 0.0
                for number in value.payments {
                    sumOfPayments += number.sum
                }
                if sumOfPayments > 0 {
                    entries.append(PieChartDataEntry(value: Double(sumOfPayments), label: value.name, data: value.name as AnyObject?))
                }
                
            }
        }
        var sum = 0.0
        for value in arrOfPayments {
            sum += value.sum
        }
        let text = "Итого: \(sum)p"
        
        //        let attTextForCenterOfChart = NSMutableAttributedString(string: "\(sum)", attributes: [.foregroundColor:UIColor.red.cgColor, .font: UIFont.systemFont(ofSize: 30)])
        barChart.centerText = text
        
        //        for x in 1..<10 {
        //            entries.append(PieChartDataEntry(value: Double(x), label: "\(x) value"))
        //        }
        let set = PieChartDataSet(entries: entries, label: "Categories")
        set.colors = ChartColorTemplates.pastel()
        let datat = PieChartData(dataSet: set)
        barChart.data = datat
        view.addSubview(barChart)
        
        NSLayoutConstraint.activate([
            barChart.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            barChart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            barChart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            barChart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        ])
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension StatisticViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let cat = entry.data as? Categ.RawValue else {return}
        switch cat {
        case "Car": self.barChart.centerText = "Car: \(entry.y)p"
        case "Gifts": self.barChart.centerText = "Gifts: \(entry.y)p"
        case "Food": self.barChart.centerText = "Food: \(entry.y)p"
        case "Coffe": self.barChart.centerText = "Coffe: \(entry.y)p"
        case "Clothes": self.barChart.centerText = "Clothes: \(entry.y)p"
        case "Cosmetic": self.barChart.centerText = "Cosmetic: \(entry.y)p"
        case "Entertainment": self.barChart.centerText = "Entertainment: \(entry.y)p"
        case "Fitness": self.barChart.centerText = "Fitness: \(entry.y)p"
        case "Hotel": self.barChart.centerText = "Hotel: \(entry.y)p"
        case "House": self.barChart.centerText = "House: \(entry.y)p"
        case "Medical": self.barChart.centerText = "Medical: \(entry.y)p"
        case "People": self.barChart.centerText = "People: \(entry.y)p"
        case "Phone": self.barChart.centerText = "Phone: \(entry.y)p"
        case "Pill": self.barChart.centerText = "Pill: \(entry.y)p"
        case "Plane": self.barChart.centerText = "Plane: \(entry.y)p"
        case "Saving": self.barChart.centerText = "Saving: \(entry.y)p"
        case "Shopping": self.barChart.centerText = "Shopping: \(entry.y)p"
        case "Taxi": self.barChart.centerText = "Taxi: \(entry.y)p"
        case "Transport": self.barChart.centerText = "Transport: \(entry.y)p"
        default: print("error")
        }
    }
    
}
