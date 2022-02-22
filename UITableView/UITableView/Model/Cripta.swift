//
//  Cripta.swift
//  UITableView
//
//  Created by Shahnoza on 19/2/22.
//

import Foundation

enum kindOfCripta: String {
    case bitcoin = "bitcoin"
    case monero = "monero"
    case ripple = "ripple"
    case etherium = "etherium"
    case streem = "steem"
}

struct Cripta {
    var image: String
    var nameCripta: String
    var procentCripta: String
    var valueCripta: String
    var kursOfCripta: String
}



struct CriptaValue {
    static let values = [
        Cripta(image: kindOfCripta.bitcoin.rawValue , nameCripta: "Bitcoin", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.monero.rawValue , nameCripta: "Monero", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.ripple.rawValue , nameCripta: "Ripple", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.etherium.rawValue , nameCripta: "Etherium", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.streem.rawValue , nameCripta: "Streem", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.bitcoin.rawValue , nameCripta: "Bitcoin", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.monero.rawValue , nameCripta: "Monero", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.ripple.rawValue , nameCripta: "Ripple", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.etherium.rawValue , nameCripta: "Etherium", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.streem.rawValue , nameCripta: "Streem", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.bitcoin.rawValue , nameCripta: "Bitcoin", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.monero.rawValue , nameCripta: "Monero", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.ripple.rawValue , nameCripta: "Ripple", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.etherium.rawValue , nameCripta: "Etherium", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
        Cripta(image: kindOfCripta.streem.rawValue , nameCripta: "Streem", procentCripta: "+1,6%", valueCripta: "$29,850.15", kursOfCripta: "2.73 BTC"),
    ]
}
