import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class Navbar extends StatefulWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;

  const Navbar({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 50;
    if (scrolled != _scrolled) {
      setState(() => _scrolled = scrolled);
    }
  }

  void _scrollToSection(int index) {
    final key = widget.sectionKeys[index];
    final ctx = key.currentContext;
    if (ctx == null) return;

    final renderBox = ctx.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.attached) return;

    // Absolute Y position of section in scroll content:
    //   current scroll offset + where the section appears on screen now
    //   minus navbar height so content isn't hidden behind the fixed navbar
    const navbarHeight = 72.0;
    final dy = renderBox.localToGlobal(Offset.zero).dy;
    final targetOffset =
        (widget.scrollController.offset + dy - navbarHeight).clamp(
      0.0,
      widget.scrollController.position.maxScrollExtent,
    );

    widget.scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: _scrolled
            ? AppTheme.bgColor.withValues(alpha: 0.92)
            : Colors.transparent,
        border: _scrolled
            ? Border(
                bottom: BorderSide(
                  color: Colors.white.withValues(alpha: 0.08),
                  width: 1,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          // Logo
          ShaderMask(
            shaderCallback: (bounds) =>
                AppTheme.cyanPurpleGradient.createShader(bounds),
            child: const Text(
              'Dharumar V.',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          if (!isMobile) ...[
            _NavLink('About', () => _scrollToSection(0)),
            _NavLink('Skills', () => _scrollToSection(1)),
            _NavLink('Experience', () => _scrollToSection(2)),
            _NavLink('Projects', () => _scrollToSection(3)),
            _NavLink('Contact', () => _scrollToSection(4)),
          ] else
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.textMain),
              onPressed: () => _showMobileMenu(context),
            ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    final labels = ['About', 'Skills', 'Experience', 'Projects', 'Contact'];
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.bgColorAlt,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(labels.length, (i) => ListTile(
            title: Text(labels[i],
                style: const TextStyle(color: AppTheme.textMain, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(i);
            },
          )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _hovered ? AppTheme.accentCyan : AppTheme.textMuted,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
