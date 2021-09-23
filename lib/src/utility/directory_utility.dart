import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class DirectoryUtility {
  Future<Directory?> directory();
}

class TemporaryDirectoryUtility implements DirectoryUtility {
  static const String instanceName = 'TemporaryDirectoryUtility';

  @override
  Future<Directory?> directory() async => await getTemporaryDirectory();
}

class ApplicationDocumentsDirectoryUtility implements DirectoryUtility {
  static const String instanceName = 'ApplicationDocumentsDirectoryUtility';

  @override
  Future<Directory?> directory() async =>
      await getApplicationDocumentsDirectory();
}

class LibraryDirectoryUtility implements DirectoryUtility {
  static const String instanceName = 'LibraryDirectoryUtility';

  @override
  Future<Directory?> directory() async => await getLibraryDirectory();
}

class ApplicationSupportDirectoryUtility implements DirectoryUtility {
  static const String instanceName = 'ApplicationSupportDirectoryUtility';

  @override
  Future<Directory?> directory() async =>
      await getApplicationSupportDirectory();
}

class ExternalStorageDirectoryUtility implements DirectoryUtility {
  static const String instanceName = 'ExternalStorageDirectoryUtility';

  @override
  Future<Directory?> directory() async => await getExternalStorageDirectory();
}

class DownloadsDirectoryUtility implements DirectoryUtility {
  static const String instanceName = 'DownloadsDirectoryUtility';

  @override
  Future<Directory?> directory() async => await getDownloadsDirectory();
}
