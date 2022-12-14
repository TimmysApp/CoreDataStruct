//
//  File.swift
//  
//
//  Created by Joe Maghzal on 8/9/22.
//

import Foundation
import SwiftUI
import Combine

@available(iOS 14.0, macOS 11.0, *)
@propertyWrapper public struct FetchedModels<Value: Datable>: DynamicProperty {
    @StateObject private var modelData: FecthConfigurations<Value>
    public init(defaultValue: [Value] = [], predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) {
        self._modelData = StateObject(wrappedValue: FecthConfigurations(value: defaultValue, predicate: predicate, sortDescriptors: sortDescriptors))
    }
    public var wrappedValue: [Value] {
        get {
            modelData.data
        }
        nonmutating set {
        }
    }
}

@available(iOS 14.0, macOS 11.0, *)
@propertyWrapper public struct SectionedModels<Value: Datable>: DynamicProperty {
    @StateObject private var modelData: FecthConfigurations<Value>
    public init(defaultValue: [[Value]] = [], predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, sections: @escaping ([Value], Value) -> Bool) {
        self._modelData = StateObject(wrappedValue: FecthConfigurations(value: defaultValue, predicate: predicate, sortDescriptors: sortDescriptors, sectionsRules: sections))
//        self.sectionResults = SectionedFecthResults(sections: defaultValue)
    }
    public var wrappedValue: [[Value]] {
        get {
            modelData.sections
        }
        nonmutating set {
        }
    }
}
