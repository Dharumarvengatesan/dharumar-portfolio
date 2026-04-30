"use client";

import { motion } from "framer-motion";


export default function Contact() {
  return (
    <section id="contact" style={{ padding: "5rem 0", background: "rgba(10, 10, 10, 0.5)" }}>
      <div className="container">
        <motion.h2 
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.5 }}
          className="section-title"
        >
          Get In <span className="text-gradient">Touch</span>
        </motion.h2>

        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(300px, 1fr))", gap: "3rem", marginTop: "3rem" }}>
          <motion.div
            initial={{ opacity: 0, x: -30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5 }}
          >
            <h3 style={{ fontSize: "1.5rem", marginBottom: "1rem" }}>Let's connect!</h3>
            <p style={{ color: "var(--text-muted)", marginBottom: "2rem" }}>
              Whether you have a question, want to collaborate on a mobile project, or simply want to say hello, feel free to drop a message.
            </p>

              <a href="mailto:dharumar13@gmail.com" style={{ display: "flex", alignItems: "center", gap: "1rem", color: "var(--text-main)", transition: "color 0.3s ease", cursor: "pointer" }} onMouseEnter={(e) => e.currentTarget.style.color = "var(--accent-cyan)"} onMouseLeave={(e) => e.currentTarget.style.color = "var(--text-main)"}>
                ✉️ <span>dharumar13@gmail.com</span>
              </a>
              <a href="tel:+918189907917" style={{ display: "flex", alignItems: "center", gap: "1rem", color: "var(--text-main)", transition: "color 0.3s ease", cursor: "pointer" }} onMouseEnter={(e) => e.currentTarget.style.color = "var(--accent-cyan)"} onMouseLeave={(e) => e.currentTarget.style.color = "var(--text-main)"}>
                📞 <span>+91 8189907917</span>
              </a>
              <a href="https://github.com/Dharumarvengatesan" target="_blank" rel="noopener noreferrer" style={{ display: "flex", alignItems: "center", gap: "1rem", color: "var(--text-main)", transition: "color 0.3s ease", cursor: "pointer" }} onMouseEnter={(e) => e.currentTarget.style.color = "var(--accent-cyan)"} onMouseLeave={(e) => e.currentTarget.style.color = "var(--text-main)"}>
                🐙 <span>github.com/Dharumarvengatesan</span>
              </a>
              <a href="https://www.linkedin.com/in/dharumar-v-flutter-developer" target="_blank" rel="noopener noreferrer" style={{ display: "flex", alignItems: "center", gap: "1rem", color: "var(--text-main)", transition: "color 0.3s ease", cursor: "pointer" }} onMouseEnter={(e) => e.currentTarget.style.color = "var(--accent-cyan)"} onMouseLeave={(e) => e.currentTarget.style.color = "var(--text-main)"}>
                🔗 <span>LinkedIn Profile</span>
              </a>
              <div style={{ display: "flex", alignItems: "center", gap: "1rem", color: "var(--text-main)", transition: "color 0.3s ease" }} onMouseEnter={(e) => e.currentTarget.style.color = "var(--accent-cyan)"} onMouseLeave={(e) => e.currentTarget.style.color = "var(--text-main)"}>
                📍 <span>Kallakurichi, Tamil Nadu, India</span>
              </div>
            </div>
          </motion.div>

          <motion.div
            initial={{ opacity: 0, x: 30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5 }}
            className="glass"
            style={{ padding: "2rem", borderRadius: "16px" }}
          >
            <form onSubmit={(e) => e.preventDefault()} style={{ display: "flex", flexDirection: "column" }}>
              <input type="text" placeholder="Your Name" className="form-input" required />
              <input type="email" placeholder="Your Email" className="form-input" required />
              <textarea placeholder="Your Message" className="form-input" rows={5} required style={{ resize: "vertical" }}></textarea>
              <button type="submit" className="btn-primary" style={{ alignSelf: "flex-start", marginTop: "1rem" }}>
                Send Message
              </button>
            </form>
          </motion.div>
        </div>
      </div>
      
      <footer style={{ textAlign: "center", marginTop: "5rem", color: "var(--text-muted)", fontSize: "0.9rem" }}>
        <p>© {new Date().getFullYear()} Dharumar V. All rights reserved.</p>
      </footer>
    </section>
  );
}
