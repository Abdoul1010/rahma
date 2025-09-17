import 'dart:async';

import 'package:flutter/material.dart';

import '../../commun/anime/circular_container.dart';

class ResponsiveSkillsSection extends StatelessWidget {
  final double width;

  // Données des compétences - remplacez par vos vraies données
  final List<Map<String, String>> skills = [
    {
      'category': 'Frontend',
      'skills': 'React, Vue.js, Angular, Flutter, HTML/CSS, JavaScript, TypeScript'
    },
    {
      'category': 'Backend',
      'skills': 'Node.js, Python, Java, PHP, Laravel, Django, Express.js'
    },
    {
      'category': 'Database',
      'skills': 'MySQL, PostgreSQL, MongoDB, Firebase, SQLite'
    },
    {
      'category': 'Mobile',
      'skills': 'Flutter, React Native, Android, iOS'
    },
    {
      'category': 'Cloud',
      'skills': 'AWS, Google Cloud, Azure, Docker, Kubernetes'
    },
    {
      'category': 'DevOps',
      'skills': 'Git, CI/CD, Jenkins, Docker, Linux, Nginx'
    },
  ];

  ResponsiveSkillsSection({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        bool isDesktop = constraints.maxWidth >= 1024;

        // Calculs adaptatifs
        double containerPadding = isMobile ? 16 : (isTablet ? 20 : 27);
        double titleFontSize = isMobile ? 16 : (isTablet ? 18 : 19);
        double subtitleFontSize = isMobile ? 24 : (isTablet ? 30 : 37);
        double verticalSpacing = isMobile ? 16 : 20;

        return Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(containerPadding),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(39, 39, 48, 1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 0.5, color: Colors.blueGrey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // En-tête
                  _buildHeader(titleFontSize, subtitleFontSize, isMobile),
                  SizedBox(height: verticalSpacing),

                  // Contenu principal adaptatif
                  _buildContent(isMobile, isTablet, isDesktop),

                  SizedBox(height: containerPadding),
                ],
              ),
            ),

            // OrbitRadar positionné de manière responsive
            if (!isMobile) _buildOrbitRadar(isMobile, isTablet),
          ],
        );
      },
    );
  }

  Widget _buildHeader(double titleFontSize, double subtitleFontSize, bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• Compétences",
            style: TextStyle(
              fontSize: titleFontSize,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "De ce que nous utilisons",
            style: TextStyle(
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• Compétences",
            style: TextStyle(
              fontSize: titleFontSize,
              color: Colors.blue,
            ),
          ),
          Text(
            "De ce que nous utilisons",
            style: TextStyle(
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildContent(bool isMobile, bool isTablet, bool isDesktop) {
    if (isMobile) {
      // Layout vertical pour mobile
      return Column(
        children: [
          // Section Skills (graphiques) en premier
          _buildSkillsGraphics(isMobile, isTablet),
          const SizedBox(height: 24),

          // Divider horizontal
          const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 32,
          ),

          // Section liste des compétences
          _buildSkillsList(isMobile),
        ],
      );
    } else {
      // Layout horizontal pour tablet/desktop
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: isTablet ? 1 : 1,
              child: _buildSkillsGraphics(isMobile, isTablet),
            ),

            // Divider vertical
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              width: 32,
            ),

            Expanded(
              flex: isTablet ? 1 : 1,
              child: _buildSkillsList(isMobile),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildSkillsGraphics(bool isMobile, bool isTablet) {
    double skillsMargin = isMobile ? 20 : (isTablet ? 60 : 100);

    return Column(
      children: [
        Skills(width: width),
        Container(
          margin: EdgeInsets.symmetric(horizontal: skillsMargin),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Skills(width: width),
        ),
      ],
    );
  }

  Widget _buildSkillsList(bool isMobile) {
    double fontSize = isMobile ? 12 : 14;
    double categoryFontSize = isMobile ? 13 : 14;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skills
          .map((skill) => ResponsiveSkillItem(
        category: skill['category']!,
        skills: skill['skills']!,
        isMobile: isMobile,
        categoryFontSize: categoryFontSize,
        skillsFontSize: fontSize,
      ))
          .toList(),
    );
  }

  Widget _buildOrbitRadar(bool isMobile, bool isTablet) {
    double rightPosition = isMobile ? 20 : (isTablet ? 40 : 60);
    double topPosition = isMobile ? 40 : (isTablet ? 50 : 60);

    return Positioned(
      right: rightPosition,
      top: topPosition,
      child: OrbitRadar(),
    );
  }
}

class ResponsiveSkillItem extends StatelessWidget {
  final String category;
  final String skills;
  final bool isMobile;
  final double categoryFontSize;
  final double skillsFontSize;

  const ResponsiveSkillItem({
    Key? key,
    required this.category,
    required this.skills,
    required this.isMobile,
    required this.categoryFontSize,
    required this.skillsFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double verticalPadding = isMobile ? 6 : 8;

    if (isMobile) {
      // Layout vertical pour mobile
      return Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$category:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: categoryFontSize,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                skills,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: skillsFontSize,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // Layout horizontal pour tablet/desktop
      return Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Text(
                '$category:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: categoryFontSize,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                skills,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: skillsFontSize,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

// Placeholder pour Skills - remplacez par votre implémentation
/*class Skills extends StatelessWidget {
  final double width;

  const Skills({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: width * 0.3,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: const Center(
        child: Text(
          'Skills Chart',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}*/


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
}