import 'package:quliku/util/network.dart';

class ServiceLocator {
  static Network? _network = null;

  static Network get network {
    _network ??= Network();
    return _network as Network;
  }
}