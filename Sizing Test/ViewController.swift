//
//  ViewController.swift
//  Sizing Test
//
//  Created by Seb Vidal on 17/03/2022.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var containerView: UIView!
    var backgroundView: UIView!
    var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Setup scrollView
        // Able to scroll in both directions.
        scrollView = UIScrollView()
        scrollView.backgroundColor = .secondarySystemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        // MARK: Setup stackView
        // Used because UIStackViews play nicely with UIScrollViews.
        // UIScrollView contentSize is inferred automatically from UIStackView's intrinsicContentSize.
        stackView = UIStackView()
        stackView.alignment = .fill
        stackView.backgroundColor = .systemBlue  // Background is systemBlue, but should never be seen.
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(stackView)
        
        // Constraints setup to allow scrollView to scroll
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        // MARK: Setup containerView
        // A container View is required to centre the backgroundView in the UIScrollView, but only when...
        // ...the backgroundView is smaller than the size of the scrollView.
        containerView = UIView()
        containerView.backgroundColor = .systemTeal
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(containerView)
        
        // Constrain the containerView to be at least the size of the scrollView.
        // It should be able to grow, in the case that it's subviews expand.
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(greaterThanOrEqualTo: scrollView.widthAnchor),
            containerView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ])
        
        // MARK: Setup backgroundView
        backgroundView = UIView()
        backgroundView.backgroundColor = .systemOrange
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            // backgroundView should always be at a 16:9 aspect-ratio.
            backgroundView.widthAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 1.777),
            
            // backgroundView should always be in the centre of the containerView (and therefore scrollView)
            backgroundView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            // Setup a minimum distance the backgroundView can be from the containerView.
            backgroundView.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor, constant: 20),
            backgroundView.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 20),
        ])
        
        // MARK: Setup textView
        textView = UITextView()
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(greaterThanOrEqualTo: backgroundView.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(greaterThanOrEqualTo: backgroundView.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(lessThanOrEqualTo: backgroundView.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(lessThanOrEqualTo: backgroundView.bottomAnchor, constant: -20)
        ])
            #warning("These are the problem constraints. Enabling these will cause the orange backgroundView to fill as much of the containerView's available space as possible.")
//            textView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
//            textView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
//        ])
    }
}
