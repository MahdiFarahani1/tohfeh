/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsDatabaseGen {
  const $AssetsDatabaseGen();

  /// File path: assets/database/kingWork.db
  String get kingWork => 'assets/database/kingWork.db';

  /// List of all assets
  List<String> get values => [kingWork];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Al-Jazeera-Arabic-Regular.ttf
  String get alJazeeraArabicRegularTtf =>
      'assets/fonts/Al-Jazeera-Arabic-Regular.ttf';

  /// File path: assets/fonts/Al-Jazeera-Arabic-Regular.woff2
  String get alJazeeraArabicRegularWoff2 =>
      'assets/fonts/Al-Jazeera-Arabic-Regular.woff2';

  /// File path: assets/fonts/Arabic%20Typesetting.ttf
  String get arabic20Typesetting => 'assets/fonts/Arabic%20Typesetting.ttf';

  /// File path: assets/fonts/BadrQuran-Regular%20(1).ttf
  String get badrQuranRegular201 => 'assets/fonts/BadrQuran-Regular%20(1).ttf';

  /// File path: assets/fonts/Hafs_18.ttf
  String get hafs18 => 'assets/fonts/Hafs_18.ttf';

  /// File path: assets/fonts/KFGQPCHAFSUthmanicScript-Regular%20%D8%A8%D8%B3%D9%85%20%D8%A7%D9%84%D9%84%D9%87%20(1).ttf
  String get kFGQPCHAFSUthmanicScriptRegular20D8A8D8B3D98520D8A7D984D984D987201 =>
      'assets/fonts/KFGQPCHAFSUthmanicScript-Regular%20%D8%A8%D8%B3%D9%85%20%D8%A7%D9%84%D9%84%D9%87%20(1).ttf';

  /// File path: assets/fonts/Nabi.ttf
  String get nabi => 'assets/fonts/Nabi.ttf';

  /// File path: assets/fonts/UthmanicHafs1%20Ver09.otf
  String get uthmanicHafs120Ver09 => 'assets/fonts/UthmanicHafs1%20Ver09.otf';

  /// File path: assets/fonts/abo.ttf
  String get abo => 'assets/fonts/abo.ttf';

  /// List of all assets
  List<String> get values => [
        alJazeeraArabicRegularTtf,
        alJazeeraArabicRegularWoff2,
        arabic20Typesetting,
        badrQuranRegular201,
        hafs18,
        kFGQPCHAFSUthmanicScriptRegular20D8A8D8B3D98520D8A7D984D984D987201,
        nabi,
        uthmanicHafs120Ver09,
        abo
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/l1.png
  AssetGenImage get l1 => const AssetGenImage('assets/images/l1.png');

  /// File path: assets/images/l2.png
  AssetGenImage get l2 => const AssetGenImage('assets/images/l2.png');

  /// File path: assets/images/l3.png
  AssetGenImage get l3 => const AssetGenImage('assets/images/l3.png');

  /// File path: assets/images/l4.png
  AssetGenImage get l4 => const AssetGenImage('assets/images/l4.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/splash.jpg
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [l1, l2, l3, l4, logo, splash];
}

class Assets {
  Assets._();

  static const $AssetsDatabaseGen database = $AssetsDatabaseGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    FilterQuality filterQuality = FilterQuality.low,
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
