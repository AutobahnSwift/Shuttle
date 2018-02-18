public enum Mock {
    public static let signIn200 = "{}"

    public static let authService200 = """
{
  "authServiceUrl": "https://idmsa.apple.com/appleauth",
  "authServiceKey": "e0b80c3bf78523bfe80974d320935bfa30add02e1bff88ec2166c6bd5a706c42"
}
"""

    public static let olympusSession200 = """
{
  "user": {
    "fullName": "Kaden Wilkinson",
    "emailAddress": "example@example.com",
    "prsId": "11219833707"
  },
  "provider": {
    "providerId": 1234567,
    "name": "Company, Inc.",
    "contentTypes": [
      "SOFTWARE"
    ]
  },
  "availableProviders": [
    {
      "providerId": 7654321,
      "name": "My Company, Inc.",
      "contentTypes": [
        "SOFTWARE"
      ]
    }
  ],
  "backingType": "ITC",
  "roles": [
    "ADMIN"
  ],
  "unverifiedRoles": [],
  "featureFlags": [],
  "agreeToTerms": true,
  "modules": [
    {
      "key": "Apps",
      "name": "ITC.HomePage.Apps.IconText",
      "localizedName": "My Apps",
      "url": "https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/ra/ng/app",
      "iconUrl": "https://itunesconnect.apple.com/itc/img/ico_homepage/MyApps.png",
      "down": false,
      "hasNotifications": false
    },
    {
      "key": "AppAnalytics",
      "name": "ITC.HomePage.AppAnalytics.IconText",
      "localizedName": "App Analytics",
      "url": "https://analytics.itunes.apple.com/",
      "iconUrl": "https://itunesconnect.apple.com/itc/img/ico_homepage/AppAnalytics.png",
      "down": false,
      "hasNotifications": false
    },
    {
      "key": "SalesTrends",
      "name": "ITC.HomePage.SalesTrends.IconText",
      "localizedName": "Sales and Trends",
      "url": "https://reportingitc2.apple.com/?",
      "iconUrl": "https://itunesconnect.apple.com/itc/img/ico_homepage/SalesandTrends.png",
      "down": false,
      "hasNotifications": false
    },
    {
      "key": "FinancialReports",
      "name": "ITC.HomePage.FinancialReports.IconText",
      "localizedName": "Payments and Financial Reports",
      "url": "https://itunesconnect.apple.com/itc/payments_and_financial_reports",
      "iconUrl": "https://itunesconnect.apple.com/itc/img/ico_homepage/financialReports.png",
      "down": false,
      "hasNotifications": false
    },
    {
      "key": "ManageUsers",
      "name": "ITC.HomePage.ManageUsers.IconText",
      "localizedName": "Users and Roles",
      "url": "https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/ra/ng/users_roles",
      "iconUrl": "https://itunesconnect.apple.com/itc/img/ico_homepage/UsersandRoles.png",
      "down": false,
      "hasNotifications": false
    },
    {
      "key": "ContractsTaxBanking",
      "name": "ITC.HomePage.ContractsTaxBanking.IconText",
      "localizedName": "Agreements, Tax, and Banking",
      "url": "https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/da/jumpTo?page=contracts",
      "iconUrl": "https://itunesconnect.apple.com/itc/img/ico_homepage/AgreementsandBanking.png",
      "down": false,
      "hasNotifications": false
    },
    {
      "key": "Resources",
      "name": "ITC.HomePage.Resources.IconText",
      "localizedName": "Resources and Help",
      "url": "https://itunespartner.apple.com/",
      "iconUrl": "https://itunesconnect.apple.com/itc/img/ico_homepage/resourcesAndhelp.png",
      "down": false,
      "hasNotifications": false
    }
  ],
  "helpLinks": [
    {
      "key": "All",
      "url": "https://itunespartner.apple.com",
      "localizedText": "All Resources and Help"
    },
    {
      "key": "News",
      "url": "https://itunespartner.apple.com/news/",
      "localizedText": "News"
    },
    {
      "key": "Guides",
      "url": "https://itunespartner.apple.com/guides/",
      "localizedText": "Guides"
    },
    {
      "key": "Videos",
      "url": "https://itunespartner.apple.com/videos/",
      "localizedText": "Videos"
    },
    {
      "key": "FAQ",
      "url": "https://itunespartner.apple.com/faq/",
      "localizedText": "FAQ"
    },
    {
      "key": "ContactUs",
      "url": "https://www.apple.com/itunes/go/itunesconnect/contactus",
      "localizedText": "Contact Us"
    }
  ]
}
"""

    public static let twoFactorCodeInfo200 = """
{
  "trustedPhoneNumbers": [
    {
      "numberWithDialCode": "•• (•••) •••-••12",
      "pushMode": "sms",
      "obfuscatedNumber": "(•••) •••-••12",
      "id": 1
    }
  ],
  "securityCode": {
    "length": 6,
    "tooManyCodesSent": false,
    "tooManyCodesValidated": false,
    "securityCodeLocked": false
  },
  "authenticationType": "hsa2",
  "recoveryUrl": "https://iforgot.apple.com/phone/add?prs_account_nm=example@gmail.com&autoSubmitAccount=true&appId=142",
  "cantUsePhoneNumberUrl": "https://iforgot.apple.com/iforgot/phone/add?context=cantuse&prs_account_nm=example@gmail.com&autoSubmitAccount=true&appId=142",
  "recoveryWebUrl": "https://iforgot.apple.com/password/verify/appleid?prs_account_nm=example@gmail.com&autoSubmitAccount=true&appId=142",
  "repairPhoneNumberUrl": "https://gsa.apple.com/appleid/account/manage/repair/verify/phone",
  "repairPhoneNumberWebUrl": "https://appleid.apple.com/widget/account/repair?#!repair",
  "aboutTwoFactorAuthenticationUrl": "https://support.apple.com/kb/HT204921",
  "autoVerified": false,
  "showAutoVerificationUI": false,
  "managedAccount": false,
  "trustedPhoneNumber": {
    "numberWithDialCode": "•• (•••) •••-••12",
    "pushMode": "sms",
    "obfuscatedNumber": "(•••) •••-••612",
    "id": 1
  },
  "supportsRecovery": true,
  "hsa2Account": true
}
"""
}
