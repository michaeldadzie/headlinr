import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
