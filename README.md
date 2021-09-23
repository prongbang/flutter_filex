# flutter_filex

A simple Read & Write file.

## Features

- Read & Write file

## Usage

```dart
final directoryUtility = TemporaryDirectoryUtility();
final directoryUtility = ApplicationDocumentsDirectoryUtility();
final directoryUtility = LibraryDirectoryUtility();
final directoryUtility = ApplicationSupportDirectoryUtility();
final directoryUtility = ExternalStorageDirectoryUtility();
final directoryUtility = DownloadsDirectoryUtility();

final fileXUtility = FileXProvider.create(directoryUtility);

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
String path1 = await fileXUtility.write(fileX..bytes = Uint8List.fromList([1, 0, 1]));

// Write base64
String path2 = await fileXUtility.write(fileX..base64 = 'ZmlsZXg=');

// Convert to File
File file = await fileXUtility.toFile(fileX);
```
