import 'package:flutter_filex/src/utility/base_64_utility.dart';
import 'package:flutter_filex/src/utility/directory_utility.dart';
import 'package:flutter_filex/src/utility/filex_utility.dart';

class FileXProvider {
  static FileXUtility create(DirectoryUtility directoryUtility) {
    return FileXLocalUtility(
      directoryUtility,
      LocalBase64Utility.instance(),
    );
  }
}
