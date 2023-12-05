//
//  StorageService.swift
//  WeatherAston
//
//  Created by Mac on 05.12.2023.
//

import Foundation

protocol StorageService{
    func createData(_ nameCity: String)
    func retriveData(completion: (Result<[EntityCity], Error>) -> Void)
    func updateData()
    func deleteData(_ entity: EntityCity)
}
