import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/animated_background.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/contact_section.dart';

void main() {
  runApp(const DharumarPortfolio());
}

class DharumarPortfolio extends StatelessWidget {
  const DharumarPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dharumar V — Senior Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  final _scrollController = ScrollController();

  // Section keys for scroll-to navigation
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  late final List<GlobalKey> _sectionKeys;

  @override
  void initState() {
    super.initState();
    _sectionKeys = [
      _aboutKey,
      _skillsKey,
      _experienceKey,
      _projectsKey,
      _contactKey,
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated background (fixed behind everything)
          const Positioned.fill(child: AnimatedBackground()),

          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Hero
                const HeroSection(),

                // About
                Container(key: _aboutKey, child: const AboutSection()),

                // Skills
                Container(key: _skillsKey, child: const SkillsSection()),

                // Experience
                Container(key: _experienceKey, child: const ExperienceSection()),

                // Projects
                Container(key: _projectsKey, child: const ProjectsSection()),

                // Contact + Footer
                Container(key: _contactKey, child: const ContactSection()),
              ],
            ),
          ),

          // Navbar (always on top)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              scrollController: _scrollController,
              sectionKeys: _sectionKeys,
            ),
          ),
        ],
      ),
    );
  }
}
