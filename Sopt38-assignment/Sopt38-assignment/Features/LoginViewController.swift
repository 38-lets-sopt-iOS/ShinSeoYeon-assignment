import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인/가입하려는\n이메일을 입력해주세요"
        label.textColor = .watchaWhite
        label.font = .head2
        label.numberOfLines = 2
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요"
        label.textColor = .watchaGray500
        label.font = .body1
        label.numberOfLines = 2
        return label
    }()
    
    private let textFieldContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .watchaGray600
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email@address.com"
        textField.textColor = .watchaWhite
        textField.font = .body1
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.attributedPlaceholder = NSAttributedString(
            string: "email@address.com",
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
    
    private let checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "enableOnIcon"), for: .normal)
        button.tintColor = .watchaGray300
        button.isHidden = true
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다음", for: .normal)
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
        
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(textFieldContainer)
        view.addSubview(nextButton)
        
        textFieldContainer.addSubview(emailTextField)
        textFieldContainer.addSubview(clearButton)
        textFieldContainer.addSubview(checkButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(116)
            $0.leading.equalToSuperview().offset(30)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(30)
        }
        
        textFieldContainer.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.height.equalTo(56)
        }
        
        checkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        clearButton.snp.makeConstraints {
            $0.trailing.equalTo(checkButton.snp.leading).offset(-10)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        emailTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalTo(clearButton.snp.leading).offset(-8)
            $0.centerY.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.height.equalTo(56)
        }
    }
    
    private func setAction() {
        emailTextField.addTarget(self, action: #selector(emailDidChange), for: .editingChanged)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc private func emailDidChange() {
        let hasText = !(emailTextField.text ?? "").isEmpty
        
        clearButton.isHidden = !hasText
        checkButton.isHidden = !hasText
        
        nextButton.isEnabled = hasText
        nextButton.backgroundColor = hasText ? .watchaPink : .watchaGray400
    }
    
    @objc private func clearButtonTapped() {
        emailTextField.text = ""
        emailDidChange()
    }
    
    @objc private func nextButtonTapped() {
        let passwordVC = PasswordInputViewController(email: emailTextField.text ?? "")
        navigationController?.pushViewController(passwordVC, animated: true)
    }
    
}
