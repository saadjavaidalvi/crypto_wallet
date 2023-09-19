import 'dart:convert';

class Profile {
  String? email;
  String? id;
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? state;
  String? referredBy;
  String? phone;
  String? walletAddress;
  String? referralCode;
  int? referredUsersCount;
  bool? isIndividual;
  bool? isPro;
  String? country;

  Profile({
    this.email,
    this.id,
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.state,
    this.referredBy,
    this.phone,
    this.isIndividual,
    this.isPro,
    this.referralCode,
    this.referredUsersCount,
    this.walletAddress,
    this.country,
  });

  Profile copyWith({
    String? email,
    String? id,
    String? firstName,
    String? lastName,
    String? address,
    String? city,
    String? state,
    String? rCode,
    String? phone,
    String? walletAddress,
    String? referralCode,
    int? referredUsersCount,
    bool? isIndividual,
    bool? isPro,
    String? country,
  }) {
    return Profile(
      email: email ?? this.email,
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      referredBy: rCode ?? referredBy,
      phone: phone ?? this.phone,
      walletAddress: walletAddress ?? this.walletAddress,
      referralCode: referralCode ?? this.referralCode,
      referredUsersCount: referredUsersCount ?? this.referredUsersCount,
      isIndividual: isIndividual ?? this.isIndividual,
      isPro: isPro ?? this.isPro,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'city': city,
      'state': state,
      'referredBy': referredBy,
      'phone': phone,
      'country': country,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      email: map['email'],
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      referredBy: map['referredBy'],
      phone: map['phone'],
      walletAddress: map['walletAddress'],
      referralCode: map['referralCode'],
      referredUsersCount: map['referredUsersCount'],
      isIndividual: map['isIndividual'],
      isPro: map['isPro'] ?? false,
      country: map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Profile(email: $email, id: $id, firstName: $firstName, lastName: $lastName, address: $address, city: $city, state: $state, referredBy: $referredBy, number: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Profile &&
        other.email == email &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.address == address &&
        other.city == city &&
        other.state == state &&
        other.referredBy == referredBy &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        referredBy.hashCode ^
        phone.hashCode;
  }
}
