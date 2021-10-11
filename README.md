flutter_image_demo
=

flutter image demo 主要展示图片与动画处理的案例。
<br>
比如：网络图片加载、图片预览、图片缩放、json动画处理等等。
-

本项目使用到以下插件：
<a href="https://pub.flutter-io.cn/packages/cached_network_image">cached_network_image</a>、
<a href="https://pub.flutter-io.cn/packages/photo_view">photo_view</a> 、
<a href="https://pub.flutter-io.cn/packages/lottie">lottie</a> 、
<a href="https://pub.flutter-io.cn/packages/flutter_svg">flutter_svg</a>

## Catalog （目录）
* Mind Map (思维导图)
* Getting started （开始前准备）
* Example of Network Image （加载网络图片案例）
* Example of PhotoView （图片预览案例）
* Example of Svg （加载Svg案例）
* Example of Lottie （加载json动画案例）


## Mind Map
<br>
<img src="https://github.com/Msshinana/imagesource/blob/master/mind_map.png" width="80%" height="80%" align="middle" >

## Getting started
In the pubspec.yaml of your flutter project, add the following dependency:

```dart
dependencies:
  ...
  cached_network_image: ^3.0.0
  photo_view: ^0.12.0
  flutter_svg: ^0.22.0
  lottie: ^1.2.1

```


If you want to use wrapped dependency packages, In your library add the following file:
<br>
<img src="https://github.com/Msshinana/imagesource/blob/master/flutter_manager.png" width="50%" height="50%">


## Example of Network Image
<img src="https://github.com/Msshinana/imagesource/blob/master/network_image.gif" width="30%" height="30%">


```dart

import 'package:flutter_image_demo/manager/sn_image_manager.dart';

  //Widget
  Center(
    child: SNCacheNetworkImage(
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      imageUrl: 'https://blurha.sh/assets/images/img1.jpg',
    ),
  )
  
  
  //ImageProvider
  Image(
    image: CachedNetworkImageProvider(
      'https://loremflickr.com/320/240/music?lock=0',
    ),
  )
  
```
 
You can find more examples in the <a href="example_lottie_page">example_image_cache_page.dart</a>

## Example of PhotoView
<img src="https://github.com/Msshinana/imagesource/blob/master/photo_view_demo.gif" width="30%" height="30%">

```dart

import 'package:flutter_image_demo/manager/sn_image_manager.dart';

//Preview
//PreviewOpenType { dialog, push, bottomSheet }
Center(
  child: SNPreviewImageWrapper(
    imageUrl: 'https://loremflickr.com/320/240/music?lock=1',
    previewEnable: true,
    previewOpenType: PreviewOpenType.dialog,
  ),
)

//Gallery
GridView.builder(
  itemCount: images.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3),
  itemBuilder: (BuildContext context, int index) =>
      SNPreviewImageGallery(
    imageUrl: images[index],
    galleryItems: images,
    initialIndex: index,
    verticalGallery: verticalGallery,
  ),
)

```

## Example of Svg
<img src="https://github.com/Msshinana/imagesource/blob/master/svg_demo.png" width="30%" height="30%">


```dart

import 'package:flutter_svg/flutter_svg.dart';

//Assert
SvgPicture.asset('assets/flutter_logo.svg'),

//Network
SvgPicture.network(
  'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/410.svg',
  placeholderBuilder: (BuildContext context) => Container(
      padding: const EdgeInsets.all(30.0),
      child: const CircularProgressIndicator()),
),

//String
SvgPicture.string('''<svg viewBox="0 0 200 200"
  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  <image xlink:href="https://mdn.mozillademos.org/files/6457/mdn_logo_only_color.png" height="200" width="200"/>
</svg>''')

```

## Example of Lottie
<img src="https://github.com/Msshinana/imagesource/blob/master/lottie.gif" width="30%" height="30%">

```dart

import 'package:lottie/lottie.dart';

//Assert
Lottie.asset('assets/LottieLogo1.json')

//Network
Lottie.network(
      'https://assets10.lottiefiles.com/datafiles/QeC7XD39x4C1CIj/data.json'),
)

//Zip file
Lottie.asset('assets/lottiefiles/angel.zip')

//No repeat
Lottie.asset(
  'assets/LottieLogo1.json',
  repeat: false,
),

//Error builder
Lottie.network(
  'https://example.does.not.exist/lottie.json',
  errorBuilder: (context, exception, stackTrace) {
    return Center(
      child: Icon(
        Icons.broken_image,
        color: Colors.grey[400],
        size: 40.0,
      ),
    );
  },
)

```

You can find more examples in the <a href="example_lottie_page">example_lottie_page.dart</a>








