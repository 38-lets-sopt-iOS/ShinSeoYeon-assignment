import UIKit
import SnapKit

final class PasswordInputViewController: UIViewController {
    
    private let email: String
    private var nickname: String?
    private var isPasswordVisible = false
    
    init(email: String) {
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "사용할 비밀번호를\n입력해주세요"
        label.textColor = .watchaWhite
        label.font = .head2
        label.numberOfLines = 2
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .watchaGray200
        label.font = .body1
        return label
    }()
    
    private let passwordContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .watchaGray600
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 입력"
        textField.textColor = .watchaWhite
        textField.font = .body1
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호 입력",
            attributes: [.foregroundColor: UIColor.watchaGray300]
        )
        return textField
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .watchaGray300
        button.isHidden = true
        return button
    }()
    
    private let eyeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "eyeOffIcon"), for: .normal)
        button.tintColor = .watchaGray200
        return button
    }()
    
    private let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = .watchaGray100
        return imageView
    }()
    
    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        label.textColor = .watchaGray100
        label.font = .body2
        return label
    }()
    
    private lazy var nicknameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("닉네임 설정", for: .normal)
        button.setTitleColor(.watchaGray100, for: .normal)
        button.titleLabel?.font = .body2
        button.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let nicknameUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .watchaGray100
        return view
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("가입하기", for: .normal)
        button.titleLabel?.font = .subhead1
        button.setTitleColor(.watchaGray100, for: .disabled)
        button.setTitleColor(.watchaWhite, for: .normal)
        button.backgroundColor = .watchaGray400
        button.layer.cornerRadius = 10
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setAction()
    }
    
    private func setUI() {
        view.backgroundColor = .watchaBlack
        navigationController?.navigationBar.isHidden = true
        
        emailLabel.text = "\(email)로 가입중"
        
        view.addSubview(titleLabel)
        view.addSubview(emailLabel)
        view.addSubview(passwordContainerView)
        view.addSubview(checkImageView)
        view.addSubview(conditionLabel)
        view.addSubview(nicknameButton)
        view.addSubview(nicknameUnderlineView)
        view.addSubview(signUpButton)
        
        passwordContainerView.addSubview(passwordTextField)
        passwordContainerView.addSubview(clearButton)
        passwordContainerView.addSubview(eyeButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(116)
            $0.leading.equalToSuperview().offset(30)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(30)
        }
        
        passwordContainerView.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(42)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.height.equalTo(56)
        }
        
        eyeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        clearButton.snp.makeConstraints {
            $0.trailing.equalTo(eyeButton.snp.leading).offset(-10)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalTo(clearButton.snp.leading).offset(-8)
            $0.centerY.equalToSuperview()
        }
        
        checkImageView.snp.makeConstraints {
            $0.top.equalTo(passwordContainerView.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(35)
            $0.size.equalTo(14)
        }
        
        conditionLabel.snp.makeConstraints {
            $0.centerY.equalTo(checkImageView)
            $0.leading.equalTo(checkImageView.snp.trailing).offset(6)
        }
        
        nicknameButton.snp.makeConstraints {
            $0.top.equalTo(conditionLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        nicknameUnderlineView.snp.makeConstraints {
            $0.top.equalTo(nicknameButton.snp.bottom).offset(-4)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(56)
            $0.height.equalTo(1)
        }
        
        signUpButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.height.equalTo(56)
        }
    }
    
    private func setAction() {
        passwordTextField.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc private func passwordDidChange() {
        let text = passwordTextField.text ?? ""
        let isValid = isValidPassword(text)
        
        clearButton.isHidden = text.isEmpty
        
        signUpButton.isEnabled = isValid
        signUpButton.backgroundColor = isValid ? .watchaPink : .watchaGray400
        
        checkImageView.tintColor = isValid ? .watchaGreen : .watchaGray100
        conditionLabel.textColor = isValid ? .watchaGreen : .watchaGray100
    }
    
    @objc private func clearButtonTapped() {
        passwordTextField.text = ""
        passwordDidChange()
    }
    
    @objc private func eyeButtonTapped() {
        isPasswordVisible.toggle()
        passwordTextField.isSecureTextEntry = !isPasswordVisible
        
        let imageName = isPasswordVisible ? "eyeOnIcon" : "eyeOffIcon"
        eyeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc private func nicknameButtonTapped() {
        let bottomSheetVC = NicknameBottomSheetViewController()
        
        bottomSheetVC.onNicknameSelected = { [weak self] nickname in
            self?.nickname = nickname
            self?.nicknameButton.setTitle(nickname, for: .normal)
            self?.nicknameUnderlineView.isHidden = true
        }
        
        bottomSheetVC.modalPresentationStyle = .pageSheet
        
        if let sheet = bottomSheetVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 16
        }
        
        present(bottomSheetVC, animated: true)
    }
    
    @objc private func signUpButtonTapped() {
        let welcomeVC = WelcomeViewController(nickname: nickname)
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[^A-Za-z\\d]).{10,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
}

