"use client";

import { motion } from "framer-motion";

export default function About() {
  return (
    <section id="about" style={{ padding: "5rem 0" }}>
      <div className="container">
        <motion.h2 
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.5 }}
          className="section-title"
        >
          About <span className="text-gradient">Me</span>
        </motion.h2>

        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(300px, 1fr))", gap: "2rem", marginTop: "3rem" }}>
          <motion.div 
            className="glass"
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5, delay: 0.1 }}
            style={{ padding: "2rem", borderRadius: "16px" }}
          >
            <h3 style={{ fontSize: "1.5rem", marginBottom: "1rem", color: "var(--accent-cyan)" }}>Experience</h3>
            <p style={{ fontSize: "1.1rem", marginBottom: "0.5rem" }}>
              <strong>Role:</strong> Senior Flutter Developer
            </p>
            <p style={{ fontSize: "1.1rem" }}>
              <strong>Experience:</strong> 6.5+ Years
            </p>
            <p style={{ marginTop: "1rem", color: "var(--text-muted)" }}>
              6.5+ years of professional experience in Flutter development. Strong expertise in building native-feeling Android and iOS applications with a single codebase.
            </p>
          </motion.div>

          <motion.div 
            className="glass"
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5, delay: 0.2 }}
            style={{ padding: "2rem", borderRadius: "16px" }}
          >
            <h3 style={{ fontSize: "1.5rem", marginBottom: "1rem", color: "var(--accent-purple)" }}>Expertise</h3>
            <ul style={{ color: "var(--text-muted)", display: "flex", flexDirection: "column", gap: "0.8rem" }}>
              <li>✓ Advanced Android/iOS app development</li>
              <li>✓ Firebase & Push Notifications</li>
              <li>✓ Complex REST API integration</li>
              <li>✓ Robust state management (Provider, Bloc, GetX)</li>
              <li>✓ Efficient offline storage (SQLite, Hive)</li>
              <li>✓ App Store & Play Console Deployment</li>
            </ul>
          </motion.div>

          <motion.div 
            className="glass"
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5, delay: 0.3 }}
            style={{ padding: "2rem", borderRadius: "16px" }}
          >
            <h3 style={{ fontSize: "1.5rem", marginBottom: "1rem", color: "var(--accent-cyan)" }}>Impact</h3>
            <ul style={{ color: "var(--text-muted)", display: "flex", flexDirection: "column", gap: "0.8rem" }}>
              <li>🚀 5+ Apps live on Google Play</li>
              <li>⚡ 99.9% Crash-Free User Sessions</li>
              <li>🏗️ Scalable Clean Architecture Implementation</li>
              <li>🔄 Automated CI/CD Pipelines with Codemagic</li>
              <li>📈 Enterprise Workflow Automation</li>
            </ul>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
