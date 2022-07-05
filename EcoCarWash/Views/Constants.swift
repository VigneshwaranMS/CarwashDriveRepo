//
//  Constants.swift
//  iJob
//
//  Created by Athiban Ragunathan on 07/01/18.
//  Copyright © 2018 Athiban Ragunathan. All rights reserved.
//

import UIKit

struct REGEX {
    static let phone_indian = "^(?:(?:\\+|0{0,2})91(\\s*[\\-]\\s*)?|[0]?)?[789]\\d{9}$"
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static let phone_aus = "([(0),(+61)][23478]){0,1}[1-9][0-9]{7}"
  
}

struct AppFontName {
    static let regular = "BwSurcoDEMO-Regular"
    static let bold = "BwSurcoDEMO-Bold"
    static let semiBold = "BwSurcoDEMO-Medium"
    static let italic = "CourierNewPS-ItalicMT"
}

enum GrantType : String {
    case password = "password"
    case refreshToken = "refresh_token"
}

struct API {
    
    static let scope = "api1 offline_access"
    static let clientId = "ro.angular"
    static let clientSecret = "secret"
    static let baseURL = "49.204.124.186"
    static let scheme = "http"
    static let port = 15000
    static let auth = "/auth/"
    static let path = "/api/"
    static let staff = "/staff/"
}

struct ImageURL {
    static let imageBasePath = "https://app.kindercare.colanonline.in/public/uploads/user/thumb/" // Need to check
}

extension API {
    
    static var fullBaseUrl : String {
        get {
            return API.scheme + "://" + API.baseURL
        }
    }
}

struct GOOGLE {
    static let placesAPI_KEY = "AIzaSyDZog9UAKCrOh64_g4kYqZywPasy41hZc0"
}

struct DEVICE {
    static let deviceType = "2"
   // static let uuid = KeychainManager.sharedInstance.getDeviceIdentifierFromKeychain()
    static let deviceModel = UIDevice.current.model
    static let systemVersion = UIDevice.current.systemVersion
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    static let buildNo = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "100"
}


class Constants: NSObject {
    static let shared = Constants()
    static let appDelegateRef : AppDelegate = AppDelegate.getAppdelegateInstance()!
    static var LAST_SELECTED_INDEX_N_PICKER = 0
    
    struct StoryboardIdentifier {
        static let TutorialVC = "TutorialViewController"
        static let rootVC       = "RootViewController"
        static let loginVC      = "LoginViewController"
        static let mapVC        = "MapViewController"
        static let leftMenuVC   = "leftMenuViewController"
        static let forgetPwdVC  = "ForgetPasswordViewController"
        static let signUpVC     = "SignUpViewController"
        static let selectYourCarVC = "SelectYourCarViewController"
        static let mobNoVerificationVC = "MobileNoVerificationViewController"
        static let selectCarPopUpVC = "SelectCarPopUpViewController"
        static let profileVC = "ProfileViewController"
        static let settingsVC = "SettingsViewController"
        static let appointmentVC = "AppointmentViewController"
        static let bookAppointmentVC = "BookAppointmentViewController"
        static let serviceTypeVC = "ServiceTypeViewController"
        static let TimeSlotsVC = "TimeSlotsViewController"
        static let SummaryVC = "SummaryViewController"
        static let couponVC = "CouponViewController"
        static let AddressSelectionVC = "AddressSelectionViewController"
        static let confirmAddressVC = "ConfirmAddressViewController"
        static let saveAddressVC = "SaveAddressViewController"
        static let openImageVC = "OpenImageViewController"
        static let yourOrdersVC = "YourOrdersViewController"
        static let orderDetailVC = "OrderDetailViewController"
        static let RatingVC = "RatingViewController"
        static let reviewVC = "ReviewViewController"
        static let navigateVC = "NavigateViewController"
        static let setOnMapVC = "SetOnMapVC"
        static let productDetailsVC = "ProductDetailsVC"
        static let giftVC = "GiftVC"
        static let giftProductVC = "GiftProductVC"
        static let giftCouponVC = "GiftCouponVC"
        static let paymentVC = "PaymentVC"
    }
    
    struct TableViewCellID {
        static let AccesoriesCell         = "AccesoriesCell"
        static let ServiceTableViewCell   = "ServiceTableViewCell"
        static let ServiceHeaderView      = "ServiceHeaderView"
        static let CouponCell             = "CouponCell"
        static let AddressTableViewCell   = "AddressTableViewCell"
        static let VisitedStoreCell       = "VisitedStoreCell"
        static let ServiceTypeCell        = "ServiceTypeCell"
        static let BookedAppointmentCell  = "BookedAppointmentCell"
        static let ServiceTypeHeaderCell  = "ServiceTypeHeaderCell"
        static let ServiceCell            = "ServiceCell"
        static let ReviewCell             = "ReviewCell"
        static let UpcomingCell           = "UpcomingCell"
        static let AddressCell            = "AddressCell"
        static let GiftDetailCell         = "GiftDetailCell"
    }
    
    struct CollectionViewID {
        static let SlotDateCollectionCell   = "SlotDateCollectionCell"
        static let CarImageCollectionCell   = "CarImageCollectionCell"
        static let RatingImageCell          = "RatingImageCell"
    }

    struct UserdefaultKey {
        static let password = "password"
    }
    
    // Custom Date Picker
    class func viewControllerWithName(identifier: String) ->UIViewController {
           let storyboard = UIStoryboard(name: "Leave", bundle: nil)
           return storyboard.instantiateViewController(withIdentifier: identifier)
       }
    
//     func getCustomPickerInstance() -> CustomPicker{
//        let customPickerObj =   Constants.viewControllerWithName(identifier:"CustomPickerStoryboard") as! CustomPicker
//           return customPickerObj
//    }
    
//    func getFilterInstance() -> FilterVC{
//        let filterObj = Constants.viewControllerWithName(identifier:"FilterVC") as! FilterVC
//           return filterObj
//    }
//    func getLeaveFilterInstance() -> LeaveApprovalFilterViewController{
//        let filterObj = Constants.viewControllerWithName(identifier:"LeaveApprovalFilterViewController") as! LeaveApprovalFilterViewController
//           return filterObj
//    }
}

func showAlertView(title: String, msg: String, controller: UIViewController, okClicked: @escaping ()->()){
    let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
            print("OK")
            okClicked()
        }
        //alertController.view.tintColor = BASECOLOR
        alertController.addAction(okAction);
        controller.present(alertController, animated: true, completion: nil)
}

func showAlertWith(title : String,
                  message: String,
                  controller: UIViewController,
                  okBtnName: String = "OK",
                  cancelBtnName: String = "Cancel",
                  okayHandler: @escaping ((_ okPressed: Bool)->Void),
                  cancelHandler:@escaping ((_ cancelPressed: Bool)->Void)) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    
    alert.addAction(UIAlertAction(title: okBtnName, style: UIAlertAction.Style.default, handler: { action in
        okayHandler(true)
    }))
    
    alert.addAction(UIAlertAction(title: cancelBtnName, style: .destructive, handler: { action in
        cancelHandler(true)
    }))
        
    controller.present(alert, animated: true, completion: nil)
}

struct AppointmentInfo {
    static var details: AppointmentInfo = AppointmentInfo()

    var date        : String = ""
    var storeID     : Int = 0
    var services    : [Int] = []
    var total_time  : Int = 0
    var amount_paid : Int = 0
    var payment_type   : PaymentType = .None
    var user_address   : String = ""
    var payment_status : PaymentStatus = .None
    var appointment_nature: AppointmentNature = .none
}

extension Notification.Name {
    static let RefreshMap = Notification.Name("RefreshMap")
    static let UPDATEINFO = Notification.Name("UPDATE_USER_DATA")
}

enum AppointmentNature: String {
    case Store = "Store", Mobile = "Mobile", none = ""
}

enum AppointmentType {
    case Normal, RAC
}

enum PaymentType {
    case Credit, Debit, Cash_On_Delivery, UPI, None
}

enum PaymentStatus {
    case Paid, Unpaid, None
}

enum ServiceType: String {
    case Interior = "Interior",
         Exterior = "Exterior"
}

enum ServiceProvide: String {
    case Standard = "Standard",
         Premium  = "Premium"
}

enum Meridiem: String {
    case Am = "AM", Pm = "PM"
}

enum UploadCarImage: String {
    case Before = "Before", After = "After", Review = "Review"
}

enum AppointmentStatus: String {
    case Created     = "Created"
    case Accepted    = "Accepted"
    case Assigned    = "Cleaner_Assigned"
    case Departed    = "Cleaner_Departed"
    case Reached     = "Cleaner_Reached"
    case Progress    = "Cleaning_In_Progress"
    case Done        = "Cleaning_Done"
    case Completed   = "Completed"
    case Cancelled   = "Cancelled"
    case Rescheduled = "Rescheduled"
    case Reviewed    = "Reviewed"
    
    var image: UIImage? {
        switch self {
        case .Accepted, .Assigned, .Departed, .Rescheduled, .Created: return UIImage(named: "Departed")
        case .Reached: return UIImage(named: "Reached")
        case .Progress: return UIImage(named: "Progress")
        case .Done, .Completed, .Cancelled, .Reviewed: return UIImage(named: "Completed")
        }
    }
}
