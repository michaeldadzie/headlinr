import SwiftUI
import WebKit

struct WKWebViewRepresentable: UIViewRepresentable {
    
    typealias UIViewType = WKWebView

    var url: URL
    var webView: WKWebView
    
    init(url: URL, webView: WKWebView = WKWebView()) {
        self.url = url
        self.webView = webView
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
