//
//  StorybookPageView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import WebKit
import SwiftUI
import YDS_SwiftUI
import UniformTypeIdentifiers

private enum Dimension {
    enum Spacing {
        static let vstack: CGFloat = 16
    }

    enum Padding {
        static let vstack: CGFloat = 16
    }
}

struct OptionListItem: View {
    private let option: Option

    init(option: Option) {
        self.option = option
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.Spacing.vstack) {
            option.body
            Divider()
        }
        .padding(Dimension.Padding.vstack)
    }
}

struct StorybookPageView<ViewType: View>: View {
    @ViewBuilder private var sample: () -> ViewType
    @Binding private var code: String
    @State var isShowCodeBlock: Bool = false

    private let options: [Option]

    init(sample: @escaping () -> ViewType, options: [Option], code: Binding<String> = .constant("")) {
        self.sample = sample
        self.options = options
        _code = code
    }

    var body: some View {
        VStack(spacing: 0) {
            sampleExpaned
            Divider()
            if isShowCodeBlock {
                ScrollView {
                    HStack(alignment: .top, spacing: 0) {
                        WebView(code: code)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
                            .ignoresSafeArea(edges: .all)
                            .padding(.trailing, 20)
                        YDSBoxButton(
                            text: "복사하기",
                            action: {
                                UIPasteboard.general.string = code
                                YDSToast("복사 되었습니다!", duration: .short, haptic: .success)
                            }
                        )
                    }
                }
                .padding(20)
            } else {
                scrollableOptions
            }
        }
        .toolbar {
            if !code.isEmpty {
                Button {
                    isShowCodeBlock.toggle()
                } label: {
                    Label("Code", systemImage: "curlybraces.square.fill")
                }
            }
        }
        .registerYDSToast()
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension StorybookPageView {
    var sampleExpaned: some View {
        sample()
            .frame(maxWidth: .infinity, maxHeight: YDSScreenSize.width * 3/4)
            .background(
                Rectangle()
                    .fill(YDSColor.monoItemBG)
            )
    }

    var scrollableOptions: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(options.indices, id: \.self) { index in
                    OptionListItem(option: options[index])
                }
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    var code: String

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            let escapedCode = self.parent.code
                .replacingOccurrences(of: "\\", with: "\\\\")
                .replacingOccurrences(of: "`", with: "\\`")
                .replacingOccurrences(of: "\"", with: "\\\"")
                .replacingOccurrences(of: "\'", with: "\\'")
            let jsString = "displayMessage(`\(escapedCode)`);"
            webView.evaluateJavaScript(jsString, completionHandler: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let filePath = Bundle.main.path(forResource: "CodeViewer", ofType: "html") {
            let url = URL(fileURLWithPath: filePath)
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

struct StorybookPageView_Previews: PreviewProvider {
    static var previews: some View {
        enum BoxButtonType: CaseIterable {
            case filled, tinted, line
        }

        let icons = YDSSwiftUIIcon.icons

        @State var text: String? = "BoxButton"
        @State var isDisabled = false
        @State var lineLimit: Int? = 1
        @State var selectedBoxButtonType = 0
        @State var icon: SwiftUIIcon?
        @State var code: String = "Hello world"

        return StorybookPageView(
            sample: {
                Button {} label: {
                    HStack {
                        if let icon = icon?.icon {
                            icon
                        }
                        Text(text ?? "")
                            .lineLimit(lineLimit)
                    }
                }
                .disabled(isDisabled)
            },
            options: [
                Option.bool(description: "isDisabled", isOn: $isDisabled),
                Option.optionalInt(description: "lineLimit", value: $lineLimit),
                Option.enum(
                    description: "buttonType",
                    cases: BoxButtonType.allCases,
                    selectedIndex: $selectedBoxButtonType
                ),
                Option.optionalString(description: "text", text: $text),
                Option.optionalIcon(description: "icon", icons: icons, selectedIcon: $icon, placeholderIndex: 0)
            ],
            code: $code
        )
    }
}
