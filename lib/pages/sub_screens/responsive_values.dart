import 'package:flutter/material.dart';

class ResponsiveValuesSection extends StatelessWidget {
  // Données d'exemple - remplacez par vos vraies données
  final List<Map<String, String>> entries1 = [
    {"title": "Excellence", "content": "Nous nous efforçons d'atteindre l'excellence dans tout ce que nous faisons."},
    {"title": "Innovation", "content": "Nous encourageons la créativité et l'innovation pour rester à la pointe."},
    {"title": "Intégrité", "content": "L'honnêteté et la transparence sont au cœur de nos actions."},
  ];

  final List<Map<String, String>> entries2 = [
    {"title": "Respect", "content": "Nous respectons nos collaborateurs, clients et partenaires."},
    {"title": "Engagement", "content": "Nous nous engageons pleinement envers nos objectifs et notre mission."},
    {"title": "Durabilité", "content": "Nous œuvrons pour un avenir durable et responsable."},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Définir les breakpoints
        bool isMobile = constraints.maxWidth < 600;
        bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        bool isDesktop = constraints.maxWidth >= 1024;

        // Calculer le padding adaptatif
        double horizontalPadding = isMobile ? 16 : (isTablet ? 24 : 32);
        double verticalPadding = isMobile ? 16 : 20;

        // Calculer les tailles de police adaptatives
        double titleFontSize = isMobile ? 14 : (isTablet ? 15 : 16);
        double contentFontSize = isMobile ? 13 : (isTablet ? 14 : 15);

        // Calculer l'espacement adaptatif
        double cardSpacing = isMobile ? 16 : 20;
        double itemSpacing = isMobile ? 20 : 27;

        if (isMobile) {
          // Layout vertical pour mobile
          return Column(
            children: [
              _buildValueCard(
                context,
                entries1,
                horizontalPadding,
                verticalPadding,
                titleFontSize,
                contentFontSize,
                itemSpacing,
                isMobile: true,
              ),
              SizedBox(height: cardSpacing),
              _buildValueCard(
                context,
                entries2,
                horizontalPadding,
                verticalPadding,
                titleFontSize,
                contentFontSize,
                itemSpacing,
                isMobile: true,
                isSecondCard: true,
              ),
            ],
          );
        } else {
          // Layout horizontal pour tablet/desktop
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildValueCard(
                  context,
                  entries1,
                  horizontalPadding,
                  verticalPadding,
                  titleFontSize,
                  contentFontSize,
                  itemSpacing,
                ),
              ),
              SizedBox(width: cardSpacing),
              Expanded(
                flex: 2,
                child: _buildValueCard(
                  context,
                  entries2,
                  horizontalPadding,
                  verticalPadding,
                  titleFontSize,
                  contentFontSize,
                  itemSpacing,
                  isSecondCard: true,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildValueCard(
      BuildContext context,
      List<Map<String, String>> entries,
      double horizontalPadding,
      double verticalPadding,
      double titleFontSize,
      double contentFontSize,
      double itemSpacing, {
        bool isMobile = false,
        bool isSecondCard = false,
      }) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: isMobile ? 300 : 400,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(39, 39, 48, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 0.5, color: Colors.blueGrey),
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
              // En-tête
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
                        fontSize: titleFontSize,
                      ),
                      maxLines: isMobile ? 2 : 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),

              // Liste des valeurs
              LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      children: entries.map((entry) => _buildValueEntry(
                        entry,
                        contentFontSize,
                        itemSpacing,
                        isMobile,
                        isSecondCard,
                      )).toList(),
                    ),
                  );
                },
              ),
            ],
          ),

          // Overlay dégradé
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 40,
            child: IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
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

  Widget _buildValueEntry(
      Map<String, String> entry,
      double fontSize,
      double bottomSpacing,
      bool isMobile,
      bool isSecondCard,
      ) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        bottom: bottomSpacing,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (isMobile) {
            // Layout vertical pour mobile
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry["title"]!,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  entry["content"]!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize - 1,
                    height: 1.4,
                  ),
                ),
              ],
            );
          } else {
            // Layout horizontal pour tablet/desktop
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: isSecondCard ? 1 : 2,
                  child: Text(
                    entry["title"]!,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: isSecondCard ? 5 : 15),
                Expanded(
                  flex: 3,
                  child: Text(
                    entry["content"]!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize - 1,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

