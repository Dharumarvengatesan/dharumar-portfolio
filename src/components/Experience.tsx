"use client";

import { motion } from "framer-motion";

const experiences = [
  {
    role: "Senior Android Developer",
    company: "Fortigrid Design Studio Pvt Ltd",
    location: "Coimbatore, Tamil Nadu",
    period: "Mar 2025 – Jul 2026",
    tech: ["Flutter", "Dart", "BLoC", "REST API", "Firebase", "Dio", "GoRouter", "Push Notifications", "Android", "iOS"],
    description: [
      "Developed enterprise-grade mobile and web applications using Flutter.",
      "Collaborated with QA teams to ensure high-quality, bug-free releases.",
      "Designed and optimized reusable components for cross-platform development.",
      "Led code reviews and mentored junior developers.",
    ],
  },
  {
    role: "Senior Application Developer",
    company: "Fortigrid India Pvt Ltd",
    location: "Coimbatore, Tamil Nadu",
    period: "Aug 2023 – Feb 2025",
    tech: ["Flutter", "Dart", "BLoC", "REST APIs", "Firebase", "Dio", "Android", "iOS", "GoRouter", "NFC"],
    description: [
      "Built and maintained multiple cross-platform mobile applications using Flutter.",
      "Implemented NFC-based features and integrated REST APIs with clean architecture.",
      "Improved app performance and optimized BLoC state management patterns.",
      "Worked closely with design and backend teams for seamless product delivery.",
    ],
  },
  {
    role: "Senior Mobile App Developer",
    company: "Ocean Softwares",
    location: "Chennai, Tamil Nadu",
    period: "Dec 2022 – Nov 2023",
    tech: ["Flutter", "Dart", "Android", "iOS", "GetX", "Http", "Push Notifications"],
    description: [
      "Developed scalable mobile applications for Android and iOS using Flutter.",
      "Integrated third-party APIs, payment gateways, and push notification services.",
      "Worked in an agile environment to deliver features on tight deadlines.",
      "Mentored junior developers and conducted regular code reviews.",
    ],
  },
  {
    role: "Associate Software Engineer",
    company: "Rigelsoft Technologies Pvt Ltd",
    location: "Coimbatore, Tamil Nadu",
    period: "Dec 2021 – Nov 2022",
    tech: ["Flutter", "Dart", "Android", "iOS", "BLoC", "Http", "QR", "Push Notifications"],
    description: [
      "Developed and maintained Flutter mobile applications for various clients.",
      "Implemented QR code scanning features and push notification services.",
      "Optimized code quality and reduced app crash rates significantly.",
      "Collaborated with cross-functional teams to deliver project milestones on time.",
    ],
  },
  {
    role: "Android Developer",
    company: "Patronize",
    location: "Coimbatore, Tamil Nadu",
    period: "Jul 2020 – Nov 2021",
    note: "Internal Role Transition from Software Testing",
    tech: ["Flutter", "Dart", "Android", "Http", "REST APIs"],
    description: [
      "Transitioned from Software Testing to Android/Flutter development.",
      "Built and maintained Android applications using Flutter and REST APIs.",
      "Applied QA knowledge to write cleaner, more testable, production-ready code.",
      "Gained hands-on experience in mobile app architecture and Play Store deployment.",
    ],
  },
  {
    role: "Software Tester",
    company: "Patronize",
    location: "Coimbatore, Tamil Nadu",
    period: "Aug 2017 – Jun 2020",
    tech: ["Manual Testing", "Android", "iOS", "Bug Tracking"],
    description: [
      "Performed manual testing for Android and iOS mobile applications.",
      "Identified, documented, and tracked software defects using bug tracking tools.",
      "Ensured product quality by executing test cases and regression testing.",
      "Collaborated with developers to resolve critical issues before each release.",
    ],
  },
];

export default function Experience() {
  return (
    <section id="experience" style={{ padding: "5rem 0" }}>
      <div className="container">
        <motion.h2
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.5 }}
          className="section-title"
        >
          Professional <span className="text-gradient">Experience</span>
        </motion.h2>

        <div style={{ marginTop: "4rem", display: "flex", flexDirection: "column", gap: "2rem", maxWidth: "800px", margin: "4rem auto 0 auto" }}>
          {experiences.map((exp, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, x: -20 }}
              whileInView={{ opacity: 1, x: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: index * 0.1 }}
              className="glass"
              style={{
                padding: "2rem",
                borderRadius: "16px",
                borderLeft: "4px solid var(--accent-cyan)",
                position: "relative",
              }}
            >
              <div style={{ display: "flex", justifyContent: "space-between", flexWrap: "wrap", alignItems: "flex-start", gap: "1rem", marginBottom: "0.75rem" }}>
                <div>
                  <h3 style={{ fontSize: "1.35rem", fontWeight: 700, color: "var(--text-main)" }}>{exp.role}</h3>
                  <h4 style={{ fontSize: "1.05rem", color: "var(--accent-purple)", fontWeight: 500, marginTop: "0.2rem" }}>
                    {exp.company}
                  </h4>
                  {"note" in exp && exp.note && (
                    <p style={{ fontSize: "0.8rem", color: "var(--accent-cyan)", marginTop: "0.2rem", fontStyle: "italic" }}>
                      {exp.note}
                    </p>
                  )}
                </div>
                <div style={{ textAlign: "right" }}>
                  <span style={{ display: "block", fontSize: "0.95rem", color: "var(--accent-cyan)", fontWeight: 600 }}>{exp.period}</span>
                  <span style={{ display: "block", fontSize: "0.85rem", color: "var(--text-muted)", marginTop: "0.2rem" }}>{exp.location}</span>
                </div>
              </div>

              {/* Tech Stack Tags */}
              <div style={{ display: "flex", flexWrap: "wrap", gap: "0.4rem", marginBottom: "1rem" }}>
                {exp.tech.map((t, i) => (
                  <span
                    key={i}
                    style={{
                      fontSize: "0.72rem",
                      padding: "0.2rem 0.6rem",
                      borderRadius: "20px",
                      background: "rgba(0, 212, 255, 0.1)",
                      color: "var(--accent-cyan)",
                      border: "1px solid rgba(0, 212, 255, 0.25)",
                      fontWeight: 500,
                    }}
                  >
                    {t}
                  </span>
                ))}
              </div>

              <ul style={{ color: "var(--text-muted)", marginLeft: "1.2rem", display: "flex", flexDirection: "column", gap: "0.5rem" }}>
                {exp.description.map((item, i) => (
                  <li key={i} style={{ listStyleType: "disc" }}>{item}</li>
                ))}
              </ul>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
