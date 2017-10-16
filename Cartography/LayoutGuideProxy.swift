//
//  LayoutGuideProxy.swift
//  Cartography
//
//  Created by Vitor Travain on 11/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
@available(iOS, introduced: 9.0)
@available(tvOS, introduced: 9.0)
public final class LayoutGuideProxy: SupportsPositioningLayoutProxy {
    public let context: Context
    public let element: AnyObject

    public init(context: Context, element: UILayoutGuide) {
        self.context = context
        self.element = element
    }

    public var owningView: ViewProxy? {
        guard let layoutGuide = element as? UILayoutGuide else {
            fatalError("This shouldn't happen")
        }

        guard let owningView = layoutGuide.owningView else {
            return nil
        }

        return ViewProxy(context: context, view: owningView)
    }
}
#endif
