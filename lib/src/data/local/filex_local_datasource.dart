import 'package:flutter_filex/flutter_filex.dart';

class FileXLocalDataSource implements FileXDataSource {
  final FileXUtility _fileXLocalUtility;

  FileXLocalDataSource(this._fileXLocalUtility);

  @override
  Future<String> write(FileX fileX) => _fileXLocalUtility.write(fileX);

  @override
  Future<String> exists(FileX fileX) => _fileXLocalUtility.exists(fileX);
}
