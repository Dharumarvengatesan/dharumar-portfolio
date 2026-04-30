"use client";

import { motion } from "framer-motion";

const skills = [
  "Flutter", "Dart", "Java", "Kotlin", "Firebase", "REST API", "Provider", 
  "Bloc", "GetX", "SQLite", "Hive", "Git", "CI/CD", "Agile", "Android", "iOS", "Web", "Desktop"
];

export default function Skills() {
  return (
    <section id="skills" style={{ padding: "5rem 0", background: "var(--bg-color-alt)" }}>
      <div className="container">
        <motion.h2 
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.5 }}
          className="section-title"
        >
          My <span className="text-gradient">Skills</span>
        </motion.h2>

        <div style={{ display: "flex", flexWrap: "wrap", justifyContent: "center", gap: "1rem", marginTop: "3rem", maxWidth: "800px", margin: "3rem auto 0 auto" }}>
          {skills.map((skill, index) => (
            <motion.div
              key={skill}
              initial={{ opacity: 0, scale: 0.8 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true }}
              transition={{ duration: 0.4, delay: index * 0.05 }}
              whileHover={{ scale: 1.1, backgroundColor: "rgba(124, 58, 237, 0.1)", borderColor: "var(--accent-cyan)" }}
              style={{
                padding: "0.8rem 1.5rem",
                background: "rgba(255, 255, 255, 0.85)",
                border: "1.5px solid rgba(99, 102, 241, 0.18)",
                borderRadius: "30px",
                fontWeight: 500,
                color: "var(--text-main)",
                cursor: "default",
                backdropFilter: "blur(4px)",
                boxShadow: "0 2px 8px rgba(99, 102, 241, 0.08)"
              }}
            >
              {skill}
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
