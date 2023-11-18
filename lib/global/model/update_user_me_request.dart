class UpdateMeRequestBody {
  String? fullName;
  String? email;
  String? password;
  String? dateOfBirth;
  String? profilePicture;
  List<Address>? addresses;
  List<PaymentCard>? paymentCard;
  bool? isPhoneNumberVerified;
  bool? isActive;

  UpdateMeRequestBody({
    this.fullName,
    this.email,
    this.password,
    this.dateOfBirth,
    this.profilePicture,
    this.addresses,
    this.paymentCard,
    this.isPhoneNumberVerified,
    this.isActive,
  });

  factory UpdateMeRequestBody.fromJson(Map<String, dynamic> json) =>
      UpdateMeRequestBody(
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        dateOfBirth: json["dateOfBirth"],
        profilePicture: json["profilePicture"],
        addresses: json["addresses"] == null
            ? []
            : List<Address>.from(
                json["addresses"]!.map((x) => Address.fromJson(x))),
        paymentCard: json["paymentCard"] == null
            ? []
            : List<PaymentCard>.from(
                json["paymentCard"]!.map((x) => PaymentCard.fromJson(x))),
        isPhoneNumberVerified: json["isPhoneNumberVerified"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (fullName != null) {
      map["fullName"] = fullName;
    }
    if (email != null) {
      map["email"] = email;
    }

    if (password != null) {
      map["password"] = password;
    }
    if (password != null) {
      map["password"] = password;
    }

    if (dateOfBirth != null) {
      map["dateOfBirth"] = dateOfBirth;
    }

    if (profilePicture != null) {
      map["profilePicture"] = profilePicture;
    }

    if (addresses != null) {
      map["addresses"] = List<dynamic>.from(addresses!.map((x) => x.toJson()));
    }

    if (paymentCard != null) {
      map["paymentCard"] =
          List<dynamic>.from(paymentCard!.map((x) => x.toJson()));
    }

    if (isPhoneNumberVerified != null) {
      map["isPhoneNumberVerified"] = isPhoneNumberVerified;
    }

    if (isActive != null) {
      map["isActive"] = isActive;
    }

    return map;
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  String? zip;

  Address({
    this.street,
    this.city,
    this.state,
    this.zip,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "zip": zip,
      };
}

class PaymentCard {
  String? cardHolderName;
  String? cardNumber;
  String? expiryDate;

  PaymentCard({
    this.cardHolderName,
    this.cardNumber,
    this.expiryDate,
  });

  factory PaymentCard.fromJson(Map<String, dynamic> json) => PaymentCard(
        cardHolderName: json["cardHolderName"],
        cardNumber: json["cardNumber"],
        expiryDate: json["expiryDate"],
      );

  Map<String, dynamic> toJson() => {
        "cardHolderName": cardHolderName,
        "cardNumber": cardNumber,
        "expiryDate": expiryDate,
      };
}
