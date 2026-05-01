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
    
        private let headerView = UIView().then {
            $0.backgroundColor = .watchaBlack
        }

        private let headerBottomLineView = UIView().then {
            $0.backgroundColor = .watchaGrayCustom3
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
    
        private let floatingImageView = UIImageView().then {
            $0.image = UIImage(named: "floatingImage")
            $0.contentMode = .scaleAspectFit
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
                
                view.addSubview(headerView)

                headerView.addSubview(topBarView)
                headerView.addSubview(titleLabel)
                headerView.addSubview(headerBottomLineView)

                topBarView.addSubview(iconStackView)

                iconStackView.addArrangedSubview(videoIcon)
                iconStackView.addArrangedSubview(notificationIcon)
                iconStackView.addArrangedSubview(profileIcon)
                
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
                    newContentStackView.addArrangedSubview(makeBigGaroImageView(imageName: $0))
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
                
                let watchaPartyData: [(String, String, String)] = [
                    ("garoItem1", "오늘 10:10에 시작", "# 크라임씬"),
                    ("garoItem2", "오늘 11:10에 시작", "# 폭싹 속았수다"),
                    ("garoItem3", "오늘 12:10에 시작", "# 왕과 사는 남자"),
                    ("garoItem4", "오늘 14:10에 시작", "# 파묘")
                ]

                watchaPartyData.forEach {
                    watchaPartyStackView.addArrangedSubview(
                        makeWatchaPartyView(
                            imageName: $0.0,
                            timeText: $0.1,
                            titleText: $0.2
                        )
                    )
                }
            
                view.addSubview(floatingImageView)
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
                
                headerView.snp.makeConstraints {
                    $0.top.equalTo(view.safeAreaLayoutGuide)
                    $0.leading.trailing.equalToSuperview()
                    $0.height.equalTo(100)
                }

                topBarView.snp.makeConstraints {
                    $0.top.leading.trailing.equalToSuperview()
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
                
                headerBottomLineView.snp.makeConstraints {
                    $0.leading.trailing.bottom.equalToSuperview()
                    $0.top.equalTo(titleLabel.snp.bottom).offset(8)
                    $0.height.equalTo(1)
                }
                
                subscribeScrollView.snp.makeConstraints {
                    $0.top.equalToSuperview().offset(141) // 여기 101+40해서 141
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
                    $0.height.equalTo(180)
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
                    $0.height.equalTo(195)
                }
                
                watchaPartyStackView.snp.makeConstraints {
                    $0.edges.equalToSuperview()
                    $0.height.equalToSuperview()
                }
            
                floatingImageView.snp.makeConstraints {
                    $0.leading.equalToSuperview().offset(12)
                    $0.trailing.equalToSuperview().offset(-12)
                    $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-14)
                    $0.height.equalTo(86)
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
        
        // 작은 가로 이미지뷰
        private func makeSmallGaroImageView(imageName: String) -> UIImageView {
            return UIImageView().then {
                $0.image = UIImage(named: imageName)
                $0.contentMode = .scaleAspectFill
                $0.clipsToBounds = true
                $0.layer.cornerRadius = 8
                
                $0.snp.makeConstraints {
                    $0.width.equalTo(196)
                    $0.height.equalTo(139)
                }
            }
        }
    
        // 큰 가로 이미지뷰
        private func makeBigGaroImageView(imageName: String) -> UIImageView {
            return UIImageView().then {
                $0.image = UIImage(named: imageName)
                $0.contentMode = .scaleAspectFill
                $0.clipsToBounds = true
                $0.layer.cornerRadius = 8
                
                $0.snp.makeConstraints {
                    $0.width.equalTo(321)
                    $0.height.equalTo(180)
                }
            }
        }
    
        // 왓챠파티 이미지뷰
        private func makeWatchaPartyView(
            imageName: String,
            timeText: String,
            titleText: String
        ) -> UIView {
            
            let containerView = UIView().then {
                $0.backgroundColor = .watchaGray600
            }
            
            let imageView = UIImageView().then {
                $0.image = UIImage(named: imageName)
                $0.contentMode = .scaleAspectFill
                $0.clipsToBounds = true
            }
            
            let notiIcon = UIImageView().then {
                $0.image = UIImage(named: "watchaPartyNotiIcon")
                $0.backgroundColor = .red
                $0.contentMode = .scaleAspectFit
            }
            
            let timeLabel = UILabel().then {
                $0.text = timeText
                $0.textColor = .watchaPink
                $0.font = .body1
            }
            
            let titleLabel = UILabel().then {
                $0.text = titleText
                $0.textColor = .watchaWhite
                $0.font = .subhead3
            }
            
            containerView.addSubview(imageView)
            containerView.addSubview(notiIcon)
            containerView.addSubview(timeLabel)
            containerView.addSubview(titleLabel)
            
            containerView.snp.makeConstraints {
                $0.width.equalTo(196)
                $0.height.equalTo(194)
            }
            
            imageView.snp.makeConstraints {
                $0.top.leading.trailing.equalToSuperview()
                $0.height.equalTo(139)
            }
            
            notiIcon.snp.makeConstraints {
                $0.top.equalTo(imageView.snp.top).offset(12)
                $0.trailing.equalTo(imageView.snp.trailing).offset(-12)
                $0.size.equalTo(35)
            }
            
            timeLabel.snp.makeConstraints {
                $0.top.equalTo(imageView.snp.bottom).offset(8)
                $0.leading.equalToSuperview().offset(12)
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(timeLabel.snp.bottom).offset(4)
                $0.leading.equalTo(timeLabel)
            }
            
            return containerView
        }
}
