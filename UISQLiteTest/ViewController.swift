//
//  ViewController.swift
//  UISQLiteTest
//
//  Created by fnord on 4/1/18.
//  Copyright © 2018 twof. All rights reserved.
//

import Cocoa
import FluentSQLite
import Foundation

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let jamie = User(id: nil, name: "Jaimie", age: 20)
            
            try DatabaseManager.sharedConnection()
                .map { (conn) -> Future<User> in
                    return jamie.save(on: conn).map{ (newUser) -> (User) in
                        print(newUser)
                        return newUser
                    }.catch { (err) in
                        print(err)
                    }
                }.catch({ (err) in
                    print(err)
                })
        } catch {
            print(error)
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

