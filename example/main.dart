import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_filex/flutter_filex.dart';

void main() async {
  final directoryUtility1 = TemporaryDirectoryUtility();
  final directoryUtility2 = ApplicationDocumentsDirectoryUtility();
  final directoryUtility3 = LibraryDirectoryUtility();
  final directoryUtility4 = ApplicationSupportDirectoryUtility();
  final directoryUtility5 = ExternalStorageDirectoryUtility();
  final directoryUtility6 = DownloadsDirectoryUtility();

  final fileXUtility = FileXProvider.create(directoryUtility1);

  final fileX = FileX(
    prefix: 'filex-',
    filename: '1',
    extension: FileX.png,
  );

  // Read bytes
  Uint8List contentByte = await fileXUtility.readAsBytes(fileX);

  // Read string
  String contentString = await fileXUtility.readAsString(fileX);

  // Write bytes
  String path1 =
      await fileXUtility.write(fileX..bytes = Uint8List.fromList([1, 0, 1]));

  // Write base64
  String path2 = await fileXUtility.write(fileX..base64 = 'ZmlsZXg=');

  // Convert to File
  File file = await fileXUtility.toFile(fileX);
}
