//
//  BookedAppointmentCell.swift
//  Eco carwash Drive
//
//  Created by Indium Software on 20/12/21.
//

import UIKit

class BookedAppointmentCell: UITableViewCell {
    
    @IBOutlet weak var customerNameLbl: UILabel!
    @IBOutlet weak var customerAddressLbl: UILabel!
    @IBOutlet weak var cleanerNameLbl: UILabel!
    @IBOutlet weak var completedObLbl: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var cleanerStackView: UIStackView!
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var completedDateTitleLbl: UILabel!

}
