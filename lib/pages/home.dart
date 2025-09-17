/*
import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';

import '../commun/widget/navigation_bar.dart';

const List<String> list = <String>['Français', 'Arabe', 'Anglais'];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = list.first;

  bool _showCursor = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _showCursor = !_showCursor;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  //------------logos sliders----------------
  final ScrollController _scrollController = ScrollController();
  late Timer timer;

  // Liste des logos à afficher
  final List<String> logos = [
    "https://zelio-developer.botble.com/storage/code/skills/1.png",
    // Next.js
    "https://zelio-developer.botble.com/storage/code/skills/2.png",
    // Firebase
    "https://zelio-developer.botble.com/storage/code/skills/3.png",
    // MongoDB
    "https://zelio-developer.botble.com/storage/code/skills/4.png",
    // Node.js
    "https://zelio-developer.botble.com/storage/code/skills/5.png",
    // Tailwind CSS
  ];

  // Pour répéter les logos et donner un effet "infini"
  List<String> get repeatedLogos => [...logos, ...logos, ...logos];

  void _startAutoScroll() {
    timer = Timer.periodic(Duration(milliseconds: 30), (_) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.offset;
        double nextScroll = currentScroll + 1;

        if (nextScroll >= maxScroll) {
          _scrollController.jumpTo(0); // Revenir au début pour boucle
        } else {
          _scrollController.jumpTo(nextScroll);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 100, right: 100, top: 30),
          child: Column(
            children: [
              AnimatedGradientBorder(
                borderSize: 1,
                glowSize: 1,
                animationTime: 17,
                gradientColors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.blue
                ],
                animationProgress: null,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 120,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromRGBO(39, 39, 48, 1),
                        border: Border.all(width: .5, color: Colors.blueGrey)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            border: Border.fromBorderSide(
                              BorderSide(width: .5, color: Colors.blueGrey),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.menu,
                                  size: 40,
                                ),
                                style: IconButton.styleFrom(
                                    backgroundColor: Colors.blueGrey[100],
                                    padding: EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(19),
                                      bottomLeft: Radius.circular(19),
                                    ))),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("assets/logo/logo.png"),
                              SizedBox(
                                width: 30,
                              ),
                              NavBar(),
                              SizedBox(
                                width: 20,
                              ),
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                autofocus: true,
                                style: const TextStyle(color: Colors.blue),
                                underline:
                                    Container(height: 2, color: Colors.blue),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                }).toList(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.facebook),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.facebook),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.facebook),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Image.asset("assets/logo/lg_icon.png"),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: SingleChildScrollView(
                                child: ListView(
                                  shrinkWrap: true,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '<span>',
                                          style: TextStyle(
                                            color: Colors.red[800],
                                            fontSize: 17,
                                          ),
                                        ),
                                        DefaultTextStyle(
                                          style: const TextStyle(
                                            fontSize: 17.0,
                                            fontFamily: 'Agne',
                                          ),
                                          child: AnimatedTextKit(
                                            isRepeatingAnimation: false,
                                            animatedTexts: [
                                              TypewriterAnimatedText(
                                                'Salut ! Nous sommes Rahma Group ',
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                cursor: '',
                                                speed:
                                                    Duration(milliseconds: 200),
                                                //curve: Curves.easeInBack,
                                              ),
                                            ],
                                            onTap: () {
                                              print("Tap Event");
                                            },
                                          ),
                                        ),
                                        AnimatedOpacity(
                                          opacity: _showCursor ? 1.0 : 0.0,
                                          duration: Duration(milliseconds: 200),
                                          child: Text(
                                            "|",
                                            style: TextStyle(
                                              color: Colors.yellow[800],
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          ' <span>',
                                          style: TextStyle(
                                            color: Colors.red[800],
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Développeur ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 67,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          TextSpan(
                                              text: "{ Full\nStack }",
                                              style: TextStyle(
                                                color: Colors.blue[800],
                                                fontSize: 67,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          TextSpan(
                                            text: " senior, Web et Mobile ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 67,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.baseline,
                                            baseline: TextBaseline.alphabetic,
                                            child: AnimatedOpacity(
                                              opacity: _showCursor ? 1.0 : 0.0,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: Text(
                                                "_",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 67,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                        style: TextStyle(color: Colors.white),
                                        TextSpan(children: [
                                          TextSpan(
                                            text: '<p>',
                                            style: TextStyle(
                                                color: Colors.pink[700]),
                                          ),
                                          TextSpan(
                                            text:
                                                'Avec une expertise dans les technologies de pointe telles que ',
                                          ),
                                          TextSpan(
                                            text:
                                                'NodeJS, React, Angular et Laravel',
                                            style: TextStyle(
                                                color: Colors.pink[700]),
                                          ),
                                          TextSpan(
                                            text:
                                                '... je propose des solutions Web à la fois innovantes et robustes.',
                                          ),
                                          TextSpan(
                                            text: '</p>',
                                            style: TextStyle(
                                                color: Colors.pink[700]),
                                          )
                                        ])),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 80,
                                          width: MediaQuery.of(context).size.width / 3,
                                          child: ListView.builder(
                                            controller: _scrollController,
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: repeatedLogos.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding: EdgeInsets.all(16),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                ),
                                                child: Image.network(
                                                  repeatedLogos[index],
                                                  width: 60,
                                                  height: 60,
                                                  fit: BoxFit.contain,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              'et plus ...',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahma_group/commun/anime/circular_container.dart';
import 'package:rahma_group/pages/sub_screens/responsive_project.dart';
import 'package:rahma_group/pages/sub_screens/responsive_skills.dart';
import 'package:rahma_group/pages/sub_screens/responsive_values.dart';
import 'package:url_launcher/url_launcher.dart';

import '../commun/widget/blog/blog_card.dart';
import '../commun/widget/contact/contact_form.dart';

const List<String> list = <String>['Français', 'Arabe', 'Anglais'];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = list.first;

  ///--------for responsive----------

  /// ------for responsive end----------

  final ScrollController _scrollButton = ScrollController();
  double _scrollProgress = 0;
  bool _showButton = false;

  void _onScroll() {
    final maxScroll = _scrollButton.position.maxScrollExtent;
    final current = _scrollButton.offset;
    final progress = (current / maxScroll).clamp(0.0, 1.0);
    setState(() {
      _scrollProgress = progress;
      _showButton = current > 200;
    });
  }

  void _scrollToTop() {
    _scrollButton.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  bool _showCursor = true;
  bool showCursor = true;
  late Timer _timer;
  final ScrollController _scrollController = ScrollController();
  late Timer timer;

  final List<Map<String, String>> skills = [
    {"category": "Front-End", "skills": "HTML, CSS, Flutter, React, Vue.js"},
    {"category": "Back-End", "skills": "Laravel, Spring Boot, Python, Django"},
    {
      "category": "Base de Données",
      "skills": "MySQL, PostgreSQL, MongoDB, Firebase"
    },
    {
      "category": "Outils & Logiciels",
      "skills":
      "Git, Adobe Photoshop - Illustrator, Adobe Premiere - After Effect, Figma, "
    },
    {"category": "Others", "skills": "RESTful APIs, Méthodologie Agile"},
  ];

  final List<String> logos = [
    "assets/skills/1.png",
    "assets/skills/2.png",
    "assets/skills/3.png",
    "assets/skills/4.png",
    "assets/skills/5.png",
  ];

  ///***********Cooperation
  ///
  final List<Map<String, String>> companies = [
    {'logo': 'assets/logo/el.png', 'name': 'EL ENTERPRISES'},
    {'logo': 'assets/logo/Logo_Paradise.png', 'name': 'Paradise Perfume'},
    {'logo': 'assets/logo/sib.jpg', 'name': 'SIB'},
    {'logo': 'assets/logo/alhidaya.jpg', 'name': 'Alhidaya'},
    {'logo': 'assets/logo/holitex.jpg', 'name': 'Niger Holitex'},
    {'logo': 'assets/logo/mondial_sawki.jpg', 'name': 'Mondial Sawki'},
    {'logo': 'assets/logo/majestic.jpg', 'name': 'Majestic Event'},
    {'logo': 'assets/logo/rafiq.png', 'name': 'RAFIQ'},
  ];

  // Données des contacts
  final List<Map<String, dynamic>> contacts = [
    {
      'icon': Icons.facebook_outlined,
      'label': '[facebook]',
      'value': 'Rahma Matjar',
      'onPressed': () {},
    },
    {
      'icon': Icons.mail_outline,
      'label': '[email]',
      'value': 'rahmamatjar@gmail.com',
      'onPressed': () {},
    },
    {
      'icon': Icons.phone_outlined,
      'label': '[téléphone]',
      'value': '(+227) 80 76 76 90',
      'onPressed': () {},
    },
  ];

  List<String> get repeatedLogos => [...logos, ...logos, ...logos];

  @override
  void initState() {
    super.initState();
    _scrollButton.addListener(_onScroll);
    _startAutoScroll();
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() => _showCursor = !_showCursor);
    });
  }

  void _startAutoScroll() {
    timer = Timer.periodic(Duration(milliseconds: 30), (_) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.offset;
        double nextScroll = currentScroll + 1;
        _scrollController.jumpTo(nextScroll >= maxScroll ? 0 : nextScroll);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> entries = [
    {
      "title": "L'utilité",
      "content":
      "Nous croyons que chaque projet doit répondre à un besoin réel."
    },
    {
      "title": "Foi et éthique",
      "content": "Notre démarche est guidée par des principes forts"
    },
    {
      "title": "Innovation responsable",
      "content": "Progresser avec conscience"
    },
    {"title": "Solidarité", "content": "Nous grandissons ensemble"},
    {"title": "Indépendance", "content": "Bâtir un modèle solide et autonome"},
    {
      "title": "Excellence par étapes",
      "content": "Avancer avec méthode, patience et rigueur"
    },
  ];
  final List<Map<String, String>> entries1 = [
    {
      "title": "L'utilité",
      "content": "Nous croyons que chaque projet doit répondre à un besoin réel.\n"
          "Chez Rahma Group, l’innovation n’a de sens que si elle est utile à la société. Chaque solution que nous concevons est pensée pour faciliter la vie des individus, apporter des réponses concrètes et créer un impact durable."
    },
    {
      "title": "Foi et éthique",
      "content": "Notre démarche est guidée par des principes forts\n"
          "Nous plaçons la foi, la sincérité, l’honnêteté et la transparence au cœur de tout ce que nous entreprenons. Ces valeurs ne sont pas des slogans, mais des repères concrets dans notre manière de travailler, de collaborer et de servir."
    },
    {
      "title": "Innovation responsable",
      "content": "Progresser avec conscience\n"
          "Chez Rahma, l’innovation n’est pas une fin en soi. C’est un outil pour transformer positivement nos réalités, tout en respectant notre culture, notre environnement et nos valeurs humaines."
    },
  ];
  final List<Map<String, String>> entries2 = [
    {
      "title": "Solidarité",
      "content": "Nous grandissons ensemble\n"
          "Nous ne construisons pas pour nous seuls. Nous construisons avec et pour la communauté. Nos projets intègrent des dimensions sociales : entraide, inclusion, soutien aux entrepreneurs, formation des jeunes."
    },
    {
      "title": "Indépendance",
      "content": "Bâtir un modèle solide et autonome\n"
          "Nous aspirons à une entreprise stable, autosuffisante et durable, qui ne dépend ni d’aides extérieures, ni de compromis de principe. L’indépendance est la clé de la liberté d’action, de la pérennité et de la souveraineté économique."
    },
    {
      "title": "Excellence par étapes",
      "content": "Avancer avec méthode, patience et rigueur\n"
          "Nous ne cherchons pas à aller vite, mais à aller loin, solidement et proprement. Chaque étape compte, chaque projet est construit pour durer, avec sérieux et souci du détail."
    },
  ];

  final List<Widget> imageSliders = [
    {
      'image': 'assets/logo/rahma_matjar.png',
      'title': 'Marketplace Rahma Matjar',
      'desc': 'Application mobile de e-commerce',
      'category': 'FullSatck Mobile',
      'customer': 'Rahma Matjar',
      'date': '2024',
      'url':
      'https://play.google.com/store/apps/details?id=ne.rahma.matjar&pcampaignid=web_share',
    },
    {
      'image': 'assets/logo/rafiq.png',
      'title': 'RAFIQ',
      'desc': 'Système de gestion',
      'category': 'FullSatck Mobile, web',
      'customer': 'RAFIQ',
      'date': '2025',
      'url': '',
    },
  ]
      .map((item) =>
      Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(39, 39, 48, 1),
          borderRadius: BorderRadius.circular(3),
          border: Border.all(width: .5, color: Colors.blueGrey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: IntrinsicHeight(
                      child: SizedBox(
                          height: 290,
                          child: Image.asset(item['image']!,
                              fit: BoxFit.contain))),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 3,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            item['title']!,
                            style: GoogleFonts.aboreto(
                              color: Colors.blue,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            item['desc']!,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(),
                        Text(
                          "• Informations sur le projet",
                          style: TextStyle(
                            color: Colors.pink[700],
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "• Catégorie",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              item['category']!,
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "• Client",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              item['customer']!,
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "• Date de début",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              item['date']!,
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
                Expanded(
                  flex: 4,
                  child: TextButton.icon(
                    onPressed: () {
                      launchUrl(Uri.parse(item['url']!));
                    },
                    style: TextButton.styleFrom(),
                    icon: Icon(
                      Icons.call_made_outlined,
                      color: Colors.white,
                    ),
                    label: Container(
                      //width: 100,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2, color: Colors.blueGrey))),
                      child: Text(
                        'Voir plus',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ))
      .toList();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final isSmallScreen = width < 700;
    final horizontalPadding = width > 800 ? 100.0 : 16.0;

    ///------------------responsive----------
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    // Déterminer si on est sur mobile, tablette ou desktop
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isDesktop = screenWidth >= 1024;

    // Calculs responsifs pour les tailles
    double containerPadding = isMobile ? 12 : (isTablet ? 16 : 20);
    double iconSize = isMobile ? 28 : (isTablet ? 32 : 37);
    double numberFontSize = isMobile ? 45 : (isTablet ? 60 : 75);
    double textFontSize = isMobile ? 12 : (isTablet ? 13 : 14);
    double itemPadding = isMobile ? 8 : (isTablet ? 12 : 16);

    // Liste des statistiques pour faciliter la gestion
    final List<Map<String, dynamic>> stats = [
      {
        'icon': Icons.school_outlined,
        'number': '4+',
        'text': "ans d'expériences",
      },
      {
        'icon': Icons.military_tech_rounded,
        'number': '10+',
        'text': "réalisations",
      },
      {
        'icon': Icons.sentiment_very_satisfied_outlined,
        'number': '10+',
        'text': "clients satisfaits",
      },
      {
        'icon': Icons.rocket_launch_outlined,
        'number': '3+',
        'text': "projets",
      },
    ];

    /// -----------responsive end------------
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
              child: Column(
                children: [
                  AnimatedGradientBorder(
                    borderSize: 1,
                    glowSize: 1,
                    animationTime: 17,
                    gradientColors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.blue
                    ],
                    animationProgress: null,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(39, 39, 48, 1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: .5, color: Colors.blueGrey),
                      ),
                      child: Column(
                        children: [
                          //_buildTopBar(width),
                          //SizedBox(height: 20),
                          isSmallScreen
                              ? _buildMobileContent(width)
                              : _buildDesktopContent(width),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),

                  ///----------------
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(containerPadding),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/static-bg.png'),
                      ),
                      color: Color.fromRGBO(39, 39, 48, 1),
                      borderRadius: BorderRadius.circular(isMobile ? 15 : 20),
                      border: Border.all(width: .5, color: Colors.blueGrey),
                    ),
                    child: isMobile
                        ? _buildMobileLayout(stats, iconSize, numberFontSize,
                        textFontSize, itemPadding)
                        : _buildDesktopLayout(stats, iconSize, numberFontSize,
                        textFontSize, itemPadding),
                  ),
                  SizedBox(
                    height: 27,
                  ),

                  ///***************Cooperation
                  ///
                  isMobile
                      ? _buildMobileLayoutCooperation(companies, contacts, context)
                      : _buildDesktopLayoutCooperation(
                      companies, contacts, context),
                  SizedBox(
                    height: 27,
                  ),

                  ///*******************ce que nous savons faire
                  ///
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Déterminer la taille de l'écran
                      bool isMobile = constraints.maxWidth < 768;
                      bool isTablet = constraints.maxWidth >= 768 &&
                          constraints.maxWidth < 1024;
                      bool isDesktop = constraints.maxWidth >= 1024;

                      // Calculer le nombre de colonnes pour la grille
                      int crossAxisCount;
                      if (isMobile) {
                        crossAxisCount = 1;
                      } else if (isTablet) {
                        crossAxisCount = 2;
                      } else {
                        crossAxisCount = 3;
                      }

                      return AnimatedGradientBorder(
                        borderSize: 1,
                        glowSize: 1,
                        animationTime: 17,
                        gradientColors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.blue
                        ],
                        animationProgress: null,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(isMobile ? 12 : 16),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(39, 39, 48, 1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: .5, color: Colors.blueGrey),
                            ),
                            child: Column(
                              children: [
                                // Titre principal
                                Text(
                                  "• Ce que nous savons faire",
                                  style: TextStyle(
                                    fontSize: isMobile ? 16 : 19,
                                    color: Colors.blue,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: isMobile ? 12 : 16),

                                // Sous-titre principal
                                Text.rich(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: isMobile ? 24 : isTablet ? 32 : 37,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  TextSpan(
                                    children: [
                                      TextSpan(text: "Concevoir des solutions"),
                                      TextSpan(
                                          text: isMobile
                                              ? "\npersonnalisées\npour répondre à vos besoins"
                                              : " personnalisées\npour répondre à vos besoins",
                                          style: TextStyle(color: Colors.grey)
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: isMobile ? 16 : 20),

                                // Grille des services
                                GridView.count(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  crossAxisCount: crossAxisCount,
                                  mainAxisSpacing: isMobile ? 12 : 20,
                                  crossAxisSpacing: isMobile ? 12 : 20,
                                  childAspectRatio: isMobile ? 1.2 : isTablet
                                      ? 1.0
                                      : 0.8,
                                  padding: EdgeInsets.all(isMobile ? 8 : 20),
                                  children: [
                                    _buildServiceCard(
                                        "Mobile - WEB",
                                        isMobile
                                            ? ""
                                            : "DEVELOPPEMENT d'APPLICATION MOBILE et WEB",
                                        "Conception et développement d'applications mobiles, Android et iOS et"
                                            " sites web e-commerce, vitrines ou institutionnels",
                                        isMobile,
                                        isTablet
                                    ),
                                    _buildServiceCard(
                                        "API",
                                        "DEVELOPPEMENT d'API",
                                        "Conception et développement d'API évolutives pour les applications web et mobiles",
                                        isMobile,
                                        isTablet
                                    ),
                                    _buildServiceCard(
                                        "DESIGN",
                                        "DESIGN - IDENTITE VISUELLE",
                                        "Conception graphique, UX/UI design, illustrations, "
                                            "supports de communication (affiches, flyers, réseaux sociaux…)",
                                        isMobile,
                                        isTablet
                                    ),
                                    _buildServiceCard(
                                        "MAINTENANCE",
                                        "MAINTENANCE & SUIVI",
                                        "Nous assurons la maintenance technique de vos plateformes : mises à jour, "
                                            "sécurité, correctifs, optimisation… Pour que votre outil reste stable, "
                                            "rapide et opérationnel",
                                        isMobile,
                                        isTablet
                                    ),
                                    _buildServiceCard(
                                        "REFONTE",
                                        "REFONTE - OPTIMISATION",
                                        "Nous analysons votre site, application ou identité visuelle, puis proposons "
                                            "une refonte sur-mesure : plus moderne, plus claire, mieux alignée avec "
                                            "vos objectifs et vos utilisateurs",
                                        isMobile,
                                        isTablet
                                    ),
                                    _buildServiceCard(
                                        "FORMATIONS",
                                        "FORMATION ET ACCOMPAGNEMENT",
                                        "Transmission de compétences à des apprenants débutants, "
                                            "formation en technologies web et mobile, infographie, "
                                            "création de contenus pédagogiques, supervision de mini-projets",
                                        isMobile,
                                        isTablet
                                    ),
                                  ],
                                ),

                                SizedBox(height: isMobile ? 16 : 20),

                                // Texte de conclusion
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 8 : 16
                                  ),
                                  child: Text.rich(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: isMobile ? 14 : 16
                                      ),
                                      TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Excité de prendre de nouveaux projets et de collaborer, discutons de vos idées.\n"
                                                  "N'hésitez pas à ",
                                            ),
                                            TextSpan(
                                                text: "nous contacter ",
                                                style: TextStyle(color: Colors.blue)
                                            ),
                                            TextSpan(text: "!")
                                          ]
                                      )
                                  ),
                                ),
                              ],
                            )
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 27,
                  ),

                  ///**********Vision
                  ///
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double screenWidth = constraints.maxWidth;
                      bool isMobile = screenWidth < 768;
                      bool isTablet = screenWidth >= 768 && screenWidth < 1024;

                      return AnimatedGradientBorder(
                        borderSize: 1,
                        glowSize: 1,
                        animationTime: 17,
                        gradientColors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.blue
                        ],
                        animationProgress: null,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(_getMainPadding(screenWidth)),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(39, 39, 48, 1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.5, color: Colors.blueGrey),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Titre principal
                              _buildMainTitle(screenWidth),

                              SizedBox(height: _getSpacing(screenWidth)),

                              // Contenu adaptatif selon la taille d'écran
                              isMobile
                                  ? _buildMobileLayoutVision(screenWidth)
                                  : _buildDesktopLayoutVision(
                                  screenWidth, isTablet),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 27,
                  ),

                  ///-----pause
                  ///**************values
                  ResponsiveValuesSection(),
                  SizedBox(
                    height: 27,
                  ),
                  ResponsiveProjectsSection(),
                  SizedBox(
                    height: 27,
                  ),
                  ResponsiveSkillsSection(width: width),
                  SizedBox(
                    height: 27,
                  ),
                  Text(
                    "• Articles",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Dernières nouvelles",
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  /*Row(
                    spacing: 25,
                    children: [
                      Expanded(
                        child: BlogCard(
                          imageUrl: 'assets/blog/stage.png',
                          category: 'Rahma Group',
                          date: '30 Mai, 2025',
                          title: 'Stage pratique',
                          description:
                          "Nous recherchons un(e) stagiaire pour le compte de Rahma group\nRejoins l'avanture",
                          link: '#',
                        ),
                      ),
                      Expanded(
                        child: BlogCard(
                          imageUrl: 'assets/logo/el.jpg',
                          category: 'Entreprise',
                          date: '30 Mai, 2025',
                          title: 'EL ENTERPRISES',
                          description:
                          'La référence incontournable da la distribution transfrontalière entre\nle Niger et le Nigeria',
                          link: 'wa.me/22788086940',
                        ),
                      ),
                      Expanded(
                        child: BlogCard(
                          imageUrl: 'assets/logo/rahma_matjar.png',
                          category: 'E-Commerce',
                          date: '30 Mai, 2025',
                          title: 'Rahma Matjar',
                          description:
                          "Découvrez Rahma Matjar, votre nouvelle destination pour des achats en ligne rapides et sécurisés",
                          link:
                          'https://play.google.com/store/apps/details?id=ne.rahma.matjar&pcampaignid=web_share',
                        ),
                      ),
                    ],
                  ),*/
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Définir les breakpoints
                      bool isMobile = constraints.maxWidth < 600;
                      bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
                      bool isDesktop = constraints.maxWidth >= 1024;

                      // Calculer le nombre de colonnes selon la taille d'écran
                      int crossAxisCount;
                      double childAspectRatio;
                      double spacing;

                      if (isMobile) {
                        crossAxisCount = 1; // Une colonne sur mobile
                        childAspectRatio = 0.85;
                        spacing = 15;
                      } else if (isTablet) {
                        crossAxisCount = 2; // Deux colonnes sur tablette
                        childAspectRatio = 0.8;
                        spacing = 20;
                      } else {
                        crossAxisCount = 3; // Trois colonnes sur desktop
                        childAspectRatio = 0.75;
                        spacing = 25;
                      }

                      return GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: spacing,
                        mainAxisSpacing: spacing,
                        childAspectRatio: childAspectRatio,
                        children: [
                          BlogCard(
                            imageUrl: 'assets/blog/stage.png',
                            category: 'Rahma Group',
                            date: '30 Mai, 2025',
                            title: 'Stage pratique',
                            description: "Nous recherchons un(e) stagiaire pour le compte de Rahma group\nRejoins l'aventure",
                            link: '#',
                          ),
                          BlogCard(
                            imageUrl: 'assets/logo/el.jpg',
                            category: 'Entreprise',
                            date: '30 Mai, 2025',
                            title: 'EL ENTERPRISES',
                            description: 'La référence incontournable de la distribution transfrontalière entre\nle Niger et le Nigeria',
                            link: 'wa.me/22788086940',
                          ),
                          BlogCard(
                            imageUrl: 'assets/logo/rahma_matjar.png',
                            category: 'E-Commerce',
                            date: '30 Mai, 2025',
                            title: 'Rahma Matjar',
                            description: "Découvrez Rahma Matjar, votre nouvelle destination pour des achats en ligne rapides et sécurisés",
                            link: 'https://play.google.com/store/apps/details?id=ne.rahma.matjar&pcampaignid=web_share',
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  // Section Contact Responsive
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Définir les breakpoints
                      bool isMobile = constraints.maxWidth < 768;
                      bool isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1024;

                      // Variables responsives
                      double titleFontSize = isMobile ? 28 : isTablet ? 32 : 37;
                      double spacing = isMobile ? 20 : 27;
                      double contactItemSpacing = isMobile ? 12 : 15;
                      double iconPadding = isMobile ? 12 : 15;
                      double labelFontSize = isMobile ? 14 : 16;
                      double valueFontSize = isMobile ? 16 : 19;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Contactez-nous",
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(height: spacing),

                          // Layout adaptatif : Column sur mobile, Row sur desktop/tablette
                          isMobile
                              ? Column(
                            children: [
                              ContactForm(),
                              SizedBox(height: spacing),
                              _buildContactInfo(
                                isMobile: isMobile,
                                contactItemSpacing: contactItemSpacing,
                                iconPadding: iconPadding,
                                labelFontSize: labelFontSize,
                                valueFontSize: valueFontSize,
                              ),
                            ],
                          )
                              : Row(
                            spacing: spacing,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: ContactForm()),
                              Expanded(
                                child: _buildContactInfo(
                                  isMobile: isMobile,
                                  contactItemSpacing: contactItemSpacing,
                                  iconPadding: iconPadding,
                                  labelFontSize: labelFontSize,
                                  valueFontSize: valueFontSize,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  /*Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Contactez-nous",
                          style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      Row(
                        spacing: 27,
                        children: [
                          Expanded(child: ContactForm()),
                          Expanded(
                            child: Column(
                              spacing: 20,
                              children: [
                                Row(
                                  spacing: 15,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(39, 39, 48, 1),
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            width: .5, color: Colors.blueGrey),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.phone_outlined,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Téléphone',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                        Text(
                                          '+227 80 76 76 90',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 15,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(39, 39, 48, 1),
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            width: .5, color: Colors.blueGrey),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.mail_outline,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Email',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                        Text(
                                          'rahmamatjar@gmail.com',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 15,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(39, 39, 48, 1),
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            width: .5, color: Colors.blueGrey),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.person_2_outlined,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Facebook',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                        Text(
                                          'Rahma Matjar',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 15,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(39, 39, 48, 1),
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            width: .5, color: Colors.blueGrey),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Adresse',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                        Text(
                                          'Ny 2000, Niamey - Niger',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),*/
                  SizedBox(
                    height: 27,
                  ),
                  Divider(),
                  SizedBox(
                    height: 27,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "© 2025 Rahma Group, tous droits reservés",
                        style: TextStyle(color: Colors.white),
                      ),
                      /*Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.facebook, color: Colors.white,),),
                            IconButton(onPressed: (){}, icon: Icon(Icons.facebook, color: Colors.white,),),
                            IconButton(onPressed: (){}, icon: Icon(Icons.facebook, color: Colors.white,),),
                            IconButton(onPressed: (){}, icon: Icon(Icons.facebook, color: Colors.white,),),
                          ],
                      ),
                      NavBar()*/
                    ],
                  )
                ],
              ),
            ),
          ),
    );
  }

  ///***************Contact
  ///
  // Méthode helper pour construire les informations de contact
  Widget _buildContactInfo({
    required bool isMobile,
    required double contactItemSpacing,
    required double iconPadding,
    required double labelFontSize,
    required double valueFontSize,
  }) {
    return Column(
      spacing: isMobile ? 15 : 20,
      children: [
        _buildContactItem(
          icon: Icons.phone_outlined,
          label: 'Téléphone',
          value: '+227 80 76 76 90',
          spacing: contactItemSpacing,
          iconPadding: iconPadding,
          labelFontSize: labelFontSize,
          valueFontSize: valueFontSize,
          isMobile: isMobile,
        ),
        _buildContactItem(
          icon: Icons.mail_outline,
          label: 'Email',
          value: 'rahmamatjar@gmail.com',
          spacing: contactItemSpacing,
          iconPadding: iconPadding,
          labelFontSize: labelFontSize,
          valueFontSize: valueFontSize,
          isMobile: isMobile,
        ),
        _buildContactItem(
          icon: Icons.facebook_outlined, // Meilleure icône pour Facebook
          label: 'Facebook',
          value: 'Rahma Matjar',
          spacing: contactItemSpacing,
          iconPadding: iconPadding,
          labelFontSize: labelFontSize,
          valueFontSize: valueFontSize,
          isMobile: isMobile,
        ),
        _buildContactItem(
          icon: Icons.location_on_outlined,
          label: 'Adresse',
          value: 'Ny 2000, Niamey - Niger',
          spacing: contactItemSpacing,
          iconPadding: iconPadding,
          labelFontSize: labelFontSize,
          valueFontSize: valueFontSize,
          isMobile: isMobile,
        ),
      ],
    );
  }

// Widget helper pour chaque élément de contact
  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    required double spacing,
    required double iconPadding,
    required double labelFontSize,
    required double valueFontSize,
    required bool isMobile,
  }) {
    return Row(
      spacing: spacing,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(iconPadding),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(39, 39, 48, 1),
            borderRadius: BorderRadius.circular(7),
            border: Border.all(width: 0.5, color: Colors.blueGrey),
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.blue,
              size: isMobile ? 20 : 24,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: labelFontSize,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: valueFontSize,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: isMobile ? 2 : 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///**************Vision
  ///
  // Padding principal adaptatif
  double _getMainPadding(double width) {
    if (width < 600) return 16;
    if (width < 900) return 24;
    if (width < 1200) return 32;
    return 40;
  }

  // Espacement adaptatif
  double _getSpacing(double width) {
    if (width < 600) return 16;
    if (width < 900) return 18;
    return 20;
  }

  // Titre principal responsive
  Widget _buildMainTitle(double screenWidth) {
    double fontSize = screenWidth < 600 ? 24 :
    screenWidth < 900 ? 30 : 37;

    return Text.rich(
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        height: 1.2,
      ),
      TextSpan(
        children: [
          TextSpan(text: "Une vision par étapes :"),
          TextSpan(
            text: "\nbâtir un écosystème cohérent",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Layout mobile (disposition verticale)
  Widget _buildMobileLayoutVision(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Liste des projets
        _buildProjectsList(screenWidth, isMobileView: true),

        SizedBox(height: _getSpacing(screenWidth)),

        // Contenu descriptif
        _buildDescriptiveContent(screenWidth, isMobileView: true),
      ],
    );
  }

  // Layout desktop/tablet (disposition horizontale)
  Widget _buildDesktopLayoutVision(double screenWidth, bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Liste des projets
        Expanded(
          flex: isTablet ? 3 : 2,
          child: _buildProjectsList(screenWidth, isMobileView: false),
        ),

        SizedBox(width: _getSpacing(screenWidth)),

        // Contenu descriptif
        Expanded(
          flex: 4,
          child: _buildDescriptiveContent(screenWidth, isMobileView: false),
        ),
      ],
    );
  }

  // Liste des projets
  Widget _buildProjectsList(double screenWidth, {required bool isMobileView}) {
    List<Map<String, String>> projects = [
      {
        'name': 'Rahma Matjar',
        'type': 'Marketplace',
        'logo': 'assets/logo/rahma_matjar.png'
      },
      {
        'name': 'RAFIQ',
        'type': 'Elevage',
        'logo': 'assets/logo/rafiq.png'
      },
      {
        'name': 'RaTech',
        'type': 'Technologie',
        'logo': 'assets/logo/lg_icon.png'
      },
      {
        'name': 'RGL',
        'type': 'Livraison',
        'logo': 'assets/logo/lg_icon.png'
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _buildProjectCard(projects[index], screenWidth, isMobileView);
      },
    );
  }

  // Carte de projet
  Widget _buildProjectCard(Map<String, String> project, double screenWidth,
      bool isMobileView) {
    double cardPadding = screenWidth < 600 ? 12 :
    screenWidth < 900 ? 16 : 20;
    double logoSize = screenWidth < 600 ? 25 : 30;
    double titleFontSize = screenWidth < 600 ? 16 : 19;
    double spacingBetween = screenWidth < 600 ? 12 : 20;

    return Container(
      padding: EdgeInsets.only(
        top: cardPadding * 0.5,
        bottom: cardPadding * 0.5,
        left: cardPadding,
        right: cardPadding * 0.5,
      ),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(39, 39, 48, 1),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(width: 0.5, color: Colors.blueGrey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo
          Image.asset(
            project['logo']!,
            width: logoSize,
            height: logoSize,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: logoSize,
                height: logoSize,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.business,
                  color: Colors.blue,
                  size: logoSize * 0.6,
                ),
              );
            },
          ),

          SizedBox(width: spacingBetween),

          // Texte
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['name']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  project['type']!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: titleFontSize * 0.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Contenu descriptif
  Widget _buildDescriptiveContent(double screenWidth,
      {required bool isMobileView}) {
    double titleFontSize = screenWidth < 600 ? 18 :
    screenWidth < 900 ? 20 : 23;
    double bodyFontSize = screenWidth < 600 ? 16 : 19;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titre de section
        Text(
          "Une communauté, pas seulement une clientèle",
          style: GoogleFonts.aboreto(
            color: Colors.blue,
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            height: 1.3,
          ),
        ),

        SizedBox(height: 15),

        // Premier paragraphe
        Text.rich(
          style: TextStyle(
            color: Colors.white,
            fontSize: bodyFontSize,
            height: 1.4,
          ),
          TextSpan(
            children: [
              TextSpan(
                text: "• Rahma Group ne veut pas seulement avoir des clients. Nous voulons bâtir une ",
              ),
              TextSpan(
                text: "communauté vivante, solidaire et participative, ",
                style: TextStyle(
                  color: Colors.pink[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: "où chaque personne qui rejoint notre univers devient aussi actrice du changement",
              ),
            ],
          ),
        ),

        SizedBox(height: 15),

        // Deuxième paragraphe
        Text.rich(
          style: TextStyle(
            color: Colors.white,
            fontSize: bodyFontSize,
            height: 1.4,
          ),
          TextSpan(
            children: [
              TextSpan(
                text: "• Notre vision ne se limite pas à la recherche de profit. Elle repose sur une ambition plus large : ",
              ),
              TextSpan(
                text: "mettre l'entreprise au service du bien commun, ",
                style: TextStyle(
                  color: Colors.pink[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: "en apportant des solutions concrètes à des besoins essentiels",
              ),
            ],
          ),
        ),

        SizedBox(height: 30),

        // Tags des besoins essentiels
        _buildNeedsTags(screenWidth, isMobileView),
      ],
    );
  }

  // Tags des besoins essentiels
  Widget _buildNeedsTags(double screenWidth, bool isMobileView) {
    List<String> needs = [
      "Se nourrir",
      "Se soigner",
      "S'éduquer",
      "Travailler",
      "Vivre dignement"
    ];

    if (isMobileView || screenWidth < 900) {
      // Version mobile : tags sur plusieurs lignes
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: needs.map((need) => _buildNeedTag(need, screenWidth))
            .toList(),
      );
    } else {
      // Version desktop : tags en ligne
      return Row(
        children: needs
            .map((need) =>
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: _buildNeedTag(need, screenWidth),
            ))
            .toList(),
      );
    }
  }

  // Tag individuel
  Widget _buildNeedTag(String text, double screenWidth) {
    double fontSize = screenWidth < 600 ? 12 : 14;
    double padding = screenWidth < 600 ? 8 : 10;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: padding * 0.6,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(39, 39, 48, 1),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(width: 0.5, color: Colors.blueGrey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  ///**********Ce que nous savons faire
  ///
  Widget _buildServiceCard(
      String title,
      String subtitle,
      String description,
      bool isMobile,
      bool isTablet
      ) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : isTablet ? 16 : 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(39, 39, 48, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: .5, color: Colors.blueGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 16 : 19,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),

          if (subtitle.isNotEmpty) ...[
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: isMobile ? 14 : isTablet ? 16 : 19,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],

          SizedBox(height: 8),

          Flexible(
            child: Text(
              description,
              style: TextStyle(
                color: Colors.grey,
                fontSize: isMobile ? 12 : 13,
                height: 1.4,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTopBar(double width) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(width: .5, color: Colors.blueGrey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, size: 40),
            style: IconButton.styleFrom(
              backgroundColor: Colors.blueGrey[100],
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19),
                  bottomLeft: Radius.circular(19),
                ),
              ),
            ),
          ),
          Image.asset("assets/logo/logo.png", height: 40),
          //NavBar(),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.blue),
            underline: Container(height: 2, color: Colors.blue),
            onChanged: (String? value) {
              setState(() => dropdownValue = value!);
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
              IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
              IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDesktopContent(double width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Image.asset("assets/logo/lg_icon.png"),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIntroText(),
              SizedBox(height: 10),
              _buildTitle(width),
              SizedBox(height: 10),
              _buildDescription(),
              SizedBox(height: 20),
              _buildLogoScroller(width),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileContent(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/logo/lg_icon.png", height: 100),
        _buildIntroText(),
        _buildTitle(width),
        _buildDescription(),
        _buildLogoScroller(width),
      ],
    );
  }

  Widget _buildIntroText() {
    return Row(
      children: [
        Text('<span>', style: TextStyle(color: Colors.pink[700], fontSize: 13)),
        DefaultTextStyle(
          style: TextStyle(fontSize: 17.0),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText(
                'Salut ! Nous sommes Rahma Group ',
                textStyle: TextStyle(color: Colors.white, fontSize: 13),
                cursor: '',
                speed: Duration(milliseconds: 200),
              ),
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: _showCursor ? 1.0 : 0.0,
          duration: Duration(milliseconds: 200),
          child: Text("|",
              style: TextStyle(color: Colors.yellow[800], fontSize: 13)),
        ),
        Text(' <span>',
            style: TextStyle(color: Colors.pink[700], fontSize: 13)),
      ],
    );
  }

  Widget _buildTitle(double width) {
    final double fontSize = width > 1000 ? 67 : (width > 600 ? 40 : 28);
    final double fontSizeForm = width > 1000 ? 47 : (width > 600 ? 20 : 8);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: "Une entreprise ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "♦ ",
              style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: fontSizeForm,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "au \nservice",
              style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: " ♦",
              style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: fontSizeForm,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: " du bien commun ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold)),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: AnimatedOpacity(
              opacity: _showCursor ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Text("_",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  ///***************Cooperation
  ///
  // Layout pour mobile (disposition verticale)
  Widget _buildMobileLayoutCooperation(List<Map<String, String>> companies,
      List<Map<String, dynamic>> contacts, BuildContext context) {
    return Column(
      children: [
        // Section principale avec entreprises
        _buildCooperationSection(companies, contacts, true, context),
        SizedBox(height: 20),
        // Section valeurs
        _buildValuesSection(true, context),
      ],
    );
  }

// Layout pour desktop/tablette (disposition horizontale)
  Widget _buildDesktopLayoutCooperation(List<Map<String, String>> companies,
      List<Map<String, dynamic>> contacts, BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildCooperationSection(companies, contacts, false, context),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: _buildValuesSection(false, context),
        ),
      ],
    );
  }

// Section coopération avec les entreprises
  Widget _buildCooperationSection(List<Map<String, String>> companies,
      List<Map<String, dynamic>> contacts, bool isMobile, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        AnimatedGradientBorder(
          borderSize: 1,
          glowSize: 1,
          animationTime: 17,
          gradientColors: [
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Colors.blue
          ],
          animationProgress: null,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            decoration: BoxDecoration(
              color: Color.fromRGBO(39, 39, 48, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: .5, color: Colors.blueGrey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre
                Text(
                  "• Coopération",
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 19,
                    color: Colors.blue,
                  ),
                ),
                // Texte principal
                Text.rich(
                  style: TextStyle(
                    fontSize: isMobile ? 24 : (screenWidth < 1200 ? 28 : 37),
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  TextSpan(
                    children: [
                      TextSpan(text: "Plus de 10"),
                      TextSpan(
                        text: " entreprises\n",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(text: "nous font"),
                      TextSpan(
                        text: " confiance_",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Container avec logos des entreprises
                _buildCompaniesContainer(companies, isMobile),
                SizedBox(height: 20),
                // Section contact
                //_buildContactSection(contacts, isMobile),
                SizedBox(height: 27),
              ],
            ),
          ),
        ),
        // Widget OrbitRadar positionné
        if (!isMobile)
          Positioned(
            bottom: 60,
            right: 60,
            child: OrbitRadar(),
          ),
      ],
    );
  }

// Container avec les logos des entreprises
  Widget _buildCompaniesContainer(List<Map<String, String>> companies, bool isMobile) {
    // Diviser les entreprises en groupes pour l'affichage
    final firstRow = companies.take(5).toList();
    final secondRow = companies.skip(5).toList();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 25),
      decoration: BoxDecoration(
        color: Color.fromRGBO(39, 39, 48, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: .5, color: Colors.blueGrey),
      ),
      child: Column(
        children: [
          _buildCompanyRow(firstRow, isMobile),
          if (secondRow.isNotEmpty) ...[
            SizedBox(height: isMobile ? 20 : 30),
            _buildCompanyRow(secondRow, isMobile),
          ],
        ],
      ),
    );
  }

// Ligne d'entreprises
  Widget _buildCompanyRow(List<Map<String, String>> companies, bool isMobile) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: companies.map((company) =>
            Padding(
              padding: EdgeInsets.only(right: isMobile ? 12 : 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    company['logo']!,
                    width: isMobile ? 25 : 30,
                    height: isMobile ? 25 : 30,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.business, size: isMobile ? 25 : 30, color: Colors.grey),
                  ),
                  SizedBox(width: 8),
                  Text(
                    company['name']!,
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 15,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
        ).toList(),
      ),
    );
  }
/*
// Section contact avec avatar et informations
  Widget _buildContactSection(List<Map<String, dynamic>> contacts, bool isMobile) {
    return isMobile
        ? _buildMobileContactSection(contacts)
        : _buildDesktopContactSection(contacts);
  }

// Contact section pour mobile (disposition verticale)
  Widget _buildMobileContactSection(List<Map<String, dynamic>> contacts) {
    return Column(
      children: [
        // Avatar
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.blueGrey, width: .5),
            color: Colors.transparent,
          ),
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.blueGrey, width: .5),
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.blueGrey, width: .5),
                color: Colors.pink[700],
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        // Informations de contact
        ...contacts.map((contact) => _buildContactItem(contact, true)),
      ],
    );
  }

// Contact section pour desktop (disposition horizontale)
  Widget _buildDesktopContactSection(List<Map<String, dynamic>> contacts) {
    return Row(
      children: [
        // Avatar
        Center(
          child: Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.blueGrey, width: .5),
              color: Colors.transparent,
            ),
            child: Container(
              width: 75,
              height: 75,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.blueGrey, width: .5),
              ),
              child: Container(
                width: 75,
                height: 75,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.blueGrey, width: .5),
                  color: Colors.pink[700],
                ),
              ),
            ),
          ),
        ),
        // Informations de contact
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: contacts.map((contact) => _buildContactItem(contact, false)).toList(),
          ),
        ),
      ],
    );
  }

// Item de contact individuel
  Widget _buildContactItem(Map<String, dynamic> contact, bool isMobile) {
    return TextButton(
      onPressed: contact['onPressed'],
      child: Row(
        mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
        children: [
          Icon(
            contact['icon'],
            color: Colors.white,
            size: isMobile ? 20 : 23,
          ),
          SizedBox(width: 11),
          Text(
            contact['label'],
            style: TextStyle(
              fontSize: isMobile ? 14 : 17,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 11),
          Flexible(
            child: Text(
              contact['value'],
              style: TextStyle(
                fontSize: isMobile ? 14 : 17,
                color: Colors.pink[700],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
*/
// Section des valeurs (assumant que 'entries' est défini ailleurs)
  Widget _buildValuesSection(bool isMobile, BuildContext context) {
    // Cette variable doit être définie dans votre contexte
    // final List<Map<String, String>> entries = [...];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(39, 39, 48, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: .5, color: Colors.blueGrey),
      ),
      child: Stack(
        children: [
          // Ligne verticale
          Positioned.fill(
            left: 20,
            top: 50,
            bottom: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 2,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          // Contenu principal
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.blue,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Nos Valeurs – Ce qui guide Rahma Group",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              ...entries.map((entry) => _buildValueEntry(entry, isMobile)),
            ],
          ),
          // Overlay gradient en bas
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xFF272730),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// Widget pour une entrée de valeur (à utiliser avec vos données 'entries')
  Widget _buildValueEntry(Map<String, String> entry, bool isMobile) {
    return Padding(
      padding: EdgeInsets.only(left: 24, bottom: 27),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              entry["title"]!,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: isMobile ? 14 : 16,
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            flex: 3,
            child: Text(
              entry["content"]!,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 13 : 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///*******************--responsive experience

// Layout pour mobile (vertical, 2x2 grid)
  Widget _buildMobileLayout(List<Map<String, dynamic>> stats, double iconSize,
      double numberFontSize, double textFontSize, double itemPadding) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildStatItem(stats[0], iconSize, numberFontSize, textFontSize, itemPadding)),
            SizedBox(width: 8),
            Expanded(child: _buildStatItem(stats[1], iconSize, numberFontSize, textFontSize, itemPadding)),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildStatItem(stats[2], iconSize, numberFontSize, textFontSize, itemPadding)),
            SizedBox(width: 8),
            Expanded(child: _buildStatItem(stats[3], iconSize, numberFontSize, textFontSize, itemPadding)),
          ],
        ),
      ],
    );
  }

// Layout pour tablette et desktop (horizontal)
  Widget _buildDesktopLayout(List<Map<String, dynamic>> stats, double iconSize,
      double numberFontSize, double textFontSize, double itemPadding) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: stats.map((stat) =>
          Expanded(child: _buildStatItem(stat, iconSize, numberFontSize, textFontSize, itemPadding))
      ).toList(),
    );
  }

// Widget pour chaque élément statistique
  Widget _buildStatItem(Map<String, dynamic> stat, double iconSize,
      double numberFontSize, double textFontSize, double itemPadding) {
    return Padding(
      padding: EdgeInsets.all(itemPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            stat['icon'],
            size: iconSize,
            color: Colors.blue,
          ),
          SizedBox(height: 8),
          FittedBox(
            child: Text(
              stat['number'],
              style: TextStyle(
                fontSize: numberFontSize,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            stat['text'],
            style: TextStyle(
              fontSize: textFontSize,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  ///---------------------**responsive

  Widget _buildDescription() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '<p>', style: TextStyle(color: Colors.pink[700])),
          TextSpan(text: "Rahma Group est une entreprise à "),
          TextSpan(text: 'mission,', style: TextStyle(color: Colors.pink[700])),
          TextSpan(
              text:
                  "... fondée sur la volonté profonde de contribuer à la construction d'une société plus juste, plus autonome et plus durable"),
          TextSpan(text: '</p>', style: TextStyle(color: Colors.pink[700])),
        ],
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildLogoScroller(double width) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 80,
            width: width > 1000 ? width / 3 : width - 100,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: repeatedLogos.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(39, 39, 50, 1),
                    border: Border.all(
                      color: Colors.grey,
                      width: .5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    repeatedLogos[index],
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'et plus ...',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

/*class Skills extends StatefulWidget {
  const Skills({
    super.key,
    required this.width,
  });

  final double width;

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  bool showCursor = true;
  final ScrollController scrollController = ScrollController();
  late Timer time;

  List<String> get repeatedLogo => [...logo, ...logo, ...logo];

  final List<String> logo = [
    'assets/skills/1.png',
    'assets/skills/2.png',
    'assets/skills/3.png',
    'assets/skills/4.png',
    'assets/skills/5.png',
  ];

  void startAutoScroll() {
    time = Timer.periodic(Duration(milliseconds: 10), (_) {
      if (scrollController.hasClients) {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;
        double nextScroll = currentScroll + 2;
        scrollController.jumpTo(nextScroll >= maxScroll ? 0 : nextScroll);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startAutoScroll();
    time = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() => showCursor = !showCursor);
    });
  }

  @override
  void dispose() {
    time.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: widget.width > 1000 ? widget.width / 3 : widget.width - 100,
      child: ListView.builder(
        reverse: true,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemCount: repeatedLogo.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Color.fromRGBO(35, 35, 45, 1),
              border: Border.all(
                color: Colors.grey,
                width: .5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              repeatedLogo[index],
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  final List<String> logos = [
    'https://zelio-developer.botble.com/storage/code/skills/1.png',
    'https://zelio-developer.botble.com/storage/code/skills/2.png',
    'https://zelio-developer.botble.com/storage/code/skills/3.png',
    'https://zelio-developer.botble.com/storage/code/skills/4.png',
    'https://zelio-developer.botble.com/storage/code/skills/5.png',
  ];

  final List<String> logoNames = [
    'Next.js',
    'Firebase',
    'MongoDB',
    'Node.js',
    'Tailwind CSS'
  ];

  final List<Map<String, String>> skills = [
    {
      "category": "Front-End",
      "skills": "HTML, CSS, JavaScript, React, Angular"
    },
    {"category": "Back-End", "skills": "Node.js, Express, Python, Django"},
    {"category": "Databases", "skills": "MySQL, PostgreSQL, MongoDB"},
    {"category": "Tools & Platforms", "skills": "Git, Docker, AWS, Heroku"},
    {
      "category": "Others",
      "skills": "RESTful APIs, GraphQL, Agile Methodologies"
    },
  ];

  SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _SectionTitle(),
        const SizedBox(height: 32),
        _LogoTickerList(logos: logos, logoNames: logoNames),
        const SizedBox(height: 32),
        _SkillsList(skills: skills),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.circle, size: 6, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              'Projects',
              style: TextStyle(
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                  ).createShader(Rect.fromLTWH(0, 0, 100, 20)),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'My Skills',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}

class _LogoTickerList extends StatelessWidget {
  final List<String> logos;
  final List<String> logoNames;

  const _LogoTickerList({required this.logos, required this.logoNames});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: logos.length * 2,
        itemBuilder: (context, index) {
          final logo = logos[index % logos.length];
          final name = logoNames[index % logoNames.length];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(logo, width: 80, height: 80),
                ),
                SizedBox(height: 4),
                Text(name, style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SkillsList extends StatelessWidget {
  final List<Map<String, String>> skills;

  const _SkillsList({required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: skills
          .map((skill) => _SkillItem(
                category: skill['category']!,
                skills: skill['skills']!,
              ))
          .toList(),
    );
  }
}

class _SkillItem extends StatelessWidget {
  final String category;
  final String skills;

  const _SkillItem({required this.category, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$category:',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              skills,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}*/
