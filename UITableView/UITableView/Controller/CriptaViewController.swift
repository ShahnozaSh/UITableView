//
//  ViewController.swift
//  UITableView
//
//  Created by Shahnoza on 18/2/22.
//

import UIKit
import SnapKit


class CriptaViewController: UIViewController {
    
    var crypts = [Cripta]()
    
    // это создает слово портфолио
    private lazy var portfolioLabel: UILabel = {
        let portfolio = UILabel()
        portfolio.text = "Портфолио"
        portfolio.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        
        view.addSubview(portfolio)
        
        portfolio.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.left.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    
        return portfolio
    }()
    
    // это кнопка
    private lazy var setButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = UIColor.blue
        
        view.addSubview(button)
        button.addTarget(self,
                         action: #selector(settsButton),
                         for: .touchUpInside)
        
        button.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        return button
    }()
    
    private lazy var allLabel: UILabel = {
        let all = UILabel()
       all.text = "Посмотреть всё"
       all.font = UIFont.systemFont(ofSize: 10, weight: .light)
       all.textColor = .red
       
        
        view.addSubview(all)
        
        all.snp.makeConstraints { make in
            make.top.equalTo(setButton.snp.top).inset(70)
            make.right.equalTo(setButton.snp.right)
        }
    
        return all
    }()
    //таблица
    lazy var selfTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CriptaTableViewCell.self, forCellReuseIdentifier: CriptaTableViewCell.identificator)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(allLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        return tableView
    }()
    
    
    // это перечисляет мои вьюшки
    private lazy var list = [portfolioLabel, setButton, allLabel, selfTableView]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // это создает мои вьюшки
        let _ = list.compactMap { $0 }
        
        crypts += CriptaValue.values
        
        selfTableView.tableFooterView = UIView(frame: .zero)

    }
    
    @objc func settsButton() {
        print("setting")
    }

}

extension CriptaViewController: UITableViewDataSource, UITableViewDelegate {
    // количество моей ячейки
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crypts.count
    }
    
    // ячейка конфигурация
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CriptaTableViewCell.identificator, for: indexPath) as? CriptaTableViewCell  else { return  UITableViewCell() }
        cell.configure(price: crypts[indexPath.row].valueCripta,
                       product: crypts[indexPath.row].kursOfCripta,
                       image: crypts[indexPath.row].image,
                       title: crypts[indexPath.row].nameCripta,
                       subtitle: crypts[indexPath.row].procentCripta)
        
        return cell
    }
    
    // нажатие на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(crypts[indexPath.row])
    }
    
    // высота ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
}
