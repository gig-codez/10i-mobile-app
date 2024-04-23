class Apis {
  static String devURL = "http://62.171.180.234:8000/v1";
  // auth routes.
  static String login = "$devURL/login";
  static String signUp = "$devURL/signup";
  static String logout = "$devURL/logout";
  static String recoverEmail = "$devURL/recover-email";
  static String recoverPhone = "$devURL/recover-tel";
  static String googleAuth = "$devURL/google-auth";
  static String verifyEmail = "$devURL/verify-email";
  static String resetPin = "$devURL/reset-pin";
  static String changePass = "$devURL/change-password";
  static String reasons = "$devURL/reasons";
  // proof od residence
  static String proofOfResidence = "$devURL/residency";
  static String countries = "$devURL/countries";
  // auth verification
  static String frontImage = "$devURL/verify-document-front";
  static String backImage = "$devURL/verify-document-back";
  static String selfieImage = "$devURL/verify-document-selfie";
  // complete profile.
  static String verifyPhone = "$devURL/verify-tel";
  static String completeProfile = "$devURL/profile";
  static String walletPin = "$devURL/pin";
  static String profilePic = "$devURL/profile-picture";
  static String captureFace = "$devURL/face";
  // payment routes
  static String paymentTypes = "$devURL/payment-types/";
  static String loadWallet = "$devURL/verify-momo-deposit";
  static String createWallet = "$devURL/wallets/create/";
  static String getWallet = "$devURL/get-user-wallet-balance";
  static String walletTransaction = "$devURL/wallettransactions/create/";
  // ------- wallet details ---------------
  static String walletDetails = "$devURL/wallets/user/";
  // --------- withdraws
  static String walletToBank = "$devURL/wallet-to-bank/";
  // contacts
  static String createContact = "$devURL/user-contacts/create/";
  static String allContatcts = "$devURL/user-contacts/user/";
  static String updateContact = "$devURL/user-contacts/update/";
  static String deleteContact = "$devURL/user-contacts/delete/";
  // transfers
  static String ugBanks = "https://api.flutterwave.com/v3/banks/UG";
  static String bankBranches =
      "https://api.flutterwave.com/v3/banks/966/branches";
  static String walletToMM = "$devURL/wallet-to-momo/";
}
