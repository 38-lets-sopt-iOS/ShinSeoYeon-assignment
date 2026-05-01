import UIKit

import SnapKit
import Then

final class SubscribeViewController: UIViewController {
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    private let contentView = UIView()
    
    private let titleLabel = UILabel().then {
            $0.text = "구독"
            $0.textColor = .watchaWhite
            $0.font = .head1
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .watchaBlack
        
        setView()
        setLayout()
    }
    
    // addSubview 정리해놓은 함수
    private func setView() {
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            contentView.addSubview(titleLabel)
        }
    
    // 스냅킷 제약 모아놓은 함수
    private func setLayout() {
            scrollView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            
            contentView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.width.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(100)
                $0.leading.equalToSuperview().offset(28)
                $0.width.equalTo(52)
                $0.height.equalTo(36)
            }
        }
}
