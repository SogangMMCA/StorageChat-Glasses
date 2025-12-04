//
//  InitialViewController.swift
//  MmcaVer2.0
//
//  Created by Lim on 5/16/24.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var Language: UIButton!
    @IBOutlet weak var Seoul: UIButton!
    @IBOutlet weak var Guwacheon: UIButton!
    @IBOutlet weak var deoksugoong: UIButton!
    @IBOutlet weak var cheongju: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLanguageMenu()
        // 각 버튼의 속성 설정
        setupButton(Seoul)
        setupButton(Guwacheon)
        setupButton(deoksugoong)
        setupButton(cheongju)
    }
    
    func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = 10 // 모서리 굴곡률
        button.layer.borderWidth = 2   // 테두리 굵기
        button.layer.borderColor = UIColor.black.cgColor // 테두리 색상
    }
    
    
    private func configureLanguageMenu() {
            let languageMenuClosure = { (action: UIAction) in
                switch action.title {
                case "KO : 한국어":
                    print("한국어 선택됨")
                    // 한국어 선택 시 수행할 추가적인 동작
                case "EN : English":
                    print("English 선택됨")
                    // 영어 선택 시 수행할 추가적인 동작
                default:
                    break
                }
            }
            
            let menu = UIMenu(title: "Choose Language", children: [
                UIAction(title: "KO : 한국어", handler: languageMenuClosure),
                UIAction(title: "EN : English", handler: languageMenuClosure)
            ])
            
            Language.menu = menu
            Language.showsMenuAsPrimaryAction = true
        }
    
    @IBAction func Seoul(_ sender: UIButton) {
        animateButton(sender) // 애니메이션 추가
        switchToTab(index: 1)
    }

    @IBAction func Guwacheon(_ sender: UIButton) {
        animateButton(sender) // 애니메이션 추가
        switchToTab(index: 1)
    }

    @IBAction func deoksugoong(_ sender: UIButton) {
        animateButton(sender) // 애니메이션 추가
        switchToTab(index: 1)
    }

    @IBAction func cheongju(_ sender: Any) {
        animateButton(sender as! UIButton) // 애니메이션 추가
        switchToTab(index: 1)
    }

    // 버튼 애니메이션 함수
    private func animateButton(_ button: UIButton) {
        // 버튼을 검정색으로 변경
        UIView.animate(withDuration: 0.3, animations: {
            button.backgroundColor = .black // 배경색 변경
            button.setTitleColor(.white, for: .normal) // 텍스트 색상 변경
        }) { _ in
            // 애니메이션 완료 후 원래 상태로 돌아가기
            UIView.animate(withDuration: 0.3, delay: 0.5, options: [], animations: {
                button.backgroundColor = .clear // 원래 배경색으로 복원
                button.setTitleColor(.black, for: .normal) // 원래 텍스트 색상으로 복원
            }, completion: nil)
        }
    }

    
    private func switchToTab(index: Int) {
        guard let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController else {
            return
        }
        tabBarController.selectedIndex = index
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true, completion: nil)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
