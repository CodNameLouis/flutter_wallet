import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_wallet_method_channel.dart';

abstract class FlutterWalletPlatform extends PlatformInterface {
  /// Constructs a FlutterWalletPlatform.
  FlutterWalletPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterWalletPlatform _instance = MethodChannelFlutterWallet();

  /// The default instance of [FlutterWalletPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterWallet].
  static FlutterWalletPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterWalletPlatform] when
  /// they register themselves.
  static set instance(FlutterWalletPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
