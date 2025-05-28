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
                                                color: Colors.green[800],
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
import 'package:url_launcher/url_launcher.dart';

import '../commun/widget/blog/blog_card.dart';
import '../commun/widget/button/scroll_to_top_button.dart';
import '../commun/widget/contact/contact_form.dart';
import '../commun/widget/navigation_bar.dart';

const List<String> list = <String>['Français', 'Arabe', 'Anglais'];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = list.first;

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
    {"category": "Front-End", "skills": "HTML, CSS, JavaScript, React, Angular"},
    {"category": "Back-End", "skills": "Node.js, Express, Python, Django"},
    {"category": "Databases", "skills": "MySQL, PostgreSQL, MongoDB"},
    {"category": "Tools & Platforms", "skills": "Git, Docker, AWS, Heroku"},
    {"category": "Others", "skills": "RESTful APIs, GraphQL, Agile Methodologies"},
  ];

  final List<String> logos = [
    "https://zelio-developer.botble.com/storage/code/skills/1.png",
    "https://zelio-developer.botble.com/storage/code/skills/2.png",
    "https://zelio-developer.botble.com/storage/code/skills/3.png",
    "https://zelio-developer.botble.com/storage/code/skills/4.png",
    "https://zelio-developer.botble.com/storage/code/skills/5.png",
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
    {"title": "L'utilité",
      "content": "Nous croyons que chaque projet doit répondre à un besoin réel."
          },
    {"title": "Foi et éthique",
      "content": "Notre démarche est guidée par des principes forts"},
    {"title": "Innovation responsable",
      "content": "Progresser avec conscience"},
    {"title": "Solidarité",
      "content": "Nous grandissons ensemble"},
    {"title": "Indépendance",
      "content": "Bâtir un modèle solide et autonome"},
    {"title": "Excellence par étapes",
      "content": "Avancer avec méthode, patience et rigueur"},
  ];
  final List<Map<String, String>> entries1 = [
    {"title": "L'utilité",
      "content": "Nous croyons que chaque projet doit répondre à un besoin réel.\n"
          "Chez Rahma Group, l’innovation n’a de sens que si elle est utile à la société. Chaque solution que nous concevons est pensée pour faciliter la vie des individus, apporter des réponses concrètes et créer un impact durable."
          },
    {"title": "Foi et éthique",
      "content": "Notre démarche est guidée par des principes forts\n"
          "Nous plaçons la foi, la sincérité, l’honnêteté et la transparence au cœur de tout ce que nous entreprenons. Ces valeurs ne sont pas des slogans, mais des repères concrets dans notre manière de travailler, de collaborer et de servir."},
    {"title": "Innovation responsable",
      "content": "Progresser avec conscience\n"
          "Chez Rahma, l’innovation n’est pas une fin en soi. C’est un outil pour transformer positivement nos réalités, tout en respectant notre culture, notre environnement et nos valeurs humaines."},

  ];
  final List<Map<String, String>> entries2 = [
    {"title": "Solidarité",
      "content": "Nous grandissons ensemble\n"
          "Nous ne construisons pas pour nous seuls. Nous construisons avec et pour la communauté. Nos projets intègrent des dimensions sociales : entraide, inclusion, soutien aux entrepreneurs, formation des jeunes."},
    {"title": "Indépendance",
      "content": "Bâtir un modèle solide et autonome\n"
          "Nous aspirons à une entreprise stable, autosuffisante et durable, qui ne dépend ni d’aides extérieures, ni de compromis de principe. L’indépendance est la clé de la liberté d’action, de la pérennité et de la souveraineté économique."},
    {"title": "Excellence par étapes",
      "content": "Avancer avec méthode, patience et rigueur\n"
          "Nous ne cherchons pas à aller vite, mais à aller loin, solidement et proprement. Chaque étape compte, chaque projet est construit pour durer, avec sérieux et souci du détail."},
  ];

  final List<Widget> imageSliders = [
    {
      'image':
          'assets/logo/rahma_matjar.png',
      'title': 'Marketplace Rahma Matjar',
      'desc': 'Application mobile de e-commerce',
      'category': 'FullSatck Mobile',
      'customer': 'Rahma Matjar',
      'date': '2024',
      'url': 'https://play.google.com/store/apps/details?id=ne.rahma.matjar&pcampaignid=web_share',
    },
    {
      'image':
      'assets/logo/rafiq.png',
      'title': 'RAFIQ',
      'desc': 'Système de gestion',
      'category': 'FullSatck Mobile, web',
      'customer': 'RAFIQ',
      'date': '2025',
      'url': '',
    },
  ]
      .map((item) => Container(
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
                      child: IntrinsicHeight(child: SizedBox(
                        height: 290,
                          child: Image.asset(item['image']!, fit: BoxFit.contain))),
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
                                  color: Colors.green,
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
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 700;
    final horizontalPadding = width > 800 ? 100.0 : 16.0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: 30),
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
                      _buildTopBar(width),
                      SizedBox(height: 20),
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
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/static-bg.png',
                    ),
                  ),
                  color: Color.fromRGBO(39, 39, 48, 1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: .5, color: Colors.blueGrey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 68.0, top: 28, bottom: 28, right: 58),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.school_outlined,
                            size: 37,
                            color: Colors.green,
                          ),
                          Text(
                            '4+',
                            style: TextStyle(
                                fontSize: 75,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            "ans d'expériences",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 68.0, top: 28, bottom: 28, right: 58),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.military_tech_rounded,
                            size: 37,
                            color: Colors.green,
                          ),
                          Text(
                            '10+',
                            style: TextStyle(
                                fontSize: 75,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "réalisations",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 68.0, top: 28, bottom: 28, right: 58),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.sentiment_very_satisfied_outlined,
                            size: 37,
                            color: Colors.green,
                          ),
                          Text(
                            '10+',
                            style: TextStyle(
                                fontSize: 75,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "clients satisfaits",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 68.0, top: 28, bottom: 28, right: 58),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.rocket_launch_outlined,
                            size: 37,
                            color: Colors.green,
                          ),
                          Text(
                            '3+',
                            style: TextStyle(
                                fontSize: 75,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "projets",
                            style:
                                TextStyle(fontSize: 17, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Stack(
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
                              border: Border.all(
                                  width: .5, color: Colors.blueGrey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "• Coopération",
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.green,
                                  ),
                                ),
                                Text.rich(
                                  style: TextStyle(
                                    fontSize: 37,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  TextSpan(
                                    children: [
                                      TextSpan(text: "Plus de 10"),
                                      TextSpan(
                                          text: " entreprises\n",
                                          style:
                                              TextStyle(color: Colors.grey)),
                                      TextSpan(text: "nous font"),
                                      TextSpan(
                                        text: " confiance_",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16),
                                  margin: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(39, 39, 48, 1),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: .5, color: Colors.blueGrey),
                                  ),
                                  child: Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/logo/el.png',
                                                  width: 30,
                                                ),
                                                Text(
                                                  'EL ENTERPRISES',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/logo/Logo_Paradise.png',
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Paradise Perfume',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/logo/lg_icon.png',
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Rahma Groupe',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/logo/lg_icon.png',
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Rahma Groupe',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/logo/lg_icon.png',
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Rahma Groupe',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/logo/lg_icon.png',
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Rahma Groupe',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/logo/lg_icon.png',
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Rahma Groupe',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/logo/lg_icon.png',
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Rahma Groupe',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/logo/lg_icon.png',
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Rahma Groupe',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      margin: EdgeInsets.only(left: 25),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.blueGrey,
                                              width: .5),
                                          color: Colors.transparent),
                                      child: Container(
                                        width: 75,
                                        height: 75,
                                        margin: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.blueGrey,
                                              width: .5),
                                        ),
                                        child: Container(
                                          width: 75,
                                          height: 75,
                                          margin: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: Border.all(
                                                  color: Colors.blueGrey,
                                                  width: .5),
                                              color: Colors.pink),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.facebook_outlined,
                                                color: Colors.white,
                                                size: 23,
                                              ),
                                              SizedBox(
                                                width: 11,
                                              ),
                                              Text(
                                                "[facebook]",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 11,
                                              ),
                                              Text(
                                                "Rahma Groupe",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.pink[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.mail_outline,
                                                color: Colors.white,
                                                size: 23,
                                              ),
                                              SizedBox(
                                                width: 11,
                                              ),
                                              Text(
                                                "[email]",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 11,
                                              ),
                                              Text(
                                                "rahmamatjar@gmail.com",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.pink[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.phone_outlined,
                                                color: Colors.white,
                                                size: 23,
                                              ),
                                              SizedBox(
                                                width: 11,
                                              ),
                                              Text(
                                                "[téléphone]",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 11,
                                              ),
                                              Text(
                                                "(+227) 80 76 76 90",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.pink[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 27,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 60,
                          right: 60,
                          child: OrbitRadar(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(39, 39, 48, 1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: .5, color: Colors.blueGrey),
                      ),
                      child: Stack(
                        children: [
                          // ligne verticale
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

                          // contenu principal
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 4,
                                    backgroundColor:
                                        Colors.green,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "Nos Valeurs – Ce qui guide Rahma Group",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 26),
                              ...entries.map(
                                (entry) => Padding(
                                  padding: const EdgeInsets.only(left: 24, bottom: 27,),
                                  child: Row(
                                    spacing: 15,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          entry["title"]!,
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                         child: Text(
                                          entry["content"]!,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // overlay (ombre en bas)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            //height: 40,
                            child: IgnorePointer(
                              child: Container(
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
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
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
                        Text(
                          "• Ce que nous savons faire",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.green,
                          ),
                        ),
                        Text.rich(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          TextSpan(
                            children: [
                              TextSpan(text: "Concevoir des solutions"),
                              TextSpan(
                                  text:
                                      " personnalisées\npour répondre à vos besoins",
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          padding: EdgeInsets.all(20),
                          children: [
                            Container(
                                //width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(39, 39, 48, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: .5, color: Colors.blueGrey),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "Mobile - WEB",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      "DEVELOPPEMENT d'APPLICATION MOBILE et WEB",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Conception et développement d'applications mobiles, Android et iOS et"
                                          " sites web e-commerce, vitrines ou institutionnels",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ],
                                )),
                            Container(
                                //width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(39, 39, 48, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: .5, color: Colors.blueGrey),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "API",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      "DEVELOPPEMENT d'API",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Conception et développement d'API évolutives pour les applications web et mobiles",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ],
                                )),
                            Container(
                                //width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(39, 39, 48, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: .5, color: Colors.blueGrey),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "DESIGN",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      "DESIGN - IDENTITE VISUELLE",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Conception graphique, UX/UI design, illustrations, "
                                          "supports de communication (affiches, flyers, réseaux sociaux…)",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ],
                                )),
                            Container(
                                //width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(39, 39, 48, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: .5, color: Colors.blueGrey),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "MAINTENACE",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      "MAINTENACE & SUIVI",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Nous assurons la maintenance technique de vos plateformes : mises à jour, "
                                          "sécurité, correctifs, optimisation… Pour que votre outil reste stable, "
                                          "rapide et opérationnel",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ],
                                )),
                            Container(
                                //width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(39, 39, 48, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: .5, color: Colors.blueGrey),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "REFONTE",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      "REFONTE - OPTIMISATION",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Nous analysons votre site, application ou identité visuelle, puis proposons "
                                          "une refonte sur-mesure : plus moderne, plus claire, mieux alignée avec "
                                          "vos objectifs et vos utilisateurs",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ],
                                )),
                            Container(
                                //width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(39, 39, 48, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: .5, color: Colors.blueGrey),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "FORMATIONS",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      "FORMATION ET ACCOMPAGNEMENT",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Transmission de compétences à des apprenants débutants, "
                                          "formation en technologies web et mobile, infographie, "
                                          "création de contenus pédagogiques, supervision de mini-projets",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Text.rich(
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                            TextSpan(children: [
                              TextSpan(
                                text:
                                    "Excité de prendre de nouveaux projets et de collaborer, discutons de vos idées.\n"
                                    "N'hésitez pas à ",
                              ),
                              TextSpan(
                                  text: "nous contacter ",
                                  style: TextStyle(color: Colors.green)),
                              TextSpan(text: "!")
                            ])),
                      ],
                    )),
              ),
              SizedBox(
                height: 27,
              ),
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
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(39, 39, 48, 1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: .5, color: Colors.blueGrey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*Text(
                          "• Expérience",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.green,
                          ),
                        ),*/
                        Text.rich(
                          style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          TextSpan(
                            children: [
                              TextSpan(text: "Une vision par étapes :"),
                              TextSpan(
                                  text: "\nbâtir un écosystème cohérent",
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Container(
                                    //width: double.infinity,
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 20),
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(39, 39, 48, 1),
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: .5, color: Colors.blueGrey),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/logo/rahma_matjar.png',
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Rahma Matjar',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19),
                                            ),
                                            Text('Marketplace',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    //width: double.infinity,
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 20),
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(39, 39, 48, 1),
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: .5, color: Colors.blueGrey),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/logo/rafiq.png',
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'RAFIQ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19),
                                            ),
                                            Text('Elevage',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    //width: double.infinity,
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 20),
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(39, 39, 48, 1),
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: .5, color: Colors.blueGrey),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/logo/lg_icon.png',
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'RaTech',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19),
                                            ),
                                            Text('Technologie',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    //width: double.infinity,
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 20),
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(39, 39, 48, 1),
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: .5, color: Colors.blueGrey),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/logo/lg_icon.png',
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'RGL',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19),
                                            ),
                                            Text('Livraison',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Une communauté, pas seulement une clientèle",
                                    style: GoogleFonts.aboreto(
                                      color: Colors.green,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text.rich(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                    ),
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text:
                                                "• Rahma Group ne veut pas seulement avoir des clients. Nous voulons bâtir une "),
                                        TextSpan(
                                          text: "communauté vivante, solidaire et participative, ",
                                          style: TextStyle(
                                            color: Colors.pink[700],
                                          ),
                                        ),
                                        TextSpan(
                                            text:
                                                "où chaque personne qui rejoint notre univers devient aussi actrice du changement"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text.rich(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                    ),
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text:
                                                "• Notre vision ne se limite pas à la recherche de profit. Elle repose sur une ambition plus large : "),
                                        TextSpan(
                                          text: "mettre l'entreprise au service du bien commun, ",
                                          style: TextStyle(
                                            color: Colors.pink[700],
                                          ),
                                        ),
                                        TextSpan(
                                            text:
                                                "en apportant des solutions concrètes à des besoins essentiels"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    spacing: 10,
                                    children: [
                                      Container(
                                        //width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.only(bottom: 3),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(39, 39, 48, 1),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              width: .5,
                                              color: Colors.blueGrey),
                                        ),
                                        child: Text(
                                          "Se nourrir",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        //width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.only(bottom: 3),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(39, 39, 48, 1),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              width: .5,
                                              color: Colors.blueGrey),
                                        ),
                                        child: Text(
                                          "Se soigner",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        //width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.only(bottom: 3),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(39, 39, 48, 1),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              width: .5,
                                              color: Colors.blueGrey),
                                        ),
                                        child: Text(
                                          "S'éduquer",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        //width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.only(bottom: 3),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(39, 39, 48, 1),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              width: .5,
                                              color: Colors.blueGrey),
                                        ),
                                        child: Text(
                                          "Travailler",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        //width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.only(bottom: 3),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(39, 39, 48, 1),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              width: .5,
                                              color: Colors.blueGrey),
                                        ),
                                        child: Text(
                                          "Vivre dignement",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(39, 39, 48, 1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: .5, color: Colors.blueGrey),
                      ),
                      child: Stack(
                        children: [
                          // ligne verticale
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

                          // contenu principal
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 4,
                                    backgroundColor:
                                    Colors.green,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "Nos Valeurs – Ce qui guide Rahma Group",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 26),
                              ...entries1.map(
                                    (entry) => Padding(
                                  padding: const EdgeInsets.only(left: 24, bottom: 27,),
                                  child: Row(
                                    spacing: 15,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          entry["title"]!,
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          entry["content"]!,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // overlay (ombre en bas)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            //height: 40,
                            child: IgnorePointer(
                              child: Container(
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
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(39, 39, 48, 1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: .5, color: Colors.blueGrey),
                      ),
                      child: Stack(
                        children: [
                          // ligne verticale
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

                          // contenu principal
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 4,
                                    backgroundColor:
                                    Colors.green,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "Nos Valeurs – Ce qui guide Rahma Group",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 26),
                              ...entries2.map(
                                    (entry) => Padding(
                                  padding: const EdgeInsets.only(left: 24, bottom: 27,),
                                  child: Row(
                                    spacing: 5,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          entry["title"]!,
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          entry["content"]!,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // overlay (ombre en bas)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            //height: 40,
                            child: IgnorePointer(
                              child: Container(
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
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
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
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      repeat: ImageRepeat.repeatY,
                      image: AssetImage(
                        'assets/images/static-bg.png',
                      ),
                    ),
                    color: Color.fromRGBO(39, 39, 48, 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: .5, color: Colors.blueGrey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "• Projets",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "Nos projets recents",
                        style: TextStyle(
                          fontSize: 37,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 3.5,
                          enlargeCenterPage: true,
                        ),
                        items: imageSliders,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(27),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(39, 39, 48, 1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: .5, color: Colors.blueGrey),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "• Projets",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "Nos competences",
                          style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Skills(width: width,),
                                    Container(
                                      margin: EdgeInsets.only(left: 100, right: 100),
                                      padding: EdgeInsets.only(left: 20, right: 20),
                                        //color: Colors.grey,
                                        child: Skills(width: width,)),
                                  ],
                                ),
                              ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                          width: 32,
                                        ),
                              Expanded(
                                  child: Column(
                                children: skills.map((skill) => _SkillItem(
                                  category: skill['category']!,
                                  skills: skill['skills']!,
                                )).toList(),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: 27,)
                      ],
                    ),
                  ),
                  Positioned(
                    right: 60,
                      top: 60,
                      child: OrbitRadar(),),
                ],
              ),
              SizedBox(height: 27,),
              Text(
                "• Articles",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.green,
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
              SizedBox(height: 27,),
              Row(
                spacing: 25,
                  children: [
                    Expanded(
                      child: BlogCard(
                        imageUrl: 'https://zelio-developer.botble.com/storage/main/posts/2-1200x800.png',
                        category: 'Technology Reviews',
                        date: 'Dec 05, 2024 • 2 min read',
                        title: 'How to Integrate APIs in Node.js for Your Next Project',
                        description: 'Learn how to seamlessly integrate third-party APIs in your Node.js app...',
                        link: 'https://zelio-developer.botble.com/how-to-integrate-apis-in-nodejs-for-your-next-project',
                      ),
                    ),
                    Expanded(
                      child: BlogCard(
                        imageUrl: 'https://zelio-developer.botble.com/storage/main/posts/2-1200x800.png',
                        category: 'Technology Reviews',
                        date: 'Dec 05, 2024 • 2 min read',
                        title: 'How to Integrate APIs in Node.js for Your Next Project',
                        description: 'Learn how to seamlessly integrate third-party APIs in your Node.js app...',
                        link: 'https://zelio-developer.botble.com/how-to-integrate-apis-in-nodejs-for-your-next-project',
                      ),
                    ),
                    Expanded(
                      child: BlogCard(
                        imageUrl: 'https://zelio-developer.botble.com/storage/main/posts/2-1200x800.png',
                        category: 'Technology Reviews',
                        date: 'Dec 05, 2024 • 2 min read',
                        title: 'How to Integrate APIs in Node.js for Your Next Project',
                        description: 'Learn how to seamlessly integrate third-party APIs in your Node.js app...',
                        link: 'https://zelio-developer.botble.com/how-to-integrate-apis-in-nodejs-for-your-next-project',
                      ),
                    ),

                  ],
              ),
              SizedBox(height: 27,),
              Column(
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
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(height: 27,),
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
                                    border: Border.all(width: .5, color: Colors.blueGrey),
                                  ),
                                    child: Center(child: Icon(Icons.phone_outlined, color: Colors.green,),),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Téléphone', style: TextStyle(color: Colors.grey, fontSize: 16),),
                                  Text('+227 80 76 76 90', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
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
                                    border: Border.all(width: .5, color: Colors.blueGrey),
                                  ),
                                    child: Center(child: Icon(Icons.mail_outline, color: Colors.green,),),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email', style: TextStyle(color: Colors.grey, fontSize: 16),),
                                  Text('rahmamatjar@gmail.com', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
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
                                    border: Border.all(width: .5, color: Colors.blueGrey),
                                  ),
                                    child: Center(child: Icon(Icons.person_2_outlined, color: Colors.green,),),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Facebook', style: TextStyle(color: Colors.grey, fontSize: 16),),
                                  Text('Rahma Matjar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
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
                                    border: Border.all(width: .5, color: Colors.blueGrey),
                                  ),
                                    child: Center(child: Icon(Icons.location_on_outlined, color: Colors.green,),),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Adresse', style: TextStyle(color: Colors.grey, fontSize: 16),),
                                  Text('Ny 2000, Niamey - Niger', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 27,),
              Divider(),
              SizedBox(height: 27,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("© 2025 Rahma Group, tous droits reservés", style: TextStyle(color: Colors.white),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.facebook, color: Colors.white,),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.facebook, color: Colors.white,),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.facebook, color: Colors.white,),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.facebook, color: Colors.white,),),
                      ],
                  ),
                  NavBar()
                ],
              )

            ],
          ),
        ),
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
          NavBar(),
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
        Text('<span>', style: TextStyle(color: Colors.red[800], fontSize: 17)),
        DefaultTextStyle(
          style: TextStyle(fontSize: 17.0),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText(
                'Salut ! Nous sommes Rahma Group ',
                textStyle: TextStyle(color: Colors.white),
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
              style: TextStyle(color: Colors.yellow[800], fontSize: 17)),
        ),
        Text(' <span>', style: TextStyle(color: Colors.red[800], fontSize: 17)),
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
                  color: Colors.green[800],
                  fontSize: fontSizeForm,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "au \nservice",
              style: TextStyle(
                  color: Colors.green[800],
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: " ♦",
              style: TextStyle(
                  color: Colors.green[800],
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

  Widget _buildDescription() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '<p>', style: TextStyle(color: Colors.pink[700])),
          TextSpan(
              text:
                  "Rahma Group est une entreprise à "),
          TextSpan(
              text: 'mission,',
              style: TextStyle(color: Colors.pink[700])),
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
                  child: Image.network(
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

class Skills extends StatefulWidget {
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
    'https://zelio-developer.botble.com/storage/code/skills/1.png',
    'https://zelio-developer.botble.com/storage/code/skills/2.png',
    'https://zelio-developer.botble.com/storage/code/skills/3.png',
    'https://zelio-developer.botble.com/storage/code/skills/4.png',
    'https://zelio-developer.botble.com/storage/code/skills/5.png',
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
            child: Image.network(
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
    'Next.js', 'Firebase', 'MongoDB', 'Node.js', 'Tailwind CSS'
  ];

  final List<Map<String, String>> skills = [
    {"category": "Front-End", "skills": "HTML, CSS, JavaScript, React, Angular"},
    {"category": "Back-End", "skills": "Node.js, Express, Python, Django"},
    {"category": "Databases", "skills": "MySQL, PostgreSQL, MongoDB"},
    {"category": "Tools & Platforms", "skills": "Git, Docker, AWS, Heroku"},
    {"category": "Others", "skills": "RESTful APIs, GraphQL, Agile Methodologies"},
  ];

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
      children: skills.map((skill) => _SkillItem(
        category: skill['category']!,
        skills: skill['skills']!,
      )).toList(),
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
          Text('$category:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              skills,
              style: TextStyle(color: Colors.grey),
            ))]));}}