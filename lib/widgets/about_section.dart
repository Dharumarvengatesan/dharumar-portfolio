import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      color: AppTheme.bgColor,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          const _SectionTitle(title: 'About', highlight: 'Me'),
          const SizedBox(height: 48),
          isMobile
              ? Column(
                  children: _cards(),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _cards()
                      .map((c) => Expanded(child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: c,
                          )))
                      .toList(),
                ),
        ],
      ),
    );
  }

  List<Widget> _cards() => [
        _AboutCard(
          delay: 100.ms,
          title: 'Experience',
          accentColor: AppTheme.accentCyan,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _InfoRow('Role:', 'Senior Flutter Developer'),
              const SizedBox(height: 8),
              const _InfoRow('Experience:', '6+ Years'),
              const SizedBox(height: 16),
              Text(
                '6+ years of professional experience in Flutter development. Strong expertise in building native-feeling Android and iOS applications with a single codebase.',
                style: AppTheme.bodyLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _AboutCard(
          delay: 200.ms,
          title: 'Expertise',
          accentColor: AppTheme.accentPurple,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '✓ Advanced Android/iOS app development',
              '✓ Firebase & Push Notifications',
              '✓ Complex REST API integration',
              '✓ Robust state management (Provider, Bloc, GetX)',
              '✓ Efficient offline storage (SQLite, Hive)',
              '✓ App Store & Play Console Deployment',
            ]
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(e, style: AppTheme.bodyLarge),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 16),
        _AboutCard(
          delay: 300.ms,
          title: 'Impact',
          accentColor: AppTheme.accentCyan,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '🚀 6+ Apps live on Google Play',
              '⚡ 99.9% Crash-Free User Sessions',
              '🏗️ Scalable Clean Architecture Implementation',
              '🔄 Automated CI/CD Pipelines with Codemagic',
              '📈 Enterprise Workflow Automation',
            ]
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(e, style: AppTheme.bodyLarge),
                    ))
                .toList(),
          ),
        ),
      ];
}

class _AboutCard extends StatelessWidget {
  final Duration delay;
  final String title;
  final Color accentColor;
  final Widget content;
  const _AboutCard(
      {required this.delay,
      required this.title,
      required this.accentColor,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.glass,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: AppTheme.headingMedium
                  .copyWith(color: accentColor, fontSize: 22)),
          const SizedBox(height: 16),
          content,
        ],
      ),
    )
        .animate()
        .fadeIn(delay: delay, duration: 500.ms)
        .slideY(begin: 0.2, end: 0);
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTheme.bodyLarge.copyWith(fontSize: 15),
        children: [
          TextSpan(
              text: '$label ',
              style: const TextStyle(
                  color: AppTheme.textMain, fontWeight: FontWeight.w700)),
          TextSpan(text: value),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String highlight;
  const _SectionTitle({required this.title, required this.highlight});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTheme.displayMedium.copyWith(fontSize: 36),
        children: [
          TextSpan(text: '$title '),
          WidgetSpan(
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  AppTheme.cyanPurpleGradient.createShader(bounds),
              child: Text(highlight,
                  style: AppTheme.displayMedium
                      .copyWith(fontSize: 36, color: Colors.white)),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 500.ms)
        .slideY(begin: 0.2, end: 0);
  }
}
