//
//  Reflection.swift
//  Reflection
//
//  Created by Christian Otkjær on 04/03/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public func typeName(_ thing: Any.Type) -> String
{
    return String(describing: thing)
}

public func typeName(_ thing: Any) -> String
{
    return typeName(Mirror(reflecting: thing).subjectType)
}

public func typeName(_ thing: Any?) -> String
{
    guard let thing = thing else { return "nil" }

    return typeName(thing)
}
