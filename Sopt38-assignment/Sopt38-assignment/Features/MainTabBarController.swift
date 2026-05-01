import UIKit

import SnapKit
import Then

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        setViewControllers()
    }
    
    // 탭바 공통스타일 설정하는 함수
    private func setTabBar() {
        tabBar.do {
            $0.backgroundColor = .watchaBlack
            $0.tintColor = .watchaWhite
            $0.unselectedItemTintColor = .watchaGray500
        }
    }
    
    // 탭바에 들어갈 각 화면 만드는 함수
    private func setViewControllers() {
        
        // 구독
        let subscribeVC = UIViewController()
        subscribeVC.view.backgroundColor = .watchaBlack
        
        let subscribeLabel = UILabel().then {
            $0.text = "구독"
            $0.textColor = .watchaWhite
            $0.font = .head2
            $0.textAlignment = .center
        }
        
        subscribeVC.view.addSubview(subscribeLabel)
        subscribeLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        subscribeVC.tabBarItem = UITabBarItem(
            title: nil,  // 이미 에셋에 타이틀이 포함되어있음..
            image: UIImage(named: "subscribeTabIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "subscribeTabIcon")?.withRenderingMode(.alwaysOriginal)
        )
        
        
        // 개별 구매
        let purchaseVC = UIViewController()
        purchaseVC.view.backgroundColor = .watchaBlack
        
        let purchaseLabel = UILabel().then {
            $0.text = "개별 구매"
            $0.textColor = .watchaWhite
            $0.font = .head2
            $0.textAlignment = .center
        }
        
        purchaseVC.view.addSubview(purchaseLabel)
        purchaseLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        purchaseVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "purchaseTabIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "purchaseTabIcon")?.withRenderingMode(.alwaysOriginal)
        )
        
        
        // 웹툰
        let webtoonVC = UIViewController()
        webtoonVC.view.backgroundColor = .watchaBlack
        
        let webtoonLabel = UILabel().then {
            $0.text = "웹툰"
            $0.textColor = .watchaWhite
            $0.font = .head2
            $0.textAlignment = .center
        }
        
        webtoonVC.view.addSubview(webtoonLabel)
        webtoonLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        webtoonVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "webtoonTabIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "webtoonTabIcon")?.withRenderingMode(.alwaysOriginal)
        )
        
        
        // 서치
        let searchVC = UIViewController()
        searchVC.view.backgroundColor = .watchaBlack
        
        let searchLabel = UILabel().then {
            $0.text = "찾기"
            $0.textColor = .watchaWhite
            $0.font = .head2
            $0.textAlignment = .center
        }
        
        searchVC.view.addSubview(searchLabel)
        searchLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        searchVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "searchTabIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "searchTabIcon")?.withRenderingMode(.alwaysOriginal)
        )
        
        
        // 보관함
        let libraryVC = UIViewController()
        libraryVC.view.backgroundColor = .watchaBlack
        
        let libraryLabel = UILabel().then {
            $0.text = "보관함"
            $0.textColor = .watchaWhite
            $0.font = .head2
            $0.textAlignment = .center
        }
        
        libraryVC.view.addSubview(libraryLabel)
        libraryLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        libraryVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "archiveTabIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "archiveTabIcon")?.withRenderingMode(.alwaysOriginal)
        )
        
        
        // 탭에 넣기
        viewControllers = [
            subscribeVC,
            purchaseVC,
            webtoonVC,
            searchVC,
            libraryVC
        ]
    }
}
