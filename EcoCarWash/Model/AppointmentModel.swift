//
//  AppointmentModel.swift
//  Eco Car Wash Service
//
//  Created by Indium Software on 29/11/21.
//

import Foundation

// MARK: - StoreListModel
struct StoreListModel: Codable {
    let version: String?
    let statusCode: Int?
    let data: [Store]?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - Stores
struct Store: Codable {
    let id: Int?
    let name: String?
    let address: Address?
    let mobileNo, email, image, rating: String?
    let status, distance, createdOn: String?
    let storeTimings: StoreTimings?

    enum CodingKeys: String, CodingKey {
        case id, name, address
        case mobileNo = "mobile_no"
        case email, image, rating, status, distance
        case createdOn = "created_on"
        case storeTimings = "store_timings"
    }
}

// MARK: - StoreTimings
struct StoreTimings: Codable {
    let startTime, endTime: String?

    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case endTime = "end_time"
    }
}

// MARK: - ServiceListModel
struct ServiceListModel: Codable {
    let version: String?
    let statusCode: Int?
    let data: [Service]?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - Datum
struct Service: Codable {
    let id: Int?
    let serviceType, serviceNature, title, price: String?
    let timetaken: Int?
    let status, createdOn, updatedOn: String?
    let carType: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case serviceType = "service_type"
        case serviceNature = "service_nature"
        case title, price, timetaken, status
        case createdOn = "created_on"
        case updatedOn = "updated_on"
        case carType = "car_type"
    }
}

// MARK: - BookedSlotListModel
struct BookedSlotListModel: Codable {
    let version: String?
    let statusCode: Int?
    let data: SlotInfo?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - DataClass
struct SlotInfo: Codable {
    let startTime, endTime: String?
    let bookedSlots: [BookedSlot]?

    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case endTime = "end_time"
        case bookedSlots = "booked_slots"
    }
}

// MARK: - BookedSlot
struct BookedSlot: Codable {
    let date: String?
    let totalTime: Int?
    let linkedRac: Int?
    let startTime, endTime: String?

    enum CodingKeys: String, CodingKey {
        case date
        case totalTime = "total_time"
        case linkedRac = "linked_rac"
        case startTime = "start_time"
        case endTime = "end_time"
    }
}

// MARK: - CouponModel
struct CouponDTO: Codable {
    let version: String?
    let statusCode: Int?
    let data: [Coupon]?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - Datum
struct Coupon: Codable {
    let id: Int?
    let code, couponDescription, discount: String?

    enum CodingKeys: String, CodingKey {
        case id, code
        case couponDescription = "description"
        case discount
    }
}

// MARK: - BookAppointmentModel
struct BookAppointmentModel: Codable {
    let version: String?
    let statusCode: Int?
    let message: String?
    let data: Appointment?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case message = "Message"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - DataClass
struct Appointment: Codable {
    let id: Int?
    let address: AppointmentAddress?
    let date: String?
    let totalTime: Int?
    let appointmentNature, appointmentType, paymentType, paymentStatus: String?
    let amountPaid, appointmentStatus, status, createdOn: String?
    let updatedOn: String?
//    let cleaner, customer: Customer?
    let store, userCar: Int?
    let linkedRac: String?
    let appliedCoupon: Int?
    let services: [Service]?
    let paymentInfo: PaymentInfo?

    enum CodingKeys: String, CodingKey {
        case id, address, date
        case totalTime = "total_time"
        case appointmentNature = "appointment_nature"
        case appointmentType = "appointment_type"
        case paymentType = "payment_type"
        case paymentStatus = "payment_status"
        case amountPaid = "amount_paid"
        case appointmentStatus = "appointment_status"
        case status
        case createdOn = "created_on"
        case updatedOn = "updated_on"
        case store
        case userCar = "user_car"
        case linkedRac = "linked_rac"
        case appliedCoupon = "applied_coupon"
        case services
        case paymentInfo = "payment_info"
    }
}

// MARK: - AppointmentAddress
struct AppointmentAddress: Codable {
    let address: String?
    let latitude, longitude: Double?
}

// MARK: - GetAppointmentModel
struct GetAppointmentDTO: Codable {
    let version: String?
    let statusCode: Int?
    let data: [BookedAppointment]?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - Datum
struct BookedAppointment: Codable {
    let id: Int?
    let date, startTime: String?
    let totalTime, linkedRac: Int?
    let appointmentNature, appointmentType, paymentType, paymentStatus: String?
    let amountPaid, appointmentStatus, status, trackingID: String?
    let cleaner, customer: Customer?
    let appliedCoupon: Coupon?
    let store: Store?
    let address: Address?
    let userCar: UserCarDetails?
    let services: [Service]?
    let appointmentImages: [AppointmentImage]?
    let appointmentRating: AppointmentRating?

    enum CodingKeys: String, CodingKey {
        case id, date
        case totalTime = "total_time"
        case appointmentNature = "appointment_nature"
        case appointmentType = "appointment_type"
        case paymentType = "payment_type"
        case paymentStatus = "payment_status"
        case linkedRac = "linked_rac"
        case amountPaid = "amount_paid"
        case appointmentStatus = "appointment_status"
        case status, cleaner, customer
        case appliedCoupon = "applied_coupon"
        case store, address
        case userCar = "user_car"
        case services
        case appointmentImages = "appointment_images"
        case appointmentRating = "appointment_rating"
        case trackingID = "tracking_id"
        case startTime = "start_time"
    }
}

// MARK: - Customer
struct Customer: Codable {
    let name, username, email, profileImage: String?

    enum CodingKeys: String, CodingKey {
        case name, username, email
        case profileImage = "profile_image"
    }
}

// MARK: - Store
struct AppointmentStore: Codable {
    let address, name: String?
    let image: String?
    let email, mobileNo, rating: String?
    let latitude, longitude: Double?

    enum CodingKeys: String, CodingKey {
        case address, name, image, email
        case mobileNo = "mobile_no"
        case rating, latitude, longitude
    }
}

// MARK: - AppointmentImage
struct AppointmentImage: Codable {
    let id: Int?
    let imageType: String?
    let image: String?
    let appointment: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case imageType = "image_type"
        case image, appointment
    }
}

// MARK: - AppointmentRating
struct AppointmentRating: Codable {
    let rating: Int?
    let review: String?
}

// MARK: - GetAppointmentModel
struct CommonDTO: Codable {
    let version: String?
    let statusCode: Int?
    let message: String?
    let data: SlotData?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case message = "Message"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - DataClass
struct SlotData: Codable {
    
}

// MARK: - PostRatingModel
struct PostRatingModel: Codable {
    let version: String?
    let statusCode: Int?
    let message: String?
    let data: Rating?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case message = "Message"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - DataClass
struct Rating: Codable {
    let id, rating: Int?
    let review: String?
    let isApproved: Bool?
    let createdOn, updatedOn, user: String?
    let appointment: Int?

    enum CodingKeys: String, CodingKey {
        case id, rating, review
        case isApproved = "is_approved"
        case createdOn = "created_on"
        case updatedOn = "updated_on"
        case user, appointment
    }
}

// MARK: - ReviewModel
struct ReviewModel: Codable {
    let version: String?
    let statusCode: Int?
    let data: ReviewData?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - DataClass
struct ReviewData: Codable {
    let count: Int?
    let next, previous: String?
    let results: [Rating]?
}

// MARK: - SlotAvailabilityModel
struct SlotAvailabilityModel: Codable {
    let version: String?
    let statusCode: Int?
    let data: AvailableSlot?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - DataClass
struct AvailableSlot: Codable {
    let slotStatus: String?

    enum CodingKeys: String, CodingKey {
        case slotStatus = "slot_status"
    }
}

// MARK: - AppointmentImageModel
struct RatingImageModel: Codable {
    let version: String?
    let statusCode: Int?
    let message: String?
    let data: AppointmentImage?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case message = "Message"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - ProductModel
struct ProductModel: Codable {
    let version: String?
    let statusCode: Int?
    let data: ProductData?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - DataClass
struct ProductData: Codable {
    let id: Int?
    let name, dataDescription, price: String?
    let stock: Int?
    let image, status, createdOn, updatedOn: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case dataDescription = "description"
        case price, stock, image, status
        case createdOn = "created_on"
        case updatedOn = "updated_on"
    }
}

struct GetPaymentModel: Codable {
    let version: String?
    let statusCode: Int?
    let message: String?
    let data: Payment?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case message = "Message"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - DataClass
struct Payment: Codable {
    let paymentInfo: PaymentInfo?

    enum CodingKeys: String, CodingKey {
        case paymentInfo = "payment_info"
    }
}

// MARK: - PaymentInfo
struct PaymentInfo: Codable {
    let status: Int?
    let message: String?
    let paymentURL: String?

    enum CodingKeys: String, CodingKey {
        case status, message
        case paymentURL = "payment_url"
    }
}

// MARK: - UpdateAppointmentModel
struct UpdateAppointmentModel: Codable {
    let version: String?
    let statusCode: Int?
    let message: String?
    let data: Appointment?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case statusCode = "StatusCode"
        case message = "Message"
        case data = "Data"
        case status = "Status"
    }
}

// MARK: - DataClass
struct UpdateAppointment: Codable {
    let id: Int?
    let totalTime: Int?
    let date, appointmentNature, appointmentType, paymentType, paymentStatus: String?
    let amountPaid, appointmentStatus, status, createdOn: String?
    let updatedOn, customer: String?
    let cleaner: String?
    let store, address, userCar, linkedRac: Int?
    let appliedCoupon: Int?
    let services: [Int]?

    enum CodingKeys: String, CodingKey {
        case id, date
        case totalTime = "total_time"
        case appointmentNature = "appointment_nature"
        case appointmentType = "appointment_type"
        case paymentType = "payment_type"
        case paymentStatus = "payment_status"
        case amountPaid = "amount_paid"
        case appointmentStatus = "appointment_status"
        case status
        case createdOn = "created_on"
        case updatedOn = "updated_on"
        case customer, cleaner, store, address
        case userCar = "user_car"
        case linkedRac = "linked_rac"
        case appliedCoupon = "applied_coupon"
        case services
    }
}
