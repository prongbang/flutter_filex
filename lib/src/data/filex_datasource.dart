import 'package:flutter_filex/flutter_filex.dart';

abstract class FileXDataSource {
  Future<String> write(FileX fileX);

  Future<String> exists(FileX fileX);
}
