//
//  UserDefaults.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/08.
//

import Foundation


class UserDefaultsEX: UserDefaults {
    
    
    //Element = 要素、Codable = プロトコル(型)
    func set<Element: Codable>(value: Element, forkey key: String) {
        
        //JSONEncoderを用いてencode(Data型へ変換)→Userdefaultsへセット
        let data = try? JSONEncoder().encode(value)
        UserDefaults.standard.setValue(data, forKey: key)
        
    }
    
    func codable<Element: Codable>(forkey key: String) -> Element? {
        
        //JSONDecoderを用いてdecode(Data型を構造体へ変換)
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        let element = try? JSONDecoder().decode(Element.self, from: data)
        
        return element
    }
    
    
    
}
