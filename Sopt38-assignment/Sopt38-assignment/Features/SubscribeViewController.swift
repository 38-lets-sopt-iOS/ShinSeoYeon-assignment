import UIKit

import SnapKit
import Then

final class SubscribeViewController: UIViewController {
    
    // UI 프로퍼티
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    private let contentView = UIView()
    
    private let titleLabel = UILabel().then {
        $0.text = "구독"
        $0.textColor = .watchaWhite
        $0.font = .head1
    }
    
    private let subscribeScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let subscribeStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.alignment = .fill
    }
    
    private let newContentTitleLabel = UILabel().then {
        $0.text = "방금 막 도착한 신상 컨텐츠"
        $0.textColor = .watchaWhite
        $0.font = .head3
    }
    
    private let newContentSubTitleLabel = UILabel().then {
        $0.text = "예능부터 드라마까지!"
        $0.textColor = .watchaGrayCustom2
        $0.font = .subhead1
    }
    
    private let newContentScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let newContentStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.alignment = .fill
    }
    
    private let comingSoonTitleLabel = UILabel().then {
        $0.text = "공개 예정 콘텐츠"
        $0.textColor = .watchaWhite
        $0.font = .head3
    }
    
    private let comingSoonScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let comingSoonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.alignment = .fill
    }
    
    private let watchaPartyTitleLabel = UILabel().then {
        $0.text = "왓챠 파티"
        $0.textColor = .watchaWhite
        $0.font = .head3
    }
    
    private let watchaPartyScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let watchaPartyStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.alignment = .fill
    }
    
    
    // viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .watchaBlack
        
        setView()
        setLayout()
    }
    
    
    // setView 함수 (addSubview 모아놓은 함수)
    
    private func setView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(subscribeScrollView)
        subscribeScrollView.addSubview(subscribeStackView)
        
        ["saeroItem1", "saeroItem2", "saeroItem3", "saeroItem4"].forEach {
            subscribeStackView.addArrangedSubview(makeBigSaeroImageView(imageName: $0))
        }
        
        contentView.addSubview(newContentTitleLabel)
        contentView.addSubview(newContentSubTitleLabel)
        contentView.addSubview(newContentScrollView)
        newContentScrollView.addSubview(newContentStackView)
        
        ["garoItem1", "garoItem2", "garoItem3", "garoItem4"].forEach {
            newContentStackView.addArrangedSubview(makeGaroImageView(imageName: $0))
        }
        
        contentView.addSubview(comingSoonTitleLabel)
        contentView.addSubview(comingSoonScrollView)
        comingSoonScrollView.addSubview(comingSoonStackView)
        
        ["saeroItem1", "saeroItem2", "saeroItem3", "saeroItem4"].forEach {
            comingSoonStackView.addArrangedSubview(makeSmallSaeroImageView(imageName: $0))
        }
        
        contentView.addSubview(watchaPartyTitleLabel)
        contentView.addSubview(watchaPartyScrollView)
        watchaPartyScrollView.addSubview(watchaPartyStackView)
        
        ["garoItem1", "garoItem2", "garoItem3", "garoItem4"].forEach {
            watchaPartyStackView.addArrangedSubview(makeGaroImageView(imageName: $0))
        }
    }
    
    // setLayout 함수 (스냅킷 제약 모아놓은 함수)
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalTo(watchaPartyScrollView.snp.bottom).offset(80)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(22)
            $0.width.equalTo(52)
            $0.height.equalTo(36)
        }
        
        subscribeScrollView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(443)
        }
        
        subscribeStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        newContentTitleLabel.snp.makeConstraints {
            $0.top.equalTo(subscribeScrollView.snp.bottom).offset(45)
            $0.leading.equalToSuperview().offset(22)
        }
        
        newContentSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(newContentTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(newContentTitleLabel)
        }
        
        newContentScrollView.snp.makeConstraints {
            $0.top.equalTo(newContentSubTitleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        newContentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        comingSoonTitleLabel.snp.makeConstraints {
            $0.top.equalTo(newContentScrollView.snp.bottom).offset(45)
            $0.leading.equalToSuperview().offset(22)
        }
        
        comingSoonScrollView.snp.makeConstraints {
            $0.top.equalTo(comingSoonTitleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(170)
        }
        
        comingSoonStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        watchaPartyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(comingSoonScrollView.snp.bottom).offset(45)
            $0.leading.equalToSuperview().offset(22)
        }
        
        watchaPartyScrollView.snp.makeConstraints {
            $0.top.equalTo(watchaPartyTitleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        watchaPartyStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
    
    // 이미지뷰 스타일 모아서 정리해놓은 함수들
    // 큰 세로 이미지뷰
    private func makeBigSaeroImageView(imageName: String) -> UIImageView {
        return UIImageView().then {
            $0.image = UIImage(named: imageName)
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
            
            $0.snp.makeConstraints {
                $0.width.equalTo(273)
                $0.height.equalTo(399)
            }
        }
    }
    
    // 작은 세로 이미지뷰
    private func makeSmallSaeroImageView(imageName: String) -> UIImageView {
        return UIImageView().then {
            $0.image = UIImage(named: imageName)
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
            
            $0.snp.makeConstraints {
                $0.width.equalTo(103)
                $0.height.equalTo(153)
            }
        }
    }
    
    // 가로 이미지뷰
    private func makeGaroImageView(imageName: String) -> UIImageView {
        return UIImageView().then {
            $0.image = UIImage(named: imageName)
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
            
            $0.snp.makeConstraints {
                $0.width.equalTo(195)
                $0.height.equalTo(139)
            }
        }
    }
}
