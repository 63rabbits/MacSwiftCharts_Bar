//
//  ViewController.swift
//  MacSwiftCharts_Bar
//
//  Created by rabbit on 2025/05/10.
//

import Cocoa
import SwiftUI


class ViewController: NSViewController {

    private var contentView: NSHostingView<ContentView>!
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

        contentView = NSHostingView(rootView: ContentView(viewModel: contentViewModel))
        self.view.addSubview(contentView)
        contentView.frame = .init(origin: .init(x: 0, y: 0), size: .init(width: 500, height: 400))
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: contentView.superview!.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: contentView.superview!.centerYAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: contentView.superview!.widthAnchor, constant: -100).isActive = true
        contentView.heightAnchor.constraint(equalTo: contentView.superview!.heightAnchor, constant: -100).isActive = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

