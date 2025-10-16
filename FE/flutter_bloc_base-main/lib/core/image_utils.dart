import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

/// Utility helpers to encode images into base64 strings suitable for sending
/// over the WebSocket. Keep in mind mobile memory - downscale images prior to encoding
/// if they're large.

Future<String> uint8ListToBase64(Uint8List bytes) async {
  return base64Encode(bytes);
}

Future<String> fileToBase64(File file) async {
  final bytes = await file.readAsBytes();
  return base64Encode(bytes);
}

/// If you use `XFile` from image_picker, pass its path or use XFile.readAsBytes()
Future<String> xfileToBase64(dynamic xfile) async {
  // Accepts XFile or any object with readAsBytes() or path
  try {
    if (xfile == null) throw ArgumentError('xfile is null');
    if (xfile is Uint8List) return uint8ListToBase64(xfile);
    if (xfile is File) return fileToBase64(xfile);
    // Try readAsBytes (XFile)
    final read = await xfile.readAsBytes();
    return base64Encode(read);
  } catch (e) {
    rethrow;
  }
}
