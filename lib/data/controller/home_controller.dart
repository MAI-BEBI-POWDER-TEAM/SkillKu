import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Map<String, dynamic>> programmingList = <Map<String, dynamic>>[
    {
      'thumbnail': 'assets/thumbnail/programming/front-end-thumb.png',
      'title': 'Front-End\nDevelopment',
    },
    {
      'thumbnail': 'assets/thumbnail/programming/back-end-thumb.png',
      'title': 'Back-End\nDevelopment',
    },
    {
      'thumbnail': 'assets/thumbnail/programming/mobile-thumb.png',
      'title': 'Mobile App\nDevelopment',
    },
    {
      'thumbnail': 'assets/thumbnail/programming/devops-thumb.png',
      'title': 'DevOps',
    },
  ];

  List<Map<String, dynamic>> designList = <Map<String, dynamic>>[
    {
      'thumbnail': 'assets/thumbnail/design/creative-thumb.png',
      'title': 'Creative Art',
    },
    {
      'thumbnail': 'assets/thumbnail/design/uiux-thumb.png',
      'title': 'UI/UX Design',
    },
    {
      'thumbnail': 'assets/thumbnail/design/fashion-thumb.png',
      'title': 'Fashion Design',
    },
    {
      'thumbnail': 'assets/thumbnail/design/graphic-thumb.png',
      'title': 'Graphic Design',
    },
  ];

  List<Map<String, dynamic>> multimediaList = <Map<String, dynamic>>[
    {
      'thumbnail': 'assets/thumbnail/multimedia/photography-thumb.png',
      'title': 'Photography',
    },
    {
      'thumbnail': 'assets/thumbnail/multimedia/videography-thumb.png',
      'title': 'Videography',
    },
    {
      'thumbnail': 'assets/thumbnail/multimedia/vlogging-thumb.png',
      'title': 'Vlogging',
    },
    {
      'thumbnail': 'assets/thumbnail/multimedia/fashion-photo-thumb.png',
      'title': 'Fashion Photoshoot',
    },
    {
      'thumbnail': 'assets/thumbnail/multimedia/product-photo-thumb.png',
      'title': 'Product Photoshoot',
    }
  ];

  List<Map<String, dynamic>> analyticList = <Map<String, dynamic>>[
    {
      'thumbnail': 'assets/thumbnail/analytic/business-analytics-thumb.png',
      'title': 'Business Analytics',
    },
    {
      'thumbnail': 'assets/thumbnail/analytic/data-analytics-thumb.png',
      'title': 'Data Analytics',
    },
    {
      'thumbnail': 'assets/thumbnail/analytic/market-analytics-thumb.png',
      'title': 'Market Analytics',
    },
  ];
}
