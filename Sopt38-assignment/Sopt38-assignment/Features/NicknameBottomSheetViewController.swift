import UIKit
import SnapKit

final class NicknameBottomSheetViewController: UIViewController {
    
    var onNicknameSelected: ((String) -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.textColor = .watchaWhite
        label.font = .subhead1
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "닉네임"
        textField.textColor = .watchaWhite
        textField.font = .body1
        textField.backgroundColor = .watchaGray600
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(
            string: "닉네임",
            attributes: [.foregroundColor: UIColor.watchaGray300]
        )
        return textField
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("완료", for: .normal)
        button.titleLabel?.font = .subhead1
        button.setTitleColor(.watchaWhite, for: .normal)
        button.backgroundColor = .watchaGray600
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setAction()
    }
    
    private func setUI() {
        view.backgroundColor = .watchaGray400
        
        view.addSubview(titleLabel)
        view.addSubview(nicknameTextField)
        view.addSubview(completeButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(48)
            $0.leading.equalToSuperview().offset(24)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview().inset(28)
            $0.height.equalTo(56)
        }
        
        completeButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.height.equalTo(56)
        }
    }
    
    private func setAction() {
        completeButton.addTarget(
            self,
            action: #selector(completeButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func completeButtonTapped() {
        let nickname = nicknameTextField.text ?? ""
        
        if !nickname.isEmpty {
            onNicknameSelected?(nickname)
        }
        
        dismiss(animated: true)
    }
}

