# Fillr iOS Swift SDK

Swift Package Manager distribution for the Fillr iOS SDK.

## Libraries

| Library | Description |
|---|---|
| `FillrAutofillSDK` | Autofill functionality for iOS apps |
| `FillrCartScraperSDK` | Cart scraping functionality for iOS apps |

Both libraries include the shared `FillrSDK`, `FillrAPI`, and `FillrAnalytics` frameworks.

## Requirements

- iOS 13.0+
- Swift 5.3+
- Xcode 26+

## Authentication

The packages are hosted on a private JFrog Artifactory repository. Before adding the package, configure your credentials in `~/.netrc`:

```
machine fillr.jfrog.io
login jfrog-username
password jfrog-password
```

Replace `jfrog-username` and `jfrog-password` with your provided credentials.

## Installation

### Xcode

1. In Xcode, go to **File > Add Package Dependencies**
2. Enter the repository URL
3. Select the version rule (e.g. **Up to Next Major** from `4.0.0`)
4. Choose either `FillrAutofillSDK` or `FillrCartScraperSDK` (or both) as the package product to add to your target

### Package.swift

Add the package as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/rewards-fillr/fillr-ios-swift", from: "4.0.0")
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["FillrAutofillSDK"]  // or "FillrCartScraperSDK"
    )
]
```

## Usage

### FillrSDK Setup
```swift
import FillrSDK
override func viewDidLoad() {
    super.viewDidLoad()

    // Initialise and configure the SDK
    let remoteDepAuth = FillrWidgetAuth(username: "UserName", password: "Password   ")
    let fillrConfig = FillrConfig(devKey: "FillrDevKey", secretKey: "FillrSecretKey", remoteDependencyAuth: remoteDepAuth)
    let fillr = Fillr.sharedInstance()

    fillr.initialise(with: fillrConfig)
}

extension ViewController : WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if Fillr.sharedInstance().canHandleWebViewRequest(navigationAction.request) {
            Fillr.sharedInstance().handleWebViewRequest(navigationAction.request, for: webView)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        Fillr.sharedInstance().trackWebview(webView)
        Fillr.sharedInstance().handleWebViewDidStartLoad(webView)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Fillr.sharedInstance().handleWebViewDidStartLoad(webView)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Fillr.sharedInstance().handleWebViewDidFinishLoad(webView)
    }
}

```
### FillrAutofillSDK

```swift
import FillrAutofillSDK

override func viewDidLoad() {
    super.viewDidLoad()

    // Initialise and configure the SDK
    FillrAutofill.sharedInstance.enabled = true
    FillrAutofill.sharedInstance.profilePayloadDelegate = self
    FillrAutofill.sharedInstance.fillProvider = provider
    Fillr.sharedInstance().trackWebview(webView)
}

extension ViewController: FillrProfilePayloadDelegate {
    
    func onProfilePayloadRequestedForWebView(_ webView: UIView, mappingResult: [String : Any], requestedFields: [Any], selectedFields: [String : Any]) {

        print("Fields detected \(requestedFields.debugDescription)")

        let samplePayload = [
            "PersonalDetails.Honorific": "Mr.",
            "PersonalDetails.FirstName": "John",
            "PersonalDetails.MiddleName": "Middle",
            "PersonalDetails.LastName": "South",
            "PersonalDetails.BirthDate.Year": "1999",
            "PersonalDetails.BirthDate.Month": "1",
            "PersonalDetails.BirthDate.Day": "11",
            "PersonalDetails.Gender" : "Male",

            "PersonalDetails.SocialSecurityNumber": "865414088",
            "PersonalDetails.TaxFileNumber": "865414088",
            "PersonalDetails.Role": "Director",
            "PersonalDetails.CompanyName": "Starks",

            "ContactDetails.Emails.Email.Address": "john.south@fillr.com",
            "ContactDetails.CellPhones.CellPhone.CountryCode": "61",
            "ContactDetails.CellPhones.CellPhone.Number": "0455667788",
            "ContactDetails.LandlinePhones.LandlinePhone.CountryCode": "1",
            "ContactDetails.LandlinePhones.LandlinePhone.AreaCode": "208",
            "ContactDetails.LandlinePhones.LandlinePhone.Number": "4561343",

            "AddressDetails.PostalAddress.AddressLine1": "27 Oakmont Drive",
            "AddressDetails.PostalAddress.StreetNumber": "27",
            "AddressDetails.PostalAddress.StreetName": "Oakmont",
            "AddressDetails.PostalAddress.StreetType": "Drive",
            "AddressDetails.PostalAddress.Suburb": "Brentwood",
            "AddressDetails.PostalAddress.AdministrativeArea": "California",
            "AddressDetails.PostalAddress.PostalCode": "94513",
            "AddressDetails.PostalAddress.Country": "United States",

            "AddressDetails.BillingAddress.AddressLine1": "27 Oakmont Drive",
            "AddressDetails.BillingAddress.StreetNumber": "27",
            "AddressDetails.BillingAddress.StreetName": "Oakmont",
            "AddressDetails.BillingAddress.StreetType": "Drive",
            "AddressDetails.BillingAddress.Suburb": "Brentwood",
            "AddressDetails.BillingAddress.AdministrativeArea": "California",
            "AddressDetails.BillingAddress.PostalCode": "94513",
            "AddressDetails.BillingAddress.Country": "United States",

            "CreditCards.CreditCard.Number":"6868686868686868",
            "CreditCards.CreditCard.Type": "Mastercard",
            "CreditCards.CreditCard.Expiry": "06-2018",
            "CreditCards.CreditCard.Expiry.Month": "06",
            "CreditCards.CreditCard.Expiry.Year": "2020",
            "CreditCards.CreditCard.NameOnCard": "John South",
            "CreditCards.CreditCard.CCV": "678"
        ]
        FillrAutofill.sharedInstance.fillForm(with: mappingResult, andPayload: samplePayload, withFieldSelections: selectedFields)
    }


```

### FillrCartScraperSDK

```swift
import FillrCartScraperSDK

override func viewDidLoad() {
    super.viewDidLoad()

    // Initialise and configure the SDK
    FillrCartScraper.sharedInstance.setCartInformationExtractionEnabled(true)
    FillrCartScraper.sharedInstance.setCartInformationExtractionDelegate(self)
}

extension ViewController: FillrCartInformationExtractionDelegate {
    func onCartDetected(webView: WKWebView, cartInformation: FillrCartScraperSDK.FillrCartInformation) {
        print("Cart detected with \(cartInformation.products?.count ?? 0) products")
    }
}
```

## Support

Contact [support@fillr.com](mailto:support@fillr.com) for credentials or integration assistance.
