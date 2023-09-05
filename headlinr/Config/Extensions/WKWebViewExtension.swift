import Foundation
import WebKit

extension WKWebViewRepresentable {
    
    final class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        
        var parent: WKWebViewRepresentable
        private var webViews: [WKWebView]
        
        init(_ parent: WKWebViewRepresentable) {
            self.parent = parent
            self.webViews = []
        }
        
        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            
            if navigationAction.targetFrame == nil {
                
                // Approach 1
                // webView.load(navigationAction.request)
                
                // Approach 2
                let popupWebView = WKWebView(frame: .zero, configuration: configuration)
                popupWebView.navigationDelegate = self
                popupWebView.uiDelegate = self
                
                parent.webView.addSubview(popupWebView)
                popupWebView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    popupWebView.topAnchor.constraint(equalTo: parent.webView.topAnchor),
                    popupWebView.bottomAnchor.constraint(equalTo: parent.webView.bottomAnchor),
                    popupWebView.leadingAnchor.constraint(equalTo: parent.webView.leadingAnchor),
                    popupWebView.trailingAnchor.constraint(equalTo: parent.webView.trailingAnchor)
                ])
                
                self.webViews.append(popupWebView)
                return popupWebView
            }
            
            return nil
        }
    }
}
