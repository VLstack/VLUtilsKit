import SwiftUI

#if canImport(UIKit)
import UIKit
#else
typealias UIAccessibility = NSAccessibility
extension NSAccessibility
{
 static var isReduceMotionEnabled: Bool { false }
}
#endif

/// Returns the result of recomputing the view's body with the provided
/// animation according to “Reduce Motion” accessibility setting.
///
/// Source: [HackingWithSwift](https://www.hackingwithswift.com/quick-start/swiftui/how-to-reduce-animations-when-requested)
///
/// This function sets the given `Animation` as the `Transaction/animation`
/// property of the thread's current `Transaction`
/// if "Reduce Motion" setting is "on" this function returns the provided View body
@available(*, deprecated, message: "use VLUtils.animate instead")
public
func animate<Result>(_ animation: Animation? = .default,
                     _ body: () throws -> Result) rethrows -> Result
{
 if UIAccessibility.isReduceMotionEnabled { return try body() }

 return try withAnimation(animation, body)
}
