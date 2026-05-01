import UIKit

import SnapKit
import Then

final class SubscribeViewController: UIViewController {
    
    // UI 프로퍼티
    
        private let scrollView = UIScrollView().then {
                $0.showsVerticalScrollIndicator = false
            }
        
        private let contentView = UIView()
        
        private let topBarView = UIView().then {
            $0.backgroundColor = .clear
        }
        
        private let iconStackView = UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 20
            $0.alignment = .center
        }
        
        private let videoIcon = UIImageView().then {
            $0.image = UIImage(named: "videoIcon")
            $0.contentMode = .scaleAspectFit
        }
        
        private let notificationIcon = UIImageView().then {
            $0.image = UIImage(named: "notificationIcon")
            $0.contentMode = .scaleAspectFit
        }
        
        private let profileIcon = UIImageView().then {
            $0.image = UIImage(named: "profileIcon")
            $0.contentMode = .scaleAspectFit
        }
        
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
    
        private let watgorithmTitleImageView = UIImageView().then {
            $0.image = UIImage(named: "watgorithmImage")
            $0.contentMode = .scaleAspectFit
        }

        private let watgorithmSubTitleLabel = UILabel().then {
            $0.text = "예능부터 드라마까지!"
            $0.textColor = .watchaGrayCustom2
            $0.font = .subhead1
        }

        private let watgorithmScrollView = UIScrollView().then {
            $0.showsHorizontalScrollIndicator = false
        }

        private let watgorithmStackView = UIStackView().then {
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
        
        private let watgorithmMoreLabel = UILabel().then {
            $0.text = "더보기"
            $0.textColor = .watchaGrayCustom2
            $0.font = .cap1
        }

        private let comingSoonMoreLabel = UILabel().then {
            $0.text = "더보기"
            $0.textColor = .watchaGrayCustom2
            $0.font = .cap1
        }

        private let watchaPartyMoreLabel = UILabel().then {
            $0.text = "더보기"
            $0.textColor = .watchaGrayCustom2
            $0.font = .cap1
        }
    
        private let watgorithmHeaderStack = UIStackView().then {
            $0.axis = .horizontal
            $0.alignment = .center
        }

        private let comingSoonHeaderStack = UIStackView().then {
            $0.axis = .horizontal
            $0.alignment = .center
        }

        private let watchaPartyHeaderStack = UIStackView().then {
            $0.axis = .horizontal
            $0.alignment = .center
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
            
            contentView.addSubview(topBarView)
            topBarView.addSubview(iconStackView)
            
            iconStackView.addArrangedSubview(videoIcon)
            iconStackView.addArrangedSubview(notificationIcon)
            iconStackView.addArrangedSubview(profileIcon)
            
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
        
            contentView.addSubview(watgorithmTitleImageView)
            contentView.addSubview(watgorithmHeaderStack)
            watgorithmHeaderStack.addArrangedSubview(watgorithmSubTitleLabel)
            watgorithmHeaderStack.addArrangedSubview(UIView())
            watgorithmHeaderStack.addArrangedSubview(watgorithmMoreLabel)
            contentView.addSubview(watgorithmScrollView)
            watgorithmScrollView.addSubview(watgorithmStackView)

            ["saeroItem1", "saeroItem2", "saeroItem3", "saeroItem4"].forEach {
                watgorithmStackView.addArrangedSubview(makeSmallSaeroImageView(imageName: $0))
            }
            
            contentView.addSubview(comingSoonHeaderStack)
            comingSoonHeaderStack.addArrangedSubview(comingSoonTitleLabel)
            comingSoonHeaderStack.addArrangedSubview(UIView())
            comingSoonHeaderStack.addArrangedSubview(comingSoonMoreLabel)
            contentView.addSubview(comingSoonScrollView)
            comingSoonScrollView.addSubview(comingSoonStackView)
            
            ["saeroItem1", "saeroItem2", "saeroItem3", "saeroItem4"].forEach {
                comingSoonStackView.addArrangedSubview(makeSmallSaeroImageView(imageName: $0))
            }
            
            contentView.addSubview(watchaPartyHeaderStack)
            watchaPartyHeaderStack.addArrangedSubview(watchaPartyTitleLabel)
            watchaPartyHeaderStack.addArrangedSubview(UIView())
            watchaPartyHeaderStack.addArrangedSubview(watchaPartyMoreLabel)
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
            
            topBarView.snp.makeConstraints {
                $0.top.equalToSuperview().offset(55)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(56)
            }
            
            iconStackView.snp.makeConstraints {
                $0.trailing.equalToSuperview().offset(-22)
                $0.centerY.equalToSuperview()
            }
            
            [videoIcon, notificationIcon, profileIcon].forEach {
                $0.snp.makeConstraints {
                    $0.width.height.equalTo(24)
                }
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(topBarView.snp.bottom)
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
        
            watgorithmTitleImageView.snp.makeConstraints {
                $0.top.equalTo(newContentScrollView.snp.bottom).offset(45)
                $0.leading.equalToSuperview().offset(22)
            }

            watgorithmHeaderStack.snp.makeConstraints {
                $0.top.equalTo(watgorithmTitleImageView.snp.bottom).offset(8.5)
                $0.leading.trailing.equalToSuperview().inset(22)
            }

            watgorithmScrollView.snp.makeConstraints {
                $0.top.equalTo(watgorithmHeaderStack.snp.bottom).offset(20)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(170)
            }

            watgorithmStackView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.height.equalToSuperview()
            }
            
            comingSoonHeaderStack.snp.makeConstraints {
                $0.top.equalTo(watgorithmScrollView.snp.bottom).offset(45)
                $0.leading.trailing.equalToSuperview().inset(22)
            }
            
            comingSoonScrollView.snp.makeConstraints {
                $0.top.equalTo(comingSoonHeaderStack.snp.bottom).offset(20)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(170)
            }
            
            comingSoonStackView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.height.equalToSuperview()
            }
            
            watchaPartyHeaderStack.snp.makeConstraints {
                $0.top.equalTo(comingSoonScrollView.snp.bottom).offset(45)
                $0.leading.trailing.equalToSuperview().inset(22)
            }
            
            watchaPartyScrollView.snp.makeConstraints {
                $0.top.equalTo(watchaPartyHeaderStack.snp.bottom).offset(20)
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
