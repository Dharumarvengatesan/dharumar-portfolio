class ExperienceModel {
  final String role;
  final String company;
  final String location;
  final String period;
  final List<String> tech;
  final List<String> description;
  final String? note;

  const ExperienceModel({
    required this.role,
    required this.company,
    required this.location,
    required this.period,
    required this.tech,
    required this.description,
    this.note,
  });
}

const List<ExperienceModel> experiences = [
  ExperienceModel(
    role: 'Senior Android Developer',
    company: 'Fortigrid Design Studio Pvt Ltd',
    location: 'Coimbatore, Tamil Nadu',
    period: 'Mar 2025 – Jul 2026',
    tech: ['Flutter', 'Dart', 'BLoC', 'REST API', 'Firebase', 'Dio', 'GoRouter', 'Push Notifications', 'Android', 'iOS'],
    description: [
      'Developed enterprise-grade mobile and web applications using Flutter.',
      'Collaborated with QA teams to ensure high-quality, bug-free releases.',
      'Designed and optimized reusable components for cross-platform development.',
      'Led code reviews and mentored junior developers.',
    ],
  ),
  ExperienceModel(
    role: 'Senior Application Developer',
    company: 'Fortigrid India Pvt Ltd',
    location: 'Coimbatore, Tamil Nadu',
    period: 'Aug 2023 – Feb 2025',
    tech: ['Flutter', 'Dart', 'BLoC', 'REST APIs', 'Firebase', 'Dio', 'Android', 'iOS', 'GoRouter', 'NFC'],
    description: [
      'Built and maintained multiple cross-platform mobile applications using Flutter.',
      'Implemented NFC-based features and integrated REST APIs with clean architecture.',
      'Improved app performance and optimized BLoC state management patterns.',
      'Worked closely with design and backend teams for seamless product delivery.',
    ],
  ),
  ExperienceModel(
    role: 'Senior Mobile App Developer',
    company: 'Ocean Softwares',
    location: 'Chennai, Tamil Nadu',
    period: 'Dec 2022 – Nov 2023',
    tech: ['Flutter', 'Dart', 'Android', 'iOS', 'GetX', 'Http', 'Push Notifications'],
    description: [
      'Developed scalable mobile applications for Android and iOS using Flutter.',
      'Integrated third-party APIs, payment gateways, and push notification services.',
      'Worked in an agile environment to deliver features on tight deadlines.',
      'Mentored junior developers and conducted regular code reviews.',
    ],
  ),
  ExperienceModel(
    role: 'Associate Software Engineer',
    company: 'Rigelsoft Technologies Pvt Ltd',
    location: 'Coimbatore, Tamil Nadu',
    period: 'Dec 2021 – Nov 2022',
    tech: ['Flutter', 'Dart', 'Android', 'iOS', 'BLoC', 'Http', 'QR', 'Push Notifications'],
    description: [
      'Developed and maintained Flutter mobile applications for various clients.',
      'Implemented QR code scanning features and push notification services.',
      'Optimized code quality and reduced app crash rates significantly.',
      'Collaborated with cross-functional teams to deliver project milestones on time.',
    ],
  ),
  ExperienceModel(
    role: 'Android Developer',
    company: 'Patronize',
    location: 'Coimbatore, Tamil Nadu',
    period: 'Jul 2020 – Nov 2021',
    note: 'Internal Role Transition from Software Testing',
    tech: ['Flutter', 'Dart', 'Android', 'Http', 'REST APIs'],
    description: [
      'Transitioned from Software Testing to Android/Flutter development.',
      'Built and maintained Android applications using Flutter and REST APIs.',
      'Applied QA knowledge to write cleaner, more testable, production-ready code.',
      'Gained hands-on experience in mobile app architecture and Play Store deployment.',
    ],
  ),
  ExperienceModel(
    role: 'Software Tester',
    company: 'Patronize',
    location: 'Coimbatore, Tamil Nadu',
    period: 'Aug 2017 – Jun 2020',
    tech: ['Manual Testing', 'Android', 'iOS', 'Bug Tracking'],
    description: [
      'Performed manual testing for Android and iOS mobile applications.',
      'Identified, documented, and tracked software defects using bug tracking tools.',
      'Ensured product quality by executing test cases and regression testing.',
      'Collaborated with developers to resolve critical issues before each release.',
    ],
  ),
];
