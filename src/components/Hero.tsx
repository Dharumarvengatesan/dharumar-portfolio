"use client";

import { motion } from "framer-motion";
import Image from "next/image";

export default function Hero() {
  return (
    <section style={{ minHeight: "100vh", display: "flex", alignItems: "center", paddingTop: "5rem", position: "relative", overflow: "hidden" }}>

      <div className="container" style={{ display: "flex", flexDirection: "row", alignItems: "center", justifyContent: "space-between", gap: "3rem", width: "100%" }}>

        {/* ── Left: Text Content ── */}
        <motion.div
          style={{ flex: 1, display: "flex", flexDirection: "column", alignItems: "flex-start", gap: "1.2rem", maxWidth: "600px" }}
          initial={{ opacity: 0, x: -40 }}
          animate={{ opacity: 1, x: 0 }}
          transition={{ duration: 0.7, ease: "easeOut" }}
        >
          {/* Greeting badge */}
          <motion.div
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: 0.1 }}
            style={{
              display: "inline-flex",
              alignItems: "center",
              gap: "0.5rem",
              background: "rgba(14, 165, 233, 0.1)",
              border: "1px solid rgba(14, 165, 233, 0.25)",
              borderRadius: "50px",
              padding: "0.4rem 1rem",
              fontSize: "0.95rem",
              color: "var(--accent-cyan)",
              fontWeight: 500,
            }}
          >
            <span style={{ width: 8, height: 8, borderRadius: "50%", background: "var(--accent-cyan)", display: "inline-block", boxShadow: "0 0 6px var(--accent-cyan)" }} />
            Available for opportunities
          </motion.div>

          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: 0.15 }}
            style={{ color: "var(--text-muted)", fontSize: "1.1rem", fontWeight: 500 }}
          >
            Hi, my name is
          </motion.p>

          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: 0.2 }}
            style={{ fontSize: "clamp(2.8rem, 6vw, 4.5rem)", fontWeight: 800, lineHeight: 1.1, margin: 0 }}
          >
            Dharumar V.
          </motion.h1>

          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: 0.3 }}
            style={{ fontSize: "clamp(1.4rem, 3vw, 2.2rem)", fontWeight: 700, lineHeight: 1.2, margin: 0 }}
          >
            <span className="text-gradient">Senior Flutter Developer</span>
          </motion.h2>

          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: 0.4 }}
            style={{ fontSize: "1.05rem", color: "var(--text-muted)", lineHeight: 1.7, maxWidth: "520px" }}
          >
            6.5+ years building scalable cross-platform mobile applications using Flutter, Firebase, REST APIs, and clean architecture.
          </motion.p>

          {/* Stats row */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: 0.45 }}
            style={{ display: "flex", gap: "2rem", marginTop: "0.5rem" }}
          >
            {[
              { value: "6.5+", label: "Years Exp." },
              { value: "6+", label: "Live Apps" },
              { value: "99.9%", label: "Crash-Free" },
            ].map((stat) => (
              <div key={stat.label} style={{ textAlign: "center" }}>
                <div style={{ fontSize: "1.6rem", fontWeight: 800, background: "linear-gradient(90deg, var(--accent-cyan), var(--accent-purple))", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent" }}>
                  {stat.value}
                </div>
                <div style={{ fontSize: "0.8rem", color: "var(--text-muted)", fontWeight: 500 }}>{stat.label}</div>
              </div>
            ))}
          </motion.div>

          {/* CTA Buttons */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: 0.5 }}
            style={{ display: "flex", gap: "1rem", marginTop: "1rem", flexWrap: "wrap" }}
          >
            <a href="#projects" className="btn-primary">View Apps</a>
            <a href="#contact" className="btn-outline">Contact Me</a>
          </motion.div>
        </motion.div>

        {/* ── Right: Profile Photo ── */}
        <motion.div
          initial={{ opacity: 0, x: 40, scale: 0.9 }}
          animate={{ opacity: 1, x: 0, scale: 1 }}
          transition={{ duration: 0.8, ease: "easeOut", delay: 0.2 }}
          style={{ flexShrink: 0, position: "relative" }}
        >
          {/* Glow ring behind photo */}
          <div style={{
            position: "absolute",
            inset: "-8px",
            borderRadius: "50%",
            background: "linear-gradient(135deg, var(--accent-cyan), var(--accent-purple))",
            zIndex: 0,
            filter: "blur(0px)",
          }} />

          {/* White gap ring */}
          <div style={{
            position: "absolute",
            inset: "-3px",
            borderRadius: "50%",
            background: "var(--bg-color)",
            zIndex: 1,
          }} />

          {/* Photo */}
          <motion.div
            animate={{ y: [0, -10, 0] }}
            transition={{ duration: 4, repeat: Infinity, ease: "easeInOut" }}
            style={{ position: "relative", zIndex: 2 }}
          >
            <Image
              src="/profile.png"
              alt="Dharumar V - Senior Flutter Developer"
              width={320}
              height={320}
              priority
              style={{
                borderRadius: "50%",
                objectFit: "cover",
                width: "clamp(220px, 25vw, 320px)",
                height: "clamp(220px, 25vw, 320px)",
                display: "block",
              }}
            />
          </motion.div>

          {/* Flutter badge floating */}
          <motion.div
            animate={{ y: [0, -6, 0], rotate: [0, 3, 0] }}
            transition={{ duration: 3.5, repeat: Infinity, ease: "easeInOut" }}
            style={{
              position: "absolute",
              bottom: "10%",
              left: "-18%",
              background: "white",
              borderRadius: "12px",
              padding: "0.5rem 0.9rem",
              boxShadow: "0 8px 24px rgba(14,165,233,0.2)",
              border: "1px solid rgba(14,165,233,0.2)",
              display: "flex",
              alignItems: "center",
              gap: "0.5rem",
              zIndex: 3,
              whiteSpace: "nowrap",
            }}
          >
            <svg width="18" height="18" viewBox="0 0 48 48" fill="none">
              <polygon points="14,6 34,6 48,20 28,20" fill="#54C5F8" />
              <polygon points="14,42 34,42 48,28 28,28" fill="#01579B" />
              <polygon points="28,20 14,34 28,34 42,20" fill="#29B6F6" />
              <polygon points="14,34 28,34 21,41 7,41" fill="#0D47A1" />
            </svg>
            <span style={{ fontSize: "0.8rem", fontWeight: 700, color: "#1a1a2e" }}>Flutter Expert</span>
          </motion.div>

          {/* Open to work badge */}
          <motion.div
            animate={{ y: [0, -8, 0], rotate: [0, -2, 0] }}
            transition={{ duration: 4, repeat: Infinity, ease: "easeInOut", delay: 1 }}
            style={{
              position: "absolute",
              top: "5%",
              right: "-20%",
              background: "white",
              borderRadius: "12px",
              padding: "0.5rem 0.9rem",
              boxShadow: "0 8px 24px rgba(124,58,237,0.2)",
              border: "1px solid rgba(124,58,237,0.2)",
              display: "flex",
              alignItems: "center",
              gap: "0.5rem",
              zIndex: 3,
              whiteSpace: "nowrap",
            }}
          >
            <span style={{ fontSize: "0.85rem" }}>🚀</span>
            <span style={{ fontSize: "0.8rem", fontWeight: 700, color: "#7c3aed" }}>Open to Work</span>
          </motion.div>
        </motion.div>

      </div>
    </section>
  );
}
