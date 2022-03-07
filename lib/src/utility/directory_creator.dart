import 'dart:io';

abstract class DirectoryCreator {
  Future<Directory> create(String path);
}

class LocalDirectoryCreator implements DirectoryCreator {
  const LocalDirectoryCreator();

  factory LocalDirectoryCreator.instance() => const LocalDirectoryCreator();

  @override
  Future<Directory> create(String path) async {
    return await Directory(path.replaceAll('//', '/')).create(recursive: true);
  }
}
