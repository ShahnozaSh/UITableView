//
//  FinanceViewController.swift
//  UITableView
//
//  Created by Shahnoza on 19/2/22.
//

import UIKit
import Foundation

class FinanceViewController: UIViewController {
    
    var finance = [Finance]()
    
    private lazy var balanceLabel:UILabel = {
        let balance = UILabel()
        balance.text = "Баланс"
        balance.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        view.addSubview(balance)
        
        balance.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.centerX.equalToSuperview()
        }
        return balance
    }()
    
    private lazy var cashLabel: UILabel = {
        let cash = UILabel()
        cash.text = "$1300.78"
        cash.font = UIFont.systemFont(ofSize:  44, weight: .regular)
        
        view.addSubview(cash)
        
        cash.snp.makeConstraints{
            $0.top.equalTo(balanceLabel.snp.top).inset(20)
            $0.centerX.equalToSuperview()
        }
        return cash
    }()
    
    private lazy var monthLabel: UILabel = {
        let month = UILabel()
        month.text = " Май 2020"
        month.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        
        view.addSubview(month)
        
        month.snp.makeConstraints {
            $0.top.equalTo(cashLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        return month
    }()
    
    private lazy var showAllButton: UIButton = {
        let showAll = UIButton()
        showAll.setTitle("Cм. ещё", for: .normal)
        showAll.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        showAll.setTitleColor(UIColor.black, for: .normal)
        
        view.addSubview(showAll)
        showAll.addTarget(self, action: #selector(showAllFinance), for: .touchUpInside)
        
        showAll.snp.makeConstraints {
            $0.bottom.greaterThanOrEqualTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalToSuperview()
        }
        return showAll
    }()
    
    private lazy var rightChevron: UIImageView = {
        let rightAngle = UIImageView()
        
        rightAngle.image = UIImage(systemName: "chevron.right")
        rightAngle.tintColor = UIColor.black
        
        view.addSubview(rightAngle)
        
        rightAngle.snp.makeConstraints {
            $0.centerY.equalTo(monthLabel.snp.centerY)
            $0.right.equalTo(view.safeAreaLayoutGuide).inset(60)
        }
        return rightAngle
    }()
    
    private lazy var lefrChevron: UIImageView = {
         let leftAngle = UIImageView()
         leftAngle.tintColor = UIColor.black
         leftAngle.image = UIImage(systemName: "chevron.left")
         
         view.addSubview(leftAngle)

         leftAngle.snp.makeConstraints {
             $0.centerY.equalTo(monthLabel.snp.centerY)
             $0.left.equalTo(view.safeAreaLayoutGuide).inset(60)
         }
         return leftAngle
     }()
    
    private lazy var windowTableView: UITableView = {
          let window = UITableView()
        window.backgroundColor = UIColor.white
        view.addSubview(window)
          window.delegate = self
          window.dataSource = self
          
          window.register(FinanceTableViewCell.self, forCellReuseIdentifier: FinanceTableViewCell.identifier)
          
          window.snp.makeConstraints {
         $0.top.equalTo(monthLabel.snp.bottom).offset(20)
         $0.left.right.equalToSuperview()
         $0.bottom.equalTo(showAllButton.snp.top)
          }
          
          return window
      }()
      
      private lazy var windowView: UIView = {
          let window = UIView()
          window.backgroundColor = UIColor.clear
          
          view.addSubview(window)
          
          window.snp.makeConstraints {
              $0.top.left.right.equalToSuperview()
              $0.bottom.equalTo(windowTableView.snp.top)
          }
          return window
      }()
      
    private lazy var listLayoutViews = [windowView, showAllButton, balanceLabel, cashLabel, monthLabel, lefrChevron, rightChevron, windowTableView]

      
        override func viewDidLoad() {
          super.viewDidLoad()
          
          let _ = listLayoutViews.compactMap { $0 }
          
                    finance += FinanceValues.values
          windowTableView.tableFooterView = UIView(frame: .zero)
          
            view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      }
      
      @objc private func showAllFinance() {
          print("листайте далее")
      }
  }

extension FinanceViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        finance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FinanceTableViewCell.identifier,for: indexPath) as? FinanceTableViewCell else { return UITableViewCell() }
        
        let color = finance[indexPath.row].color
        
        cell.textLabel?.text = finance[indexPath.row].title
        cell.imageView?.image = UIImage(systemName: finance[indexPath.row].image, withConfiguration: .none)
        cell.imageView?.tintColor = UIColor(named: color)
        
        
        
        cell.configure(price: "$\(finance[indexPath.row].price)", product: finance[indexPath.row].category)
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemTeal
        cell.selectedBackgroundView = backgroundView
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(finance[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

