import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveVisionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                  ? _buildMobileLayout(screenWidth)
                  : _buildDesktopLayout(screenWidth, isTablet),
              ],
            ),
          ),
        );
      },
    );
  }

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
  Widget _buildMobileLayout(double screenWidth) {
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
  Widget _buildDesktopLayout(double screenWidth, bool isTablet) {
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
  Widget _buildProjectCard(Map<String, String> project, double screenWidth, bool isMobileView) {
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
  Widget _buildDescriptiveContent(double screenWidth, {required bool isMobileView}) {
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
        children: needs.map((need) => _buildNeedTag(need, screenWidth)).toList(),
      );
    } else {
      // Version desktop : tags en ligne
      return Row(
        children: needs
            .map((need) => Padding(
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
}

// Widget AnimatedGradientBorder (placeholder - remplacez par votre implémentation)
class AnimatedGradientBorder extends StatelessWidget {
  final double borderSize;
  final double glowSize;
  final int animationTime;
  final List<Color> gradientColors;
  final double? animationProgress;
  final BorderRadius borderRadius;
  final Widget child;

  const AnimatedGradientBorder({
    Key? key,
    required this.borderSize,
    required this.glowSize,
    required this.animationTime,
    required this.gradientColors,
    this.animationProgress,
    required this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implémentation simplifiée - remplacez par votre widget d'animation
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: glowSize.toDouble(),
            spreadRadius: borderSize,
          ),
        ],
      ),
      child: child,
    );
  }
}