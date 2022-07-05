//
//  AppointmentViewModel.swift
//  Eco Car Wash Service
//
//  Created by Indium Software on 29/11/21.
//

import Foundation
import UIKit


protocol AppointmentDelegate {
    func getStoreList(_storeListData: [Store])
    func getServiceList(_serviceList: [Service])
    func getBookedSlotInfo(_bookedSlotInfo: SlotInfo)
    func getCouponListInfo(_couponList: [Coupon])
    func bookAppointment(_appointmentInfo: BookAppointmentModel)
    func appointmentList(_appointmentList: [BookedAppointment])
    func ratingList(_ratingList: [Rating])
    func getProduct(_product: ProductData)
    func getPaymentURL(_obj: PaymentInfo)
    func successful(message: String)
    func failure(message: String)
}

struct BookAppointmentRequest: Codable {
    let services : [Int]
    let date : String
    let start_time: String
//    let total_time : Int
    let appointment_nature: String
    let appointment_type: String
    let payment_type: String
    let payment_status: String
    let amount_paid : Double
    let store: Int
    let user_car: Int
    let address: String
    let latitude: Double
    let longitude: Double
    let applied_coupon: Int
    let product_id: Int
    let product_quantity: Int
}

struct RatingRequest: Codable {
    let rating: Int
    let review: String
    let is_approved: Bool
    let appointment: Int
}

struct CheckSlotAvailabilityRequest: Codable {
    let services: [Int]
    let date: String
    let start_time: String
    let store_id: Int
}

struct UploadImageRequest: Codable {
    let image_type  : String
    let appointment : Int
    let image_1     : String
    let image_2     : String
    let image_3     : String
}

struct PaymentRequest: Codable {
    let payment_status  : String
    let payment_ref_id  : Int
}

class AppointmentViewModel {
    
    var delegate: AppointmentDelegate!
    
    func getStoreListFrom(distance: String, lat: String, long: String) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.listStores(distance: distance, latitude: lat, longitude: long), completion: { (result : Result<StoreListModel, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  : self.delegate.getStoreList(_storeListData: data.data ?? [])
                    
                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }
    
    func getServiceListFrom(carType: Int, storeId: Int) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.listService(carType: carType, storeId: storeId), completion: { (result : Result<ServiceListModel, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  : self.delegate.getServiceList(_serviceList: data.data ?? [])
                    
                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }

    func getBookedSlotList(date: String, storeId: String) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.bookedSlotList(date: date, storeId: storeId), completion: { (result : Result<BookedSlotListModel, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  :
                    
                    if let data = data.data {
                        self.delegate.getBookedSlotInfo(_bookedSlotInfo: data)
                    }

                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }

    func checkSlotAvailability(info: CheckSlotAvailabilityRequest) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.checkSlotavailability(_info: info), completion: { (result : Result<SlotAvailabilityModel, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  :
                    
                    if let data = data.data {
                        if let slotStatus = data.slotStatus {
                            self.delegate.successful(message: slotStatus)
                        }
                    }
                    
                case .failure(let error) :
                    
                    self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }
    
    func getCoupon() {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.listCoupons, completion: { (result : Result<CouponDTO, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  : self.delegate.getCouponListInfo(_couponList: data.data ?? [])

                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }

    func bookAppointment(info: BookAppointmentRequest) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.bookAppointment(_info: info), completion: { (result : Result<BookAppointmentModel, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  : self.delegate.bookAppointment(_appointmentInfo: data)
                    
                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }
    
    func getAppointmentList(status: String = "all") {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.ListAppointment(status: status), completion: { (result : Result<GetAppointmentDTO, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  : self.delegate.appointmentList(_appointmentList: data.data ?? [])

                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }

    func deleteAppointmentList(id: String) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.deleteAppointment(appointmentId: id), completion: { (result : Result<CommonDTO, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  : self.delegate.successful(message: data.message ?? "")

                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }
    
    func getAppointment(by id: String) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.getAppointment(appointmentId: id), completion: { (result : Result<GetAppointmentDTO, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  : self.delegate.appointmentList(_appointmentList: data.data ?? [])

                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }
    
    func postAppointmentRating(info: RatingRequest) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.appointmentRating(_info: info), completion: { (result : Result<PostRatingModel, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  : self.delegate.successful(message: data.message ?? "")
                    
                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }
    
    func getReviewList(by isRating: Bool) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.getRatingList(isRating: isRating), completion: { (result : Result<ReviewModel, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  :
                    
                    if let ratingList = data.data?.results {
                        self.delegate.ratingList(_ratingList: ratingList)
                    }
                    
                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }
    
    func updateAppointmentImage(image_type: String, appointment: Int, imgArr: [UIImage]) {
        
        AppointmentServiceHelper.requestFormData(router: AppointmentServiceManager.manageAppointmentImage(image_type: image_type, appointment: appointment, imgArr: imgArr), completion: { (result : Result<RatingImageModel, CustomError>) in
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let data) :
//                    self.delegate.successful(message: data.message ?? "")
                    break
                    
                case .failure(let error):
                    self.delegate.failure(message: "\(error)")

                }
            }
        })
    }
    
    func getProduct() {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.getProduct, completion: { (result : Result<ProductModel, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  :
                    
                    if let product = data.data {
                        self.delegate.getProduct(_product: product)
                    }
                    
                case .failure(let error) : self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }
    
    func getPaymentUrl(id: Int) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.getPaymentURL(apointmentID: id), completion: { (result : Result<GetPaymentModel, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data)  :
                    
                    if let paymentData = data.data?.paymentInfo {
                        self.delegate.getPaymentURL(_obj: paymentData)
                    }
                    
                case .failure(let error) :
                    
                    self.delegate.failure(message: "\(error)")
                    
                }
            }
        })
    }
    
    func updateAppointment(id: String, info: PaymentRequest) {
        
        AppointmentServiceHelper.request(router: AppointmentServiceManager.updateAppointment(id: id, request: info), completion: { (result : Result<UpdateAppointmentModel, CustomError>) in
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let data) : self.delegate.successful(message: data.message ?? "")

                case .failure(let error): self.delegate.failure(message: "\(error)")

                }
            }
        })
    }

}
