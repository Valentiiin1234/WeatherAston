//
//  EntityCity+CoreDataProperties.swift
//  WeatherAston
//
//  Created by Mac on 02.12.2023.
//
//

import Foundation
import CoreData

@objc(EntityCity)
public class EntityCity: NSManagedObject {

}
extension EntityCity {
    @NSManaged public var name: String?
}

extension EntityCity : Identifiable {

}
