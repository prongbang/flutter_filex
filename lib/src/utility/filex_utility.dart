import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_filex/flutter_filex.dart';

abstract class FileXUtility {
  Future<String> write(FileX fileX);

  Future<Uint8List> readAsBytes(FileX fileX);

  Future<String> readAsString(FileX fileX);

  Future<String> exists(FileX fileX);

  Future<File> toFile(FileX fileX);
}

class FileXLocalUtility implements FileXUtility {
  final DirectoryUtility _directoryUtility;
  final Base64Utility _base64utility;

  FileXLocalUtility(this._directoryUtility, this._base64utility);

  @override
  Future<String> write(FileX fileX) async {
    File file = await _getFile(fileX);
    if (!fileX.hasBytes || !fileX.hasBase64) {
      return '';
    }

    var bytes = fileX.bytes;
    if (fileX.hasBase64) {
      bytes = _base64utility.decode(fileX.base64!);
    }

    await file.writeAsBytes(bytes!);

    return file.path;
  }

  @override
  Future<String> exists(FileX fileX) async {
    File file = await _getFile(fileX);
    if (await file.exists()) {
      return file.path;
    }
    return '';
  }

  Future<File> _getFile(FileX fileX) async {
    final dir = await _directoryUtility.directory();
    if (dir == null) {
      throw FileSystemException('Directory not found.');
    }
    return File(
        '${dir.path}/${fileX.prefix}${fileX.filename}${fileX.extension}');
  }

  @override
  Future<Uint8List> readAsBytes(FileX fileX) async {
    final file = await _getFile(fileX);
    return file.readAsBytes();
  }

  @override
  Future<String> readAsString(FileX fileX) async {
    final file = await _getFile(fileX);
    return file.readAsString();
  }

  @override
  Future<File> toFile(FileX fileX) async => _getFile(fileX);
}
