class Urls {
  final String baseUrl =
      'https://12f8-2a09-bac1-5b20-28-00-277-65.ngrok-free.app';

  String createGetUser() {
    return '$baseUrl/user';
  }

  String getUser(int id) {
    return '$baseUrl/user/$id';
  }

  final String createGasLessTransactionUrl =
      "https://api.defender.openzeppelin.com/autotasks/b5673801-f847-4c68-9876-cfb37aa17ac3/runs/webhook/ef55e67c-4237-4afe-999d-95ae84889ac5/N2cWkjvB9y3Hx1YwCfHysG";
}

class FirebaseUrls {
  final String baseUrl =
      'https://us-central1-tavecchiacoin-alvi-edition.cloudfunctions.net';

  static String signin() {
    return '${FirebaseUrls().baseUrl}/signin';
  }

  static String createTransactionSurveyPay() {
    return '${FirebaseUrls().baseUrl}/createTransactionSurveyPay';
  }

  static String transferTAV() {
    return '${FirebaseUrls().baseUrl}/transferTAV';
  }

  static String addProfileInfo() {
    return '${FirebaseUrls().baseUrl}/addProfileInfo';
  }

  static String getDailySalary() {
    return '${FirebaseUrls().baseUrl}/getDailySalary';
  }

  static String getTAVPrice() {
    return '${FirebaseUrls().baseUrl}/getTAVPrice';
  }

  static String storeFcmToken() {
    return '${FirebaseUrls().baseUrl}/storeFcmToken';
  }

  static String transferToSurveyPay() {
    return '${FirebaseUrls().baseUrl}/transferToSurveyPay';
  }

  static String assignDexTradeCoupon() {
    return '${FirebaseUrls().baseUrl}/assignDexTradeCoupon';
  }
}
