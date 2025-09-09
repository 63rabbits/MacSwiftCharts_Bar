//
//  ViewController.swift
//  MacSwiftCharts_Bar
//
//  Created by rabbit on 2025/05/10.
//

import Cocoa
import SwiftUI


class ViewController: NSViewController {

    @State private var contentViewModel = ContentViewModel()

    override func viewDidAppear() {
        self.view.window!.center()
        self.view.window?.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
            "Set TARGETS > General > Identity > Display Name"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        contentViewModel.data = [
            .init(category: "apple",        value: 100),
            .init(category: "mikan",        value: 200),
            .init(category: "banana",       value: 300),
            .init(category: "orange",       value: 200),
            .init(category: "grape",        value: 500),
            .init(category: "melon",        value: 300),
            .init(category: "kiwi",         value: 200),
        ]

        let hostingView = NSHostingView(rootView: ContentView(viewModel: contentViewModel))
        self.view.addSubview(hostingView)
        hostingView.frame = .init(origin: .init(x: 0, y: 0), size: .init(width: 500, height: 400))
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        hostingView.centerXAnchor.constraint(equalTo: hostingView.superview!.centerXAnchor).isActive = true
        hostingView.centerYAnchor.constraint(equalTo: hostingView.superview!.centerYAnchor).isActive = true
        hostingView.widthAnchor.constraint(equalTo: hostingView.superview!.widthAnchor, constant: -100).isActive = true
        hostingView.heightAnchor.constraint(equalTo: hostingView.superview!.heightAnchor, constant: -100).isActive = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

