//
// MainNavigator.swift
// CleanArchitecture
//
// Created by Tuan Truong on 6/4/18.
// Copyright © 2018 Framgia. All rights reserved.
//

protocol MainNavigatorType {
    func toProducts()
    func toSectionedProducts()
    func toRepos()
    func toRepoCollection()
}

struct MainNavigator: MainNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toProducts() {
        let vc: ProductsViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toSectionedProducts() {
        let vc: SectionedProductsViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toRepos() {
        let navigator = ReposNavigator(assembler: assembler, navigationController: navigationController)
        navigator.toRepos()
    }
    
    func toRepoCollection() {
        let navigator = ReposNavigator(assembler: assembler, navigationController: navigationController)
        navigator.toRepoCollection()
    }
}

