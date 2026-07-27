import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import '../theme/app_theme.dart';

enum _FormStatus { idle, loading, success, error }

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _msgCtrl = TextEditingController();
  _FormStatus _status = _FormStatus.idle;

  static const _formspreeId = 'xeeyvlnw';

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _status = _FormStatus.loading);

    try {
      final res = await http.post(
        Uri.parse('https://formspree.io/f/$_formspreeId'),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body: jsonEncode({
          'name': _nameCtrl.text,
          'email': _emailCtrl.text,
          'message': _msgCtrl.text,
        }),
      );

      if (res.statusCode == 200) {
        setState(() => _status = _FormStatus.success);
        _nameCtrl.clear();
        _emailCtrl.clear();
        _msgCtrl.clear();
      } else {
        setState(() => _status = _FormStatus.error);
      }
    } catch (_) {
      setState(() => _status = _FormStatus.error);
    }

    await Future.delayed(const Duration(seconds: 5));
    if (mounted) setState(() => _status = _FormStatus.idle);
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      color: AppTheme.bgColorAlt,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          _SectionTitle(),
          const SizedBox(height: 48),
          isMobile
              ? Column(children: [_buildInfo(), const SizedBox(height: 32), _buildForm()])
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildInfo()),
                    const SizedBox(width: 48),
                    Expanded(child: _buildForm()),
                  ],
                ),
          const SizedBox(height: 60),
          // Footer
          Text(
            '© ${DateTime.now().year} Dharumar V. All rights reserved.',
            style: AppTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Let's connect!", style: AppTheme.headingLarge.copyWith(fontSize: 24)),
        const SizedBox(height: 12),
        Text(
          "Whether you have a question, want to collaborate on a mobile project, or simply want to say hello, feel free to drop a message.",
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        _ContactLink(
          icon: '✉️',
          label: 'dharumar13@gmail.com',
          onTap: () => _launch('mailto:dharumar13@gmail.com'),
        ),
        const SizedBox(height: 12),
        _ContactLink(
          icon: '📞',
          label: '+91 8189907917',
          onTap: () => _launch('tel:+918189907917'),
        ),
        const SizedBox(height: 12),
        _ContactLink(
          icon: '🐙',
          label: 'github.com/Dharumarvengatesan',
          onTap: () => _launch('https://github.com/Dharumarvengatesan'),
        ),
        const SizedBox(height: 12),
        _ContactLink(
          icon: '🔗',
          label: 'LinkedIn Profile',
          onTap: () => _launch('https://www.linkedin.com/in/dharumar-v-flutter-developer'),
        ),
        const SizedBox(height: 12),
        const _ContactLink(
          icon: '📍',
          label: 'Kallakurichi, Tamil Nadu, India',
        ),
      ],
    ).animate().fadeIn(delay: 100.ms, duration: 500.ms).slideX(begin: -0.1, end: 0);
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.glass,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.glassBorder),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status banners
            if (_status == _FormStatus.success)
              _StatusBanner(
                message: '✅  Message sent! I\'ll get back to you soon.',
                color: const Color(0xFF00FFB4),
                bgColor: const Color(0xFF00FFB4),
              ),
            if (_status == _FormStatus.error)
              _StatusBanner(
                message: '❌  Something went wrong. Please try again.',
                color: const Color(0xFFFF6B6B),
                bgColor: const Color(0xFFFF5050),
              ),

            _FormField(
              controller: _nameCtrl,
              label: 'Your Name',
              validator: (v) => v!.isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 16),
            _FormField(
              controller: _emailCtrl,
              label: 'Your Email',
              keyboardType: TextInputType.emailAddress,
              validator: (v) =>
                  v!.contains('@') ? null : 'Please enter a valid email',
            ),
            const SizedBox(height: 16),
            _FormField(
              controller: _msgCtrl,
              label: 'Your Message',
              maxLines: 5,
              validator: (v) => v!.isEmpty ? 'Please enter a message' : null,
            ),
            const SizedBox(height: 20),
            _SubmitButton(
              status: _status,
              onTap: _submit,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 500.ms).slideX(begin: 0.1, end: 0);
  }
}

class _ContactLink extends StatefulWidget {
  final String icon;
  final String label;
  final VoidCallback? onTap;
  const _ContactLink({required this.icon, required this.label, this.onTap});

  @override
  State<_ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<_ContactLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            Text(widget.icon, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 12),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: AppTheme.bodyLarge.copyWith(
                color: _hovered ? AppTheme.accentCyan : AppTheme.textMuted,
                fontSize: 15,
              ),
              child: Text(widget.label),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
    this.keyboardType,
    this.maxLines,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      validator: validator,
      style: AppTheme.bodyLarge.copyWith(color: AppTheme.textMain, fontSize: 15),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: AppTheme.bodyLarge.copyWith(color: AppTheme.textMuted.withOpacity(0.6)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.04),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppTheme.glassBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppTheme.glassBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppTheme.accentCyan, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}

class _SubmitButton extends StatefulWidget {
  final _FormStatus status;
  final VoidCallback onTap;
  const _SubmitButton({required this.status, required this.onTap});

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isLoading = widget.status == _FormStatus.loading;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: isLoading ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isLoading ? null : widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            gradient: AppTheme.cyanPurpleGradient,
            borderRadius: BorderRadius.circular(50),
            boxShadow: _hovered && !isLoading
                ? [BoxShadow(color: AppTheme.accentCyan.withOpacity(0.4), blurRadius: 20)]
                : [],
          ),
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : const Text('Send Message',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
        ),
      ),
    );
  }
}

class _StatusBanner extends StatelessWidget {
  final String message;
  final Color color;
  final Color bgColor;
  const _StatusBanner(
      {required this.message, required this.color, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.1),
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(message,
          style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w500)),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.2, end: 0);
  }
}

class _SectionTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
            fontSize: 36, fontWeight: FontWeight.w800, color: AppTheme.textMain),
        children: [
          const TextSpan(text: 'Get In '),
          WidgetSpan(
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  AppTheme.cyanPurpleGradient.createShader(bounds),
              child: const Text('Touch',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.white)),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2, end: 0);
  }
}
