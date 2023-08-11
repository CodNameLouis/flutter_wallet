import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_wallet_platform_interface.dart';

/// An implementation of [FlutterWalletPlatform] that uses method channels.
class MethodChannelFlutterWallet extends FlutterWalletPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_wallet');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
