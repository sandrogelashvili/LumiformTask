//
//  NavigationCoordinator.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

protocol NavigationCoordinator {
    func push(_ path: any Routable)
    func popLast()
    func popToRoot()
}
