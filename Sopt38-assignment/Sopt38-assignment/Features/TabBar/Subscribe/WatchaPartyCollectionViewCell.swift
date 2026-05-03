import UIKit

import SnapKit
import Then

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
