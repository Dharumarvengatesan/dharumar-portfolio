"use client";

import { motion } from "framer-motion";

export default function Hero() {
  return (
    <section style={{ minHeight: "100vh", display: "flex", alignItems: "center", paddingTop: "5rem", position: "relative", overflow: "hidden" }}>
      
      {/* Flutter Aesthetics Background Elements */}
      <motion.div 
        initial={{ opacity: 0, scale: 0.8 }}
        animate={{ opacity: 0.05, scale: 1 }}
        transition={{ duration: 2, repeat: Infinity, repeatType: "reverse" }}
        style={{ position: "absolute", right: "-10%", top: "20%", zIndex: -1 }}
      >
        <svg xmlns="http://www.w3.org/2000/svg" width="600" height="600" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1" strokeLinecap="round" strokeLinejoin="round">
          <path d="M2.5 12h19M12 2.5v19M4.93 4.93l14.14 14.14M4.93 19.07L19.07 4.93" />
          <circle cx="12" cy="12" r="10" />
        </svg>
      </motion.div>

      <motion.div
        initial={{ opacity: 0, y: 50 }}
        animate={{ opacity: 0.1, y: 0 }}
        transition={{ duration: 1, delay: 0.5 }}
        style={{ position: "absolute", left: "5%", bottom: "20%", zIndex: -1, fontFamily: "monospace", fontSize: "1.5rem", color: "var(--accent-cyan)" }}
      >
        <pre>{`Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Text('Dharumar V.'),
    ),
  );
}`}</pre>
      </motion.div>

      <div className="container" style={{ display: "flex", flexDirection: "column", alignItems: "flex-start", gap: "1.5rem", maxWidth: "800px" }}>
        <motion.p 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.1 }}
          style={{ color: "var(--accent-cyan)", fontSize: "1.2rem", fontWeight: 500 }}
        >
          Hi, my name is
        </motion.p>
        
        <motion.h1 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.2 }}
          style={{ fontSize: "clamp(3rem, 8vw, 5rem)", fontWeight: 800, lineHeight: 1.1 }}
        >
          Dharumar V.
        </motion.h1>
        
        <motion.h2 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.3 }}
          style={{ fontSize: "clamp(2rem, 5vw, 3.5rem)", fontWeight: 700, color: "var(--text-muted)", lineHeight: 1.2 }}
        >
          Senior Flutter Developer.
        </motion.h2>
        
        <motion.p 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.4 }}
          style={{ fontSize: "1.2rem", color: "var(--text-muted)", marginTop: "1rem", maxWidth: "600px" }}
        >
          6.5+ years building scalable cross-platform mobile applications using Flutter, Firebase, REST APIs, and clean architecture.
        </motion.p>
        
        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.5 }}
          style={{ display: "flex", gap: "1rem", marginTop: "2rem" }}
        >
          <a href="#projects" className="btn-primary">View Apps</a>
          <a href="#contact" className="btn-outline">Contact Me</a>
        </motion.div>
      </div>
    </section>
  );
}
