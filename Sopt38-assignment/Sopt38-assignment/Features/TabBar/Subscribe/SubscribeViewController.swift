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
    
    private lazy var subscribeCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeCollectionViewLayout(
            itemSize: CGSize(width: 273, height: 399),
            lineSpacing: 12,
            sectionInset: UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)
        )
    ).then {
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
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
    
    private lazy var newContentCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeCollectionViewLayout(
            itemSize: CGSize(width: 321, height: 180),
            lineSpacing: 12,
            sectionInset: UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)
        )
    ).then {
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
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
    
    private lazy var watgorithmCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeCollectionViewLayout(
            itemSize: CGSize(width: 103, height: 153),
            lineSpacing: 12,
            sectionInset: UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)
        )
    ).then {
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let comingSoonTitleLabel = UILabel().then {
        $0.text = "공개 예정 콘텐츠"
        $0.textColor = .watchaWhite
        $0.font = .head3
    }
    
    private lazy var comingSoonCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeCollectionViewLayout(
            itemSize: CGSize(width: 103, height: 153),
            lineSpacing: 12,
            sectionInset: UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)
        )
    ).then {
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let watchaPartyTitleLabel = UILabel().then {
        $0.text = "왓챠 파티"
        $0.textColor = .watchaWhite
        $0.font = .head3
    }
    
    private lazy var watchaPartyCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeCollectionViewLayout(
            itemSize: CGSize(width: 196, height: 194),
            lineSpacing: 12,
            sectionInset: UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)
        )
    ).then {
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
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
    
    private let subscribeData = ["saeroItem1", "saeroItem2", "saeroItem3", "saeroItem4"]
    
    private let newContentData = ["garoItem1", "garoItem2", "garoItem3", "garoItem4"]
    
    private let watgorithmData = ["saeroItem1", "saeroItem2", "saeroItem3", "saeroItem4"]
    
    private let comingSoonData = ["saeroItem1", "saeroItem2", "saeroItem3", "saeroItem4"]
    
    private let watchaPartyData: [(String, String, String)] = [
        ("garoItem1", "오늘 10:10에 시작", "# 크라임씬"),
        ("garoItem2", "오늘 11:10에 시작", "# 폭싹 속았수다"),
        ("garoItem3", "오늘 12:10에 시작", "# 왕과 사는 남자"),
        ("garoItem4", "오늘 14:10에 시작", "# 파묘")
    ]
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .watchaBlack
        
        setCollectionView()
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
        
        contentView.addSubview(subscribeCollectionView)
        
        contentView.addSubview(newContentTitleLabel)
        contentView.addSubview(newContentSubTitleLabel)
        contentView.addSubview(newContentCollectionView)
        
        contentView.addSubview(watgorithmTitleImageView)
        contentView.addSubview(watgorithmHeaderStack)
        watgorithmHeaderStack.addArrangedSubview(watgorithmSubTitleLabel)
        watgorithmHeaderStack.addArrangedSubview(UIView())
        watgorithmHeaderStack.addArrangedSubview(watgorithmMoreLabel)
        contentView.addSubview(watgorithmCollectionView)
        
        contentView.addSubview(comingSoonHeaderStack)
        comingSoonHeaderStack.addArrangedSubview(comingSoonTitleLabel)
        comingSoonHeaderStack.addArrangedSubview(UIView())
        comingSoonHeaderStack.addArrangedSubview(comingSoonMoreLabel)
        contentView.addSubview(comingSoonCollectionView)
        
        contentView.addSubview(watchaPartyHeaderStack)
        watchaPartyHeaderStack.addArrangedSubview(watchaPartyTitleLabel)
        watchaPartyHeaderStack.addArrangedSubview(UIView())
        watchaPartyHeaderStack.addArrangedSubview(watchaPartyMoreLabel)
        contentView.addSubview(watchaPartyCollectionView)
        
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
            $0.bottom.equalTo(watchaPartyCollectionView.snp.bottom).offset(80)
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
        
        subscribeCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(141) // 여기 101+40해서 141
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(443)
        }
        
        newContentTitleLabel.snp.makeConstraints {
            $0.top.equalTo(subscribeCollectionView.snp.bottom).offset(45)
            $0.leading.equalToSuperview().offset(22)
        }
        
        newContentSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(newContentTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(newContentTitleLabel)
        }
        
        newContentCollectionView.snp.makeConstraints {
            $0.top.equalTo(newContentSubTitleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(180)
        }
        
        watgorithmTitleImageView.snp.makeConstraints {
            $0.top.equalTo(newContentCollectionView.snp.bottom).offset(45)
            $0.leading.equalToSuperview().offset(22)
        }
        
        watgorithmHeaderStack.snp.makeConstraints {
            $0.top.equalTo(watgorithmTitleImageView.snp.bottom).offset(8.5)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        watgorithmCollectionView.snp.makeConstraints {
            $0.top.equalTo(watgorithmHeaderStack.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(170)
        }
        
        comingSoonHeaderStack.snp.makeConstraints {
            $0.top.equalTo(watgorithmCollectionView.snp.bottom).offset(45)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        comingSoonCollectionView.snp.makeConstraints {
            $0.top.equalTo(comingSoonHeaderStack.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(170)
        }
        
        watchaPartyHeaderStack.snp.makeConstraints {
            $0.top.equalTo(comingSoonCollectionView.snp.bottom).offset(45)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        watchaPartyCollectionView.snp.makeConstraints {
            $0.top.equalTo(watchaPartyHeaderStack.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(195)
        }
        
        floatingImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-14)
            $0.height.equalTo(86)
        }
    }
    
    private func setCollectionView() {
        [
            subscribeCollectionView,
            newContentCollectionView,
            watgorithmCollectionView,
            comingSoonCollectionView,
            watchaPartyCollectionView
        ].forEach {
            $0.delegate = self
            $0.dataSource = self
        }
        
        subscribeCollectionView.register(
            PosterCollectionViewCell.self,
            forCellWithReuseIdentifier: PosterCollectionViewCell.identifier
        )
        
        newContentCollectionView.register(
            PosterCollectionViewCell.self,
            forCellWithReuseIdentifier: PosterCollectionViewCell.identifier
        )
        
        watgorithmCollectionView.register(
            PosterCollectionViewCell.self,
            forCellWithReuseIdentifier: PosterCollectionViewCell.identifier
        )
        
        comingSoonCollectionView.register(
            PosterCollectionViewCell.self,
            forCellWithReuseIdentifier: PosterCollectionViewCell.identifier
        )
        
        watchaPartyCollectionView.register(
            WatchaPartyCollectionViewCell.self,
            forCellWithReuseIdentifier: WatchaPartyCollectionViewCell.identifier
        )
    }
    
    private func makeCollectionViewLayout(
        itemSize: CGSize,
        lineSpacing: CGFloat,
        sectionInset: UIEdgeInsets
    ) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = itemSize
        layout.minimumLineSpacing = lineSpacing
        layout.sectionInset = sectionInset
        return layout
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
            $0.backgroundColor = .white
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

// 이거 분리해야됨
extension SubscribeViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if collectionView == subscribeCollectionView {
            return subscribeData.count
        } else if collectionView == newContentCollectionView {
            return newContentData.count
        } else if collectionView == watgorithmCollectionView {
            return watgorithmData.count
        } else if collectionView == comingSoonCollectionView {
            return comingSoonData.count
        } else if collectionView == watchaPartyCollectionView {
            return watchaPartyData.count
        } else {
            return 0
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if collectionView == watchaPartyCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WatchaPartyCollectionViewCell.identifier,
                for: indexPath
            ) as? WatchaPartyCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let data = watchaPartyData[indexPath.item]
            cell.configure(
                imageName: data.0,
                timeText: data.1,
                titleText: data.2
            )
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PosterCollectionViewCell.identifier,
                for: indexPath
            ) as? PosterCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            if collectionView == subscribeCollectionView {
                cell.configure(
                    imageName: subscribeData[indexPath.item],
                    cornerRadius: 12
                )
            } else if collectionView == newContentCollectionView {
                cell.configure(
                    imageName: newContentData[indexPath.item],
                    cornerRadius: 8
                )
            } else if collectionView == watgorithmCollectionView {
                cell.configure(
                    imageName: watgorithmData[indexPath.item],
                    cornerRadius: 8
                )
            } else if collectionView == comingSoonCollectionView {
                cell.configure(
                    imageName: comingSoonData[indexPath.item],
                    cornerRadius: 8
                )
            }
            
            return cell
        }
    }
}

// 이거 분리해야됨
extension SubscribeViewController: UICollectionViewDelegate {
    
}

final class PosterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PosterCollectionViewCell"
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setView() {
        contentView.addSubview(imageView)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(
        imageName: String,
        cornerRadius: CGFloat
    ) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius = cornerRadius
    }
}

final class WatchaPartyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "WatchaPartyCollectionViewCell"
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let notiIcon = UIImageView().then {
        $0.image = UIImage(named: "watchaPartyNotiIcon")
        $0.backgroundColor = .white
        $0.contentMode = .scaleAspectFit
    }
    
    private let timeLabel = UILabel().then {
        $0.textColor = .watchaPink
        $0.font = .body1
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .watchaWhite
        $0.font = .subhead3
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .watchaGray600
        
        setView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // setView는 하이라키 역할함
    private func setView() {
        contentView.addSubview(imageView)
        contentView.addSubview(notiIcon)
        contentView.addSubview(timeLabel)
        contentView.addSubview(titleLabel)
    }
    
    // setLayout!!
    private func setLayout() {
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
    }
    
    // configure 함수
    func configure(
        imageName: String,
        timeText: String,
        titleText: String
    ) {
        imageView.image = UIImage(named: imageName)
        timeLabel.text = timeText
        titleLabel.text = titleText
    }
}
