//
//  ViewController.swift
//  Maraphon2ndTask
//
//  Created by Артем Соколовский on 04.07.2023.
//

import UIKit

class ViewController: UIViewController {
	
	lazy var stackOfButtons: UIStackView = {
		
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.distribution = .equalSpacing
		stackView.alignment = .center
		
		let firstButton = AnimatedButton(title: "First Button")
		stackView.addArrangedSubview(firstButton)
		
		let secondButton = AnimatedButton(title: "Second Medium Button")
		stackView.addArrangedSubview(secondButton)
		
		let thirdButton = AnimatedButton(title: "Third")
		thirdButton.buttonPressedDelegate = self
		stackView.addArrangedSubview(thirdButton)
		
		return stackView
	}()
	
	func openVC() {
		let vc = UIViewController()

		vc.view.backgroundColor = .yellow
		vc.modalPresentationStyle = .popover
		self.present(vc, animated: true)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: animated)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(stackOfButtons)
		
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		stackOfButtons.translatesAutoresizingMaskIntoConstraints = false
		
		let xCenter = stackOfButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		let yTop = stackOfButtons.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
		let height = stackOfButtons.heightAnchor.constraint(equalToConstant: 150)
		
		let constraints = [xCenter, yTop, height]
		
		NSLayoutConstraint.activate(constraints)
	}
}

extension ViewController: ButtonPressedDelegate {
	func didButtonPressed() {
		openVC()
		UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.allowUserInteraction, .curveEaseOut], animations: {
			self.stackOfButtons.arrangedSubviews[2].transform = .init(scaleX: 1, y: 1)
		})
	}
}

