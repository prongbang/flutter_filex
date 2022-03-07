import 'dart:typed_data';

class FileX {
  String prefix;
  String filename;
  String directory;
  String extension;
  Uint8List? bytes;
  String? base64;

  bool get hasBytes => bytes?.isNotEmpty ?? false;

  bool get hasBase64 => base64?.isNotEmpty ?? false;

  static const String png = '.png';
  static const String gif = '.gif';
  static const String jpg = '.jpg';
  static const String jpeg = '.jpeg';
  static const String pdf = '.pdf';
  static const String svg = '.svg';
  static const String webp = '.webp';

  FileX({
    this.prefix = '',
    this.filename = '',
    this.directory = '',
    this.extension = '',
    this.bytes,
    this.base64,
  });
}
