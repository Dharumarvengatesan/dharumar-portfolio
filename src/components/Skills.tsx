"use client";

import { motion } from "framer-motion";

const skills = [
  "Flutter", "Dart", "Firebase", "REST API", "Provider", 
  "Bloc", "GetX", "SQLite", "Hive", "Git", "CI/CD", "Android", "iOS"
];

export default function Skills() {
  return (
    <section id="skills" style={{ padding: "5rem 0", background: "rgba(10, 10, 10, 0.5)" }}>
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
              whileHover={{ scale: 1.1, backgroundColor: "rgba(138, 43, 226, 0.2)", borderColor: "var(--accent-cyan)" }}
              style={{
                padding: "0.8rem 1.5rem",
                background: "rgba(25, 25, 35, 0.6)",
                border: "1px solid rgba(255, 255, 255, 0.1)",
                borderRadius: "30px",
                fontWeight: 500,
                color: "var(--text-main)",
                cursor: "default",
                backdropFilter: "blur(4px)"
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
