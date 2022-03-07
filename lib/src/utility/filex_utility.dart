import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_filex/flutter_filex.dart';
import 'package:flutter_filex/src/utility/directory_creator.dart';

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
  final DirectoryCreator _directoryCreator;

  FileXLocalUtility(
    this._directoryUtility,
    this._base64utility,
    this._directoryCreator,
  );

  @override
  Future<String> write(FileX fileX) async {
    File file = await _getFile(fileX);

    // Check base64
    var bytes = fileX.bytes;
    if (fileX.hasBase64) {
      bytes = _base64utility.decode(fileX.base64!);
    }

    // Check byte is null
    if (bytes == null) {
      throw const FileSystemException('Byte of array is null.');
    }

    // Write to file
    await file.writeAsBytes(bytes);

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
    // Get root directory
    final dir = await _directoryUtility.directory();
    if (dir == null) {
      throw const FileSystemException('Directory not found.');
    }

    // Create directory
    var rootPath = dir.path;
    if (fileX.directory.isNotEmpty) {
      final directory =
          await _directoryCreator.create('$rootPath/${fileX.directory}');
      rootPath = directory.path;
    }

    // Create File instance
    final filename = '${fileX.prefix}${fileX.filename}${fileX.extension}';
    return File('$rootPath/$filename}');
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
