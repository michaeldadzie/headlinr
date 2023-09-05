import SwiftUI

struct PlaceHolderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(.gray)
            .frame(width: 100, height: 100)
    }
}

struct PlaceHolderImageView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceHolderImageView()
    }
}
