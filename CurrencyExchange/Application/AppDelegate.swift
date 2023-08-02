//
//  AppDelegate.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 31.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    // FIXME: Необходимо удалить все комментарии во всех файлах, т.к. они создают визуальный шум и сложны в поддержке —
    // FIXME: т.е. придется не забывать их редактировать
    // FIXME: да, и копирайт в начале файла тоже лишний, ибо гит хранит все изменения и их авторов
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // FIXME: Пустые методы — это мертвый код. Мертвичина — причина загнивания проекта.
    // FIXME: Удаляем все пустые и/или неиспользуемые методы, классы, типы и пр.
    // FIXME: Исправить по всему проекту
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

// FIXME: Пустые строки между методами — да, между типа в одном файле — да, в конце файла — да, но не в остальных случаях
// FIXME: Пустые строки должны помогать различать блоки кода, но при этом каждая из них:
// FIXME: 1) увеличивает кол-во строк; 2) увеличивает вес файла в КБ
// FIXME: Исправить по всему проекту
}

