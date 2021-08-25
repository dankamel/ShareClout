//
//  TestingInstaSharing.swift
//  ShareClout
//
//  Created by Daniel Kamel on 23/08/2021.
//

import SwiftUI

struct InstagramShareView: View {

  var imageToShare: Image {
    // An image defined in your app's asset catalogue.
    return Image("BigBitCloutLogo")
  }

  var body: some View {
    VStack {

      // Display the image that will be shared to Instagram.
      imageToShare

      if InstagramSharingUtils.canOpenInstagramStories {
        Button(action: { InstagramSharingUtils.shareToInstagramStories(#imageLiteral(resourceName: "BigBitCloutLogo"))}) {
          Text("Share to Instagram Stories")
        }
      } else {
        Text("Instagram is not available.")
      }
    }
  }
}

struct InstagramShareView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InstagramShareView()
        }
    }
}
