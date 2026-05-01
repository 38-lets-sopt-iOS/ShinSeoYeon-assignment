import UIKit

import SnapKit

final class WelcomeViewController: UIViewController {
    
    private let nickname: String?
    
    init(nickname: String?) {
        self.nickname = nickname
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "watchaTitleImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .watchaWhite
        label.font = .head2
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = .subhead1
        button.setTitleColor(.watchaWhite, for: .normal)
        button.backgroundColor = .watchaPink
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .watchaBlack
        navigationItem.hidesBackButton = true
        
        if let nickname, !nickname.isEmpty {
            welcomeLabel.text = "\(nickname)님\n가입을 환영합니다!"
        } else {
            welcomeLabel.text = "가입을 환영합니다!"
        }
        
        view.addSubview(logoImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(mainButton)
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(95)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(319)
            $0.height.equalTo(167)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(54)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.height.equalTo(56)
        }
    }
}

