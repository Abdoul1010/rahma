import 'package:flutter/material.dart';

Widget build(BuildContext context) {
  // Obtenir les dimensions de l'écran
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  
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

  return Container(
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
        ? _buildMobileLayout(stats, iconSize, numberFontSize, textFontSize, itemPadding)
        : _buildDesktopLayout(stats, iconSize, numberFontSize, textFontSize, itemPadding),
  );
}

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