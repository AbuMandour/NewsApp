//
//  BaseViewController.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/22/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController {

    public enum State {
        case loading(message: String)
        case content(controller: UIViewController)
        case error(message: String)
        case empty(message: String)
    }

    public var state: State = .loading(message: "Loading") {
        didSet {
            applyState()
        }
    }

    private var contentController: UIViewController? {
        didSet {
            guard contentController != oldValue else { return }

            swapContent(newValue: contentController, oldValue: oldValue)
        }
    }

    private func viewController(for state: State) -> UIViewController {
        switch state {
        case .loading(let message):
            return MessageViewController(message: message, showSpinner: true)
        case .empty(let message), .error(let message):
            return MessageViewController(message: message, showSpinner: false)
        case .content(let controller):
            return controller
        }
    }

    private func applyState() {
        contentController = viewController(for: state)
    }

    private func swapContent(newValue: UIViewController?, oldValue: UIViewController?) {
        oldValue?.view.removeFromSuperview()
        oldValue?.removeFromParent()
        oldValue?.didMove(toParent: nil)

        guard let controller = newValue else { return }

        install(controller)
    }
    public override func loadViewIfNeeded() {
        view = UIView()

        applyState()

    }

}

