import UIKit

extension UIFont {
    static let head1 = UIFont(name: "Pretendard-SemiBold", size: 30) ?? .systemFont(ofSize: 30, weight: .semibold)
    static let head2 = UIFont(name: "Pretendard-SemiBold", size: 23) ?? .systemFont(ofSize: 23, weight: .semibold)
    static let head3 = UIFont(name: "Pretendard-SemiBold", size: 20) ?? .systemFont(ofSize: 20, weight: .semibold)
    
    static let subhead1 = UIFont(name: "Pretendard-SemiBold", size: 18) ?? .systemFont(ofSize: 18, weight: .semibold)
    static let subhead2 = UIFont(name: "Pretendard-SemiBold", size: 15) ?? .systemFont(ofSize: 15, weight: .semibold)
    static let subhead3 = UIFont(name: "Pretendard-SemiBold", size: 12) ?? .systemFont(ofSize: 12, weight: .semibold)

    static let medium = UIFont(name: "Pretendard-Medium", size: 18) ?? .systemFont(ofSize: 18, weight: .medium)
    
    static let body1 = UIFont(name: "Pretendard-Medium", size: 12) ?? .systemFont(ofSize: 12, weight: .medium)
    static let body2 = UIFont(name: "Pretendard-Regular", size: 12) ?? .systemFont(ofSize: 12, weight: .regular)

    static let cap1 = UIFont(name: "Pretendard-Light", size: 12) ?? .systemFont(ofSize: 12, weight: .light)
}
