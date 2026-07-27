"use client";

import { motion } from "framer-motion";
import { useState } from "react";

// ─────────────────────────────────────────────
//  HOW TO ACTIVATE (one-time, ~1 minute):
//  1. Go to https://formspree.io → click "Get Started for Free"
//  2. Sign in with Google or GitHub (no email verification!)
//  3. Click "+ New Form" → give it any name → copy the form ID shown
//     e.g. if the endpoint is https://formspree.io/f/xpwrjkqz
//     then your FORM_ID is:  xpwrjkqz
//  4. Paste the ID below replacing "YOUR_FORM_ID_HERE"
// ─────────────────────────────────────────────
const FORMSPREE_FORM_ID = "xeeyvlnw";

type FormStatus = "idle" | "loading" | "success" | "error";

export default function Contact() {
  const [formData, setFormData] = useState({ name: "", email: "", message: "" });
  const [status, setStatus] = useState<FormStatus>("idle");

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    setFormData((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setStatus("loading");

    try {
      const response = await fetch(`https://formspree.io/f/${FORMSPREE_FORM_ID}`, {
        method: "POST",
        headers: { "Content-Type": "application/json", Accept: "application/json" },
        body: JSON.stringify({
          name: formData.name,
          email: formData.email,
          message: formData.message,
        }),
      });

      if (response.ok) {
        setStatus("success");
        setFormData({ name: "", email: "", message: "" });
        setTimeout(() => setStatus("idle"), 5000);
      } else {
        setStatus("error");
        setTimeout(() => setStatus("idle"), 5000);
      }
    } catch {
      setStatus("error");
      setTimeout(() => setStatus("idle"), 5000);
    }
  };

  const isLoading = status === "loading";

  return (
    <section id="contact" style={{ padding: "5rem 0", background: "var(--bg-color-alt)" }}>
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
          {/* ── Left: contact info ── */}
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

            <div style={{ display: "flex", flexDirection: "column", gap: "1rem" }}>
              <a
                aria-label="Send an email to Dharumar"
                href="mailto:dharumar13@gmail.com"
                style={{ display: "flex", alignItems: "center", gap: "1rem", color: "var(--text-main)", transition: "color 0.3s ease", cursor: "pointer" }}
                onMouseEnter={(e) => (e.currentTarget.style.color = "var(--accent-cyan)")}
                onMouseLeave={(e) => (e.currentTarget.style.color = "var(--text-main)")}
              >
                ✉️ <span>dharumar13@gmail.com</span>
              </a>
              <a
                aria-label="Call Dharumar"
                href="tel:+918189907917"
                style={{ display: "flex", alignItems: "center", gap: "1rem", color: "var(--text-main)", transition: "color 0.3s ease", cursor: "pointer" }}
                onMouseEnter={(e) => (e.currentTarget.style.color = "var(--accent-cyan)")}
                onMouseLeave={(e) => (e.currentTarget.style.color = "var(--text-main)")}
              >
                📞 <span>+91 8189907917</span>
              </a>
              <a
                aria-label="Visit GitHub Profile"
                href="https://github.com/Dharumarvengatesan"
                target="_blank"
                rel="noopener noreferrer"
                style={{ display: "flex", alignItems: "center", gap: "1rem", color: "var(--text-main)", transition: "color 0.3s ease", cursor: "pointer" }}
                onMouseEnter={(e) => (e.currentTarget.style.color = "var(--accent-cyan)")}
                onMouseLeave={(e) => (e.currentTarget.style.color = "var(--text-main)")}
              >
                🐙 <span>github.com/Dharumarvengatesan</span>
              </a>
              <a
                aria-label="Visit LinkedIn Profile"
                href="https://www.linkedin.com/in/dharumar-v-flutter-developer"
                target="_blank"
                rel="noopener noreferrer"
                style={{ display: "flex", alignItems: "center", gap: "1rem", color: "var(--text-main)", transition: "color 0.3s ease", cursor: "pointer" }}
                onMouseEnter={(e) => (e.currentTarget.style.color = "var(--accent-cyan)")}
                onMouseLeave={(e) => (e.currentTarget.style.color = "var(--text-main)")}
              >
                🔗 <span>LinkedIn Profile</span>
              </a>
              <div
                style={{ display: "flex", alignItems: "center", gap: "1rem", color: "var(--text-main)", transition: "color 0.3s ease" }}
                onMouseEnter={(e) => (e.currentTarget.style.color = "var(--accent-cyan)")}
                onMouseLeave={(e) => (e.currentTarget.style.color = "var(--text-main)")}
              >
                📍 <span>Kallakurichi, Tamil Nadu, India</span>
              </div>
            </div>
          </motion.div>

          {/* ── Right: contact form ── */}
          <motion.div
            initial={{ opacity: 0, x: 30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5 }}
            className="glass"
            style={{ padding: "2rem", borderRadius: "16px" }}
          >
            {/* Success banner */}
            {status === "success" && (
              <motion.div
                initial={{ opacity: 0, y: -10 }}
                animate={{ opacity: 1, y: 0 }}
                style={{
                  marginBottom: "1.5rem",
                  padding: "1rem 1.25rem",
                  borderRadius: "10px",
                  background: "rgba(0, 255, 180, 0.12)",
                  border: "1px solid rgba(0, 255, 180, 0.3)",
                  color: "#00ffb4",
                  fontSize: "0.95rem",
                  display: "flex",
                  alignItems: "center",
                  gap: "0.6rem",
                }}
              >
                ✅ Message sent! I'll get back to you soon.
              </motion.div>
            )}

            {/* Error banner */}
            {status === "error" && (
              <motion.div
                initial={{ opacity: 0, y: -10 }}
                animate={{ opacity: 1, y: 0 }}
                style={{
                  marginBottom: "1.5rem",
                  padding: "1rem 1.25rem",
                  borderRadius: "10px",
                  background: "rgba(255, 80, 80, 0.12)",
                  border: "1px solid rgba(255, 80, 80, 0.3)",
                  color: "#ff6b6b",
                  fontSize: "0.95rem",
                  display: "flex",
                  alignItems: "center",
                  gap: "0.6rem",
                }}
              >
                ❌ Something went wrong. Please try again or email directly.
              </motion.div>
            )}

            <form onSubmit={handleSubmit} style={{ display: "flex", flexDirection: "column" }}>
              <input
                id="contact-name"
                aria-label="Your Name"
                type="text"
                name="name"
                placeholder="Your Name"
                className="form-input"
                required
                value={formData.name}
                onChange={handleChange}
                disabled={isLoading}
              />
              <input
                id="contact-email"
                aria-label="Your Email"
                type="email"
                name="email"
                placeholder="Your Email"
                className="form-input"
                required
                value={formData.email}
                onChange={handleChange}
                disabled={isLoading}
              />
              <textarea
                id="contact-message"
                aria-label="Your Message"
                name="message"
                placeholder="Your Message"
                className="form-input"
                rows={5}
                required
                style={{ resize: "vertical" }}
                value={formData.message}
                onChange={handleChange}
                disabled={isLoading}
              />
              <button
                id="contact-submit"
                type="submit"
                className="btn-primary"
                disabled={isLoading}
                style={{
                  alignSelf: "flex-start",
                  marginTop: "1rem",
                  opacity: isLoading ? 0.7 : 1,
                  cursor: isLoading ? "not-allowed" : "pointer",
                  display: "flex",
                  alignItems: "center",
                  gap: "0.5rem",
                  transition: "opacity 0.3s ease",
                }}
              >
                {isLoading ? (
                  <>
                    <span
                      style={{
                        display: "inline-block",
                        width: "14px",
                        height: "14px",
                        border: "2px solid rgba(255,255,255,0.3)",
                        borderTop: "2px solid #fff",
                        borderRadius: "50%",
                        animation: "spin 0.8s linear infinite",
                      }}
                    />
                    Sending…
                  </>
                ) : (
                  "Send Message"
                )}
              </button>
            </form>
          </motion.div>
        </div>
      </div>

      <footer style={{ textAlign: "center", marginTop: "5rem", color: "var(--text-muted)", fontSize: "0.9rem" }}>
        <p>© {new Date().getFullYear()} Dharumar V. All rights reserved.</p>
      </footer>

      {/* Spinner keyframe */}
      <style>{`
        @keyframes spin {
          to { transform: rotate(360deg); }
        }
      `}</style>
    </section>
  );
}
