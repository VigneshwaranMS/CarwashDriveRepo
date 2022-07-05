//
//  AppointmentServiceManager.swift
//  Eco Car Wash Service
//
//  Created by Indium Software on 29/11/21.
//

import Foundation
import UIKit

enum AppointmentServiceManager {
    
    case listStores(distance: String, latitude: String, longitude: String)
    case listService(carType: Int, storeId: Int)
    case bookedSlotList(date: String, storeId: String)
    case checkSlotavailability(_info: CheckSlotAvailabilityRequest)
    case listCoupons
    case bookAppointment(_info: BookAppointmentRequest)
    case ListAppointment(status: String)
    case getAppointment(appointmentId: String)
    case deleteAppointment(appointmentId: String)
    case appointmentRating(_info: RatingRequest)
    case getRatingList(isRating: Bool)
    case manageAppointmentImage(image_type : String, appointment : Int, imgArr: [UIImage])
    case getProduct
    case getPaymentURL(apointmentID: Int)
    case updateAppointment(id: String, request: PaymentRequest)

    var scheme: String {
        switch self {
        case .listStores, .listService, .bookedSlotList, .listCoupons, .bookAppointment, .ListAppointment, .deleteAppointment, .getAppointment, .appointmentRating, .getRatingList, .checkSlotavailability, .manageAppointmentImage, .getProduct, .getPaymentURL, .updateAppointment : return API.scheme
        }
    }
    
    var host: String {
        switch self {
        case .listStores, .listService, .bookedSlotList, .listCoupons, .bookAppointment, .ListAppointment, .deleteAppointment, .getAppointment, .appointmentRating, .getRatingList, .checkSlotavailability, .manageAppointmentImage, .getProduct, .getPaymentURL, .updateAppointment : return API.baseURL
        }
    }
    
    var port:Int{
        switch self {
        case .listStores, .listService, .bookedSlotList, .listCoupons, .bookAppointment, .ListAppointment, .deleteAppointment, .getAppointment, .appointmentRating, .getRatingList, .checkSlotavailability, .manageAppointmentImage, .getProduct, .getPaymentURL, .updateAppointment : return API.port
        }
    }
    
    var path: String {
        switch self {
        case .listStores:  return API.path + "list_stores/"
        case .listService: return API.path + "list_services/"
        case .bookedSlotList: return API.path + "list_booked_slots/"
        case .listCoupons: return API.path + "list_coupons/"
        case .bookAppointment, .ListAppointment : return API.path + "manage_appointments/"
        case .getAppointment(let id), .deleteAppointment(let id), .updateAppointment(let id, _) : return API.path + "manage_appointments/" + id + "/"
        case .appointmentRating, .getRatingList : return API.path + "manage_rating/"
        case .checkSlotavailability: return API.path + "manage_appointments/check_availability/"
        case .manageAppointmentImage: return API.staff + "manage_appointment_images/"
        case .getProduct: return API.path + "manage_ecommerce_user/"
        case .getPaymentURL: return API.path + "manage_appointments/get_payment_url/"
        }
    }
    
    var method: String {
        switch self {
        case .listStores, .listService, .bookedSlotList, .listCoupons, .ListAppointment, .getAppointment, .getRatingList, .getProduct, .getPaymentURL : return "GET"
        case .bookAppointment, .appointmentRating, .checkSlotavailability, .manageAppointmentImage : return "POST"
        case .deleteAppointment : return "DELETE"
        case .updateAppointment: return "PATCH"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .listStores(let distance, let latitude, let longitude) : return [URLQueryItem(name: "distance", value: distance), URLQueryItem(name: "latitude", value: latitude), URLQueryItem(name: "longitude", value: longitude)]
        
        case .listService(let carType, let storeId) : return [URLQueryItem(name: "car_type", value: "\(carType)"), URLQueryItem(name: "store_id", value: "\(storeId)")]
       
        case .bookedSlotList(let date, let storeId) : return [URLQueryItem(name: "date", value: date), URLQueryItem(name: "store_id", value: storeId)]
      
        case .getRatingList(let isRating) : return [URLQueryItem(name: "user_ratings", value: "\(isRating)".lowercased())]

        case .ListAppointment(let status): return [URLQueryItem(name: "status", value: status)]
            
        case .getPaymentURL(let id): return [URLQueryItem(name: "appointment_id", value: "\(id)")]
            
        case .listCoupons, .bookAppointment, .deleteAppointment, .getAppointment, .appointmentRating, .checkSlotavailability, .manageAppointmentImage, .getProduct, .updateAppointment : return nil
        }
    }
    
    var headerFields: [String : String]
    {
        switch self {
        case .listStores, .listService, .bookedSlotList, .listCoupons, .bookAppointment, .ListAppointment, .deleteAppointment, .getAppointment, .appointmentRating, .getRatingList, .checkSlotavailability, .manageAppointmentImage, .getProduct, .getPaymentURL, .updateAppointment : return [:]
        }
    }
    
    var body: Data? {
        switch self {
        case .listStores, .listService, .bookedSlotList, .listCoupons, .ListAppointment, .deleteAppointment, .getAppointment, .getRatingList, .manageAppointmentImage, .getProduct, .getPaymentURL : return nil
        case .bookAppointment(let request):
            print(request)
            let encoder = JSONEncoder()
            return try? encoder.encode(request)
        case .appointmentRating(let request):
            print(request)
            let encoder = JSONEncoder()
            return try? encoder.encode(request)
        case .checkSlotavailability(let request):
            print(request)
            let encoder = JSONEncoder()
            return try? encoder.encode(request)
        case .updateAppointment(_, let request) :
            print(request)
            let encoder = JSONEncoder()
            return try? encoder.encode(request)
        }
    }
    
    var formDataParameters : [String : Any]? {
        
        switch self {
        case .listStores, .listService, .bookedSlotList, .listCoupons, .bookAppointment, .ListAppointment, .deleteAppointment, .getAppointment, .appointmentRating, .getRatingList, .checkSlotavailability, .getProduct, .getPaymentURL, .updateAppointment : return nil

        case .manageAppointmentImage(let image_type, let appointment, let imgArr):
            
            var parameters: [String: Any] = ["appointment" : appointment, "image_type"  : image_type]
          
            for (i, img) in imgArr.enumerated() {
                let key = "image_\(i + 1)"
                parameters[key] = img
            }
            
            print(parameters)
            return parameters
        }
    }
}
