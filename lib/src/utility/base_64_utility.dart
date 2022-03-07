import 'dart:convert';
import 'dart:typed_data';

abstract class Base64Utility {
  Uint8List decode(String input);
}

class LocalBase64Utility implements Base64Utility {
  final Base64Decoder _decoder;

  LocalBase64Utility(this._decoder);

  factory LocalBase64Utility.instance() =>
      LocalBase64Utility(const Base64Decoder());

  @override
  Uint8List decode(String input) {
    try {
      return _decoder.convert(input);
    } catch (e) {
      return Uint8List.fromList([]);
    }
  }
}
