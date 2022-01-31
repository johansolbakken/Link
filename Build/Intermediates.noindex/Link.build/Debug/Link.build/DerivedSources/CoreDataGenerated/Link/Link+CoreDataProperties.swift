//
//  Link+CoreDataProperties.swift
//  
//
//  Created by Johan Solbakken on 31.01.2022.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Link {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Link> {
        return NSFetchRequest<Link>(entityName: "Link")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var url: String?

}

extension Link : Identifiable {

}
