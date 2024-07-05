import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato/widgets/home_grid.dart';
import 'package:url_launcher/url_launcher.dart';
import '../content/global.dart';
import '../content/home.dart';
import '../pages/menu.dart';
import '../theme/colors.dart';
import '../widgets/consultation.dart';
import '../widgets/menu_button.dart';
import '../content/types/card.dart' as types;

Function() href(String url) {
  return () async {
    final uri = Uri.parse(url);
    print('Function href called: $uri');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (error) {
      print('Function href caught error: $error');
    }
  };
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              ConsultationBanner(
                backgroundColor: colorScheme.tertiary,
                color: colorScheme.onTertiary,
                onPressed: href('http://bit.ly/potatoradar'),
              ),
              HomeContent(colorScheme: colorScheme),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: MenuButton(
                onPressed: () {
                  showDialog(
                    barrierColor: purple90,
                    context: context,
                    builder: (BuildContext context) {
                      return const MenuPage(active: 'Home');
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                heroParts.join(' '),
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: HomeGrid(
                columnsToTry: const [6, 3, 2, 1],
                crossAxisItemExtent: 216.0,
                gap: const HomeGridGap(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                children: [
                  for (final card in cards) HomeCard(card),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: href('https://p.ota.to/sitemap'),
                    child: Text(
                      sitemap,
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                  ),
                  const Text('—'),
                  TextButton(
                    onPressed: href('https://p.ota.to/privacy'),
                    child: Text(
                      privacyPolicy,
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: href('https://www.linkedin.com/company/potato/'),
                  child: SvgPicture.asset(
                    'assets/svg/linkedin.svg',
                    color: colorScheme.onSurface,
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
                TextButton(
                  onPressed: href('https://twitter.com/PotatoStudios_'),
                  child: SvgPicture.asset(
                    'assets/svg/x.svg',
                    color: colorScheme.onSurface,
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
                TextButton(
                  onPressed: href('https://youtube.com/@LifeAtPotato'),
                  child: SvgPicture.asset(
                    'assets/svg/youtube.svg',
                    color: colorScheme.onSurface,
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: href('https://goo.gl/maps/1DMyLJx6JMMCKyWM9'),
              child: Text(
                address,
                style: TextStyle(color: colorScheme.onSurface),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: SvgPicture.asset(
                      "assets/svg/potato-wordmark.svg",
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(footerParts[1]),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: SvgPicture.asset(
                      "assets/svg/akqa.svg",
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(footerParts[3]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatefulWidget {
  const HomeCard(
    this.card, {
    super.key,
  });

  final types.Card card;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.card.title,
              style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(widget.card.type, style: const TextStyle(color: grey)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onHover: (hover) {
                setState(() {
                  this.hover = hover;
                });
              },
              clipBehavior: Clip.antiAliasWithSaveLayer,
              onPressed: () {
                print('Card button clicked: ${widget.card.title}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: const Size(216.0, 291.0),
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    widget.card.imagePath,
                    height: 291.0,
                    width: 216.0,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: hover ? 1.0 : 0.0,
                    child: Container(
                      color: colorScheme.primary,
                      height: 291.0,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.card.description,
                            style: TextStyle(color: colorScheme.onPrimary),
                          ),
                          Text(
                            widget.card.tags.join(' • '),
                            style: TextStyle(color: colorScheme.onPrimary),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
