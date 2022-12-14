import 'package:local_auth/local_auth.dart';

class FingerPrintAuthentication {
  static final _auth = LocalAuthentication();
  static Future<bool> authenticate() async {
    final isAvailable = await _auth.canCheckBiometrics;

    if (!isAvailable) {
      return false;
    }
    try {
      final result = await _auth.authenticate(
          localizedReason: 'Scan fingerprint',
          options: const AuthenticationOptions(
              useErrorDialogs: true, stickyAuth: true));
      return result;
    } catch (e) {
      return false;
    }
  }
}
