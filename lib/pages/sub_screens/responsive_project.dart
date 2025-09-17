import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ResponsiveProjectsSection extends StatelessWidget {
  // Données des projets
  final List<Map<String, String>> projectData = [
    {
      'image': 'assets/logo/rahma_matjar.png',
      'title': 'Marketplace Rahma Matjar',
      'desc': 'Application mobile de e-commerce',
      'category': 'FullStack Mobile',
      'customer': 'Rahma Matjar',
      'date': '2024',
      'url': 'https://play.google.com/store/apps/details?id=ne.rahma.matjar&pcampaignid=web_share',
    },
    {
      'image': 'assets/logo/rafiq.png',
      'title': 'RAFIQ',
      'desc': 'Système de gestion',
      'category': 'FullStack Mobile, web',
      'customer': 'RAFIQ',
      'date': '2025',
      'url': '',
    },
  ];

  ResponsiveProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        bool isDesktop = constraints.maxWidth >= 1024;

        // Calculs adaptatifs
        double containerPadding = isMobile ? 12 : (isTablet ? 16 : 20);
        double titleFontSize = isMobile ? 16 : (isTablet ? 18 : 19);
        double subtitleFontSize = isMobile ? 24 : (isTablet ? 32 : 37);
        double aspectRatio = isMobile ? 1.2 : (isTablet ? 2.5 : 3.5);

        return AnimatedGradientBorderProject(
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
            padding: EdgeInsets.all(containerPadding),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                repeat: ImageRepeat.repeatY,
                image: AssetImage('assets/images/static-bg.png'),
              ),
              color: const Color.fromRGBO(39, 39, 48, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 0.5, color: Colors.blueGrey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "• Projets",
                  style: TextStyle(
                    fontSize: titleFontSize,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "Nos projets récents",
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),

                // Carousel responsive
                SizedBox(
                  height: isMobile ? 500 : 450, // Plus de hauteur sur mobile
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: isMobile ? 500 : 450, // Ajouter cette ligne
                      aspectRatio: aspectRatio,
                      enlargeCenterPage: true,
                      viewportFraction: isMobile ? 0.95 : (isTablet ? 0.85 : 0.8),
                      enableInfiniteScroll: projectData.length > 1,
                    ),
                    items: _buildResponsiveProjectCards(context, isMobile, isTablet),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildResponsiveProjectCards(BuildContext context, bool isMobile, bool isTablet) {
    return projectData.map((item) =>
        ResponsiveProjectCard(
          projectData: item,
          isMobile: isMobile,
          isTablet: isTablet,
        )
    ).toList();
  }
}

class ResponsiveProjectCard extends StatelessWidget {
  final Map<String, String> projectData;
  final bool isMobile;
  final bool isTablet;

  const ResponsiveProjectCard({
    super.key,
    required this.projectData,
    required this.isMobile,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    // Calculs adaptatifs
    double cardPadding = isMobile ? 10 : 15;
    double titleFontSize = isMobile ? 20 : (isTablet ? 24 : 27);
    double contentFontSize = isMobile ? 12 : (isTablet ? 13 : 14);
    double imageHeight = isMobile ? 120 : (isTablet ? 180 : 250);
    //double imageHeight = isMobile ? 150 : (isTablet ? 200 : 290);
    double borderRadius = isMobile ? 8 : 3;

    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(39, 39, 48, 1),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(width: 0.5, color: Colors.blueGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildCardContent(titleFontSize, contentFontSize, imageHeight),
          )),
          Expanded(flex: 1,child: _buildActionButton()),
        ],
      ),
    );
  }

  Widget _buildCardContent(double titleFontSize, double contentFontSize, double imageHeight) {
    if (isMobile) {
      // Layout vertical pour mobile
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image en haut
          Center(
            child: SizedBox(
              height: imageHeight,
              child: Image.asset(
                projectData['image']!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Contenu en bas
          Expanded(child: _buildProjectInfo(titleFontSize, contentFontSize)),
        ],
      );
    } else {
      // Layout horizontal pour tablet/desktop
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              height: imageHeight,
              child: Image.asset(
                projectData['image']!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildProjectInfo(titleFontSize, contentFontSize),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildProjectInfo(double titleFontSize, double contentFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titre
        Padding(
          padding: EdgeInsets.only(left: isMobile ? 0 : 8.0),
          child: Text(
            projectData['title']!,
            style: GoogleFonts.aboreto(
              color: Colors.blue,
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
            maxLines: isMobile ? 2 : 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 8),

        // Description
        Padding(
          padding: EdgeInsets.only(left: isMobile ? 0 : 8.0),
          child: Text(
            projectData['desc']!,
            style: TextStyle(
              color: Colors.white,
              fontSize: contentFontSize,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Section informations
        Text(
          "• Informations sur le projet",
          style: TextStyle(
            color: Colors.pink[700],
            fontSize: contentFontSize,
          ),
        ),
        const Divider(),

        // Détails du projet
        Expanded(
          child: SingleChildScrollView(
            child: _buildProjectDetails(contentFontSize),
          ),
        ),
        //_buildProjectDetails(contentFontSize),
      ],
    );
  }

  Widget _buildProjectDetails(double fontSize) {
    final details = [
      {'label': '• Catégorie', 'value': projectData['category']!},
      {'label': '• Client', 'value': projectData['customer']!},
      {'label': '• Date de début', 'value': projectData['date']!},
    ];

    return Column(
      children: details.map((detail) =>
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isMobile ? 2 : 1,
                    child: Text(
                      detail['label']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: isMobile ? 2 : 1,
                    child: Text(
                      detail['value']!,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: fontSize,
                      ),
                      textAlign: isMobile ? TextAlign.left : TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
      ).toList(),
    );
  }

  Widget _buildActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //if (!isMobile) Expanded(flex: 3, child: Container()),
        Expanded(
          flex: isMobile ? 1 : 1,
          child: TextButton.icon(
            onPressed: () {
              if (projectData['url']!.isNotEmpty) {
                launchUrl(Uri.parse(projectData['url']!));
              }
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 8 : 12,
                horizontal: isMobile ? 12 : 16,
              ),
            ),
            icon: Icon(
              Icons.call_made_outlined,
              color: Colors.white,
              size: isMobile ? 16 : 20,
            ),
            label: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2, color: Colors.blueGrey),
                ),
              ),
              child: Text(
                'Voir plus',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Placeholder pour AnimatedGradientBorder - remplacez par votre implémentation
class AnimatedGradientBorderProject extends StatelessWidget {
  final double borderSize;
  final double glowSize;
  final int animationTime;
  final List<Color> gradientColors;
  final double? animationProgress;
  final BorderRadius borderRadius;
  final Widget child;

  const AnimatedGradientBorderProject({
    super.key,
    required this.borderSize,
    required this.glowSize,
    required this.animationTime,
    required this.gradientColors,
    required this.animationProgress,
    required this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Implémentation simplifiée - remplacez par votre AnimatedGradientBorder
    return child;
  }
}