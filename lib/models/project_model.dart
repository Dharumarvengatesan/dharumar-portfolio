import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String description;
  final List<String> tech;
  final String playStoreLink;
  final Color colorStart;
  final Color colorEnd;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.tech,
    required this.playStoreLink,
    required this.colorStart,
    required this.colorEnd,
  });
}

const List<ProjectModel> projects = [
  ProjectModel(
    title: 'PACT - Team Management',
    description: 'Enterprise workflow and activity tracking application with push notifications, API integration, task workflows, and performance optimization.',
    tech: ['Flutter', 'Dart', 'REST API', 'Push Notifications'],
    playStoreLink: 'https://play.google.com/store/apps/details?id=com.fortigrid.pact',
    colorStart: Color(0xFF2E3192),
    colorEnd: Color(0xFF1BFFFF),
  ),
  ProjectModel(
    title: 'Action Tracker',
    description: 'Enterprise workflow and activity tracking application with push notifications, API integration, task workflows, and performance optimization.',
    tech: ['Flutter', 'Dart', 'REST API', 'Push Notifications'],
    playStoreLink: 'https://play.google.com/store/apps/details?id=com.action.tracker',
    colorStart: Color(0xFF4A00E0),
    colorEnd: Color(0xFF8E2DE2),
  ),
  ProjectModel(
    title: 'PACT Vehicle',
    description: 'Vehicle management and tracking app with form workflows, API integration, and enterprise mobility features.',
    tech: ['Flutter', 'State Management', 'API Integration'],
    playStoreLink: 'https://play.google.com/store/apps/details?id=com.fortigrid.pact.vehicle',
    colorStart: Color(0xFFD4145A),
    colorEnd: Color(0xFFFBB03B),
  ),
  ProjectModel(
    title: 'True Art of Yoga',
    description: 'Wellness application featuring authentication, subscription flow, content management, and responsive mobile UI.',
    tech: ['Flutter', 'Firebase Auth', 'UI/UX', 'Payments'],
    playStoreLink: 'https://play.google.com/store/apps/details?id=studio.tangerinedesigns.trueartofyoga',
    colorStart: Color(0xFF009245),
    colorEnd: Color(0xFFFCEE21),
  ),
  ProjectModel(
    title: 'OPW Central',
    description: 'Enterprise application with dashboards, notifications, backend integrations, and workflow automation.',
    tech: ['Flutter', 'Provider', 'Dashboards'],
    playStoreLink: 'https://play.google.com/store/apps/details?id=studio.tangerinedesigns.opwcentral',
    colorStart: Color(0xFF662D8C),
    colorEnd: Color(0xFFED1E79),
  ),
  ProjectModel(
    title: 'PACT Task',
    description: 'Task management system with notifications, user roles, and workflow tracking.',
    tech: ['Flutter', 'Bloc/GetX', 'Workflow'],
    playStoreLink: 'https://play.google.com/store/apps/details?id=com.fortigrid.pact.task',
    colorStart: Color(0xFF00A8C5),
    colorEnd: Color(0xFFFFFF7E),
  ),
];
