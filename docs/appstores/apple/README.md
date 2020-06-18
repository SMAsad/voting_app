# setting up codesigning on macos for ios builds

The current set up is to (when possible) use delegated Apple IDs for damage control (hopefully we never need it, tho).

## prereqs

* XCode
* `brew install cocoapods`
* You'll need someone with admin or manager permissions for the app to grant you codesigning capability. This is _not_ something that is distributed willy-nilly.

## steps

* Dev
  - ensure you have your apple id available; the admin will need it when inviting you.

* Admin
  - login
  - select the correct organisation "flux foundation" (under your name in top right)
  - menu > people ([direct link](https://appstoreconnect.apple.com/access/users))
  - (If you see "go to app store connect" button, click it. You can tick the "take me straight there" checkbox at the bottom, too.)
  - Tab > People
  - Click "+" icon above list of accounts, form comes up
  - fill it in. make sure to check the "Access to Certificates, Identifiers & Profiles" box
  - click "invite"

* Dev (browser)
  - click "accept invitation" in the invite email
  - login to apple dev portal, accept terms of service
  - go to "my account" ([direct link](https://developer.apple.com/account))
  - click "certificates, identifiers & profiles" (more ToS probably)
  - click "+" ([create a new certificate](https://developer.apple.com/account/resources/certificates/add))
  - select "iOS App Development"
  - (need to generate CSR now, come back in a bit)

* Dev (xcode)
  - Start up XCode
  - Go to Preferences > Accounts
  - Add "apple id" and sign in if you have not already done so
  - double click "flux foundation" to bring up signing certs
  - "+" > apple development
  - done with preferences
  - open `ios/Runner.xcodeproj`
  - select "project navigator" view-thing (top left corner, looks like a folder icon, in a bar wiht 9ish icons total including a magnifying glass, warning triangle, tag-label, speech-bubble)
  - double click "Runner" (at root of heirarchy in left hand sidebar)
  - under "Runner.xcodeproj" that opens, select "signing & capabilities" tab
  - make sure "automatically manage signing" is checked for tabs: "all", "debug", and "release", also that bundle identifier is correct
  - 



  - Open "Keychain Access" (located in /Applications/Utilities) 
  - Menubar > Keychain Access > Certificate Assistant > Request a Certificate from a Certificate Authority
  - fill in your email, your name, and `appadmin[at]voteflux.org` for the email (replacing `[at]` with `@` ofc)

  