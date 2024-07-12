//
//  UIFont + Extension.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 24.03.24.
//

import UIKit

//extension UIFont {
//    enum Roboto {
//        enum black {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.black, size: size)!
//            }
//        }
//        enum blackItalic {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.blackItalic, size: size)!
//            }
//        }
//        enum bold {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.bold, size: size)!
//            }
//        }
//        enum boldItalic {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.boldItalic, size: size)!
//            }
//        }
//        enum italic {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.italic, size: size)!
//            }
//        }
//        enum light {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.light, size: size)!
//            }
//        }
//        enum lightItalic {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.lightItalic, size: size)!
//            }
//        }
//        enum medium {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.medium, size: size)!
//            }
//        }
//        enum mediumItalic {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.mediumItalic, size: size)!
//            }
//        }
//        enum regular {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.regular, size: size)!
//            }
//        }
//        enum thin {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.thin, size: size)!
//            }
//        }
//        enum thinItalic {
//            static func size(of size: CGFloat) -> UIFont {
//                return  UIFont(name: Consants.Roboto.thinItalic, size: size)!
//            }
//        }
//    }
//}
//
//private extension UIFont {
//    enum Consants {
//        enum Roboto {
//            static let black = "Roboto-Black"
//            static let blackItalic = "Roboto-BlackItalic"
//            static let bold = "Roboto-Bold"
//            static let boldItalic = "Roboto-BoldItalic"
//            static let italic = "Roboto-Italic"
//            static let light = "Roboto-Light"
//            static let lightItalic = "Roboto-LightItalic"
//            static let medium = "Roboto-Medium"
//            static let mediumItalic = "Roboto-MediumItalic"
//            static let regular = "Roboto-Regular"
//            static let thin = "Roboto-Thin"
//            static let thinItalic = "Roboto-ThinItalic"
//        }
//    }
//}

extension UIFont {
    enum Roboto {
        enum black {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.black, size: size)!
            }
        }
        enum blackItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.blackItalic, size: size)!
            }
        }
        enum bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.bold, size: size)!
            }
        }
        enum boldItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.boldItalic, size: size)!
            }
        }
        enum italic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.italic, size: size)!
            }
        }
        enum light {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.light, size: size)!
            }
        }
        enum lightitalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.lightItalic, size: size)!
            }
        }
        enum medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.medium, size: size)!
            }
        }
        enum mediumItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.mediumItalic, size: size)!
            }
        }
        enum regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.regular, size: size)!
            }
        }
        enum thin {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.thin, size: size)!
            }
        }
        enum thinitalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.thinItalic, size: size)!
            }
        }
    }
}

private extension UIFont {
    enum Constants {
        enum Roboto {
            static let black = "Roboto-Black"
            static let blackItalic = "Roboto-BlackItalic"
            static let bold = "Roboto-Bold"
            static let boldItalic = "Roboto-BoldItalic"
            static let italic = "Roboto-Italic"
            static let light = "Roboto-Light"
            static let lightItalic = "Roboto-LightItalic"
            static let medium = "Roboto-Medium"
            static let mediumItalic = "Roboto-MediumItalic"
            static let regular = "Roboto-Regular"
            static let thin = "Roboto-Thin"
            static let thinItalic = "Roboto-ThinItalic"
        }
    }
}
