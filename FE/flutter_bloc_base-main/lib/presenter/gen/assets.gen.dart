// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/presenter
  $LibPresenterGen get presenter => const $LibPresenterGen();
}

class $AssetsAudiosGen {
  const $AssetsAudiosGen();

  /// File path: assets/audios/.gitkeep
  String get aGitkeep => 'assets/audios/.gitkeep';

  /// List of all assets
  List<String> get values => [aGitkeep];
}

class $AssetsFilesGen {
  const $AssetsFilesGen();

  /// File path: assets/files/.gitkeep
  String get aGitkeep => 'assets/files/.gitkeep';

  /// List of all assets
  List<String> get values => [aGitkeep];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/.gitkeep
  String get aGitkeep => 'assets/fonts/.gitkeep';

  /// List of all assets
  List<String> get values => [aGitkeep];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/.gitkeep
  String get aGitkeep => 'assets/images/.gitkeep';

  /// File path: assets/images/ic_account.png
  AssetGenImage get icAccount =>
      const AssetGenImage('assets/images/ic_account.png');

  /// File path: assets/images/ic_bell.png
  AssetGenImage get icBell => const AssetGenImage('assets/images/ic_bell.png');

  /// File path: assets/images/ic_calendar.png
  AssetGenImage get icCalendar =>
      const AssetGenImage('assets/images/ic_calendar.png');

  /// File path: assets/images/ic_clock.png
  AssetGenImage get icClock =>
      const AssetGenImage('assets/images/ic_clock.png');

  /// File path: assets/images/ic_close.png
  AssetGenImage get icClose =>
      const AssetGenImage('assets/images/ic_close.png');

  /// File path: assets/images/ic_eye_off.png
  AssetGenImage get icEyeOff =>
      const AssetGenImage('assets/images/ic_eye_off.png');

  /// File path: assets/images/ic_eye_on.png
  AssetGenImage get icEyeOn =>
      const AssetGenImage('assets/images/ic_eye_on.png');

  /// File path: assets/images/ic_facebook.png
  AssetGenImage get icFacebook =>
      const AssetGenImage('assets/images/ic_facebook.png');

  /// File path: assets/images/ic_google.png
  AssetGenImage get icGoogle =>
      const AssetGenImage('assets/images/ic_google.png');

  /// File path: assets/images/ic_heart_circle.png
  AssetGenImage get icHeartCircle =>
      const AssetGenImage('assets/images/ic_heart_circle.png');

  /// File path: assets/images/ic_home.png
  AssetGenImage get icHome => const AssetGenImage('assets/images/ic_home.png');

  /// File path: assets/images/ic_indentity.png
  AssetGenImage get icIndentity =>
      const AssetGenImage('assets/images/ic_indentity.png');

  /// File path: assets/images/ic_mail.png
  AssetGenImage get icMail => const AssetGenImage('assets/images/ic_mail.png');

  /// File path: assets/images/ic_pause.png
  AssetGenImage get icPause =>
      const AssetGenImage('assets/images/ic_pause.png');

  /// File path: assets/images/ic_phone.png
  AssetGenImage get icPhone =>
      const AssetGenImage('assets/images/ic_phone.png');

  /// File path: assets/images/ic_present.png
  AssetGenImage get icPresent =>
      const AssetGenImage('assets/images/ic_present.png');

  /// File path: assets/images/ic_video.png
  AssetGenImage get icVideo =>
      const AssetGenImage('assets/images/ic_video.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// List of all assets
  List<dynamic> get values => [
        aGitkeep,
        icAccount,
        icBell,
        icCalendar,
        icClock,
        icClose,
        icEyeOff,
        icEyeOn,
        icFacebook,
        icGoogle,
        icHeartCircle,
        icHome,
        icIndentity,
        icMail,
        icPause,
        icPhone,
        icPresent,
        icVideo,
        logo
      ];
}

class $LibPresenterGen {
  const $LibPresenterGen();

  /// Directory path: lib/presenter/languages
  $LibPresenterLanguagesGen get languages => const $LibPresenterLanguagesGen();
}

class $LibPresenterLanguagesGen {
  const $LibPresenterLanguagesGen();

  /// Directory path: lib/presenter/languages/translations
  $LibPresenterLanguagesTranslationsGen get translations =>
      const $LibPresenterLanguagesTranslationsGen();
}

class $LibPresenterLanguagesTranslationsGen {
  const $LibPresenterLanguagesTranslationsGen();

  /// File path: lib/presenter/languages/translations/en.json
  String get en => 'lib/presenter/languages/translations/en.json';

  /// File path: lib/presenter/languages/translations/vi.json
  String get vi => 'lib/presenter/languages/translations/vi.json';

  /// List of all assets
  List<String> get values => [en, vi];
}

class Assets {
  const Assets._();

  static const $AssetsAudiosGen audios = $AssetsAudiosGen();
  static const $AssetsFilesGen files = $AssetsFilesGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
