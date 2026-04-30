"use client";

import { motion } from "framer-motion";

const experiences = [
  {
    role: "Senior Flutter Developer",
    company: "Fortigrid Design Studio Pvt Ltd",
    location: "Coimbatore, Tamil Nadu",
    period: "Mar 2025 - Present",
    description: [
      "Developed 6+ enterprise-grade mobile and web applications using Flutter.",
      "Collaborated with QA teams to ensure high-quality, bug-free releases.",
      "Designed and optimized reusable components for cross-platform development.",
      "Led code reviews and mentored junior developers."
    ]
  },
  {
    role: "Senior Application Developer",
    company: "Fortigrid India Pvt Ltd",
    location: "Coimbatore, Tamil Nadu",
    period: "Dec 2022 - Feb 2025",
    description: [
      "Developed 5+ enterprise-grade mobile and web applications using Flutter.",
      "Collaborated with QA teams to ensure high-quality, bug-free releases.",
      "Designed and optimized reusable components for cross-platform development.",
      "Led code reviews and mentored junior developers."
    ]
  },
  {
    role: "Mobile Application Developer",
    company: "Rigelsoft Technologies Pvt Ltd",
    location: "Coimbatore, Tamil Nadu",
    period: "Dec 2021 - Nov 2022",
    description: [
      "Developed and maintained mobile applications for various industries.",
      "Optimized code and reduced app crash rates by 25%.",
      "Implemented Firebase authentication and push notification services."
    ]
  },
  {
    role: "Mobile Application Developer",
    company: "Pattronize",
    location: "Coimbatore, Tamilnadu",
    period: "Aug 2019 - Jul 2021",
    description: [
      "Created and maintained mobile applications with high performance and usability.",
      "Designed app architectures and optimized performance."
    ]
  }
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
                position: "relative"
              }}
            >
              <div style={{ display: "flex", justifyContent: "space-between", flexWrap: "wrap", alignItems: "flex-start", gap: "1rem", marginBottom: "1rem" }}>
                <div>
                  <h3 style={{ fontSize: "1.5rem", fontWeight: 700, color: "var(--text-main)" }}>{exp.role}</h3>
                  <h4 style={{ fontSize: "1.1rem", color: "var(--accent-purple)", fontWeight: 500, marginTop: "0.2rem" }}>
                    {exp.company}
                  </h4>
                </div>
                <div style={{ textAlign: "right" }}>
                  <span style={{ display: "block", fontSize: "0.95rem", color: "var(--accent-cyan)", fontWeight: 600 }}>{exp.period}</span>
                  <span style={{ display: "block", fontSize: "0.85rem", color: "var(--text-muted)", marginTop: "0.2rem" }}>{exp.location}</span>
                </div>
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
