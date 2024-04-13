import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintService {
  final localAuth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    try {
      final canCheckBiometrics = await localAuth.canCheckBiometrics;
      return canCheckBiometrics;
    } on PlatformException catch (e) {
      print('Error checking biometrics: $e');
      return false;
    }
  }

  Future<bool> authenticate() async {
    bool isAvailable = await isBiometricAvailable();
    if (!isAvailable) {
      return false; // Biometrics not available on device
    }

    try {
      final authenticated = await localAuth.authenticate(
        localizedReason: 'Please authenticate to access the app securely',
      );
      return authenticated;
    } on PlatformException catch (e) {
      if (e.code == 'LocalAuthError: canceled') {
        return false; // User canceled authentication
      } else if (e.code == 'LocalAuthError: userFallback') {
        return false; // User chose to use a fallback method (e.g., PIN)
      } else {
        print('Error during authentication: $e');
        return false;
      }
    }
  }
}
