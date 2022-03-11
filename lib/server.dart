import 'dart:async';
import 'dart:io' show Platform;

import 'package:myclippy/src/clipboard.dart';
import 'package:myclippy/src/server.dart';

Clipboard _platform() {
  if (Platform.isMacOS) {
    return MacClipboard();
  } else if (Platform.isWindows) {
    return WindowsClipboard();
  } else {
    return LinuxClipboard();
  }
}

Future<bool> write(String input) => _platform().write(input);

Future<String> read() => _platform().read();
