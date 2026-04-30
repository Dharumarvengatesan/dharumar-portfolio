"use client";

import { useState, useEffect } from "react";
import { motion } from "framer-motion";

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 50);
    };
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  const navLinks = [
    { name: "About", href: "#about" },
    { name: "Skills", href: "#skills" },
    { name: "Projects", href: "#projects" },
    { name: "Contact", href: "#contact" },
  ];

  return (
    <motion.nav
      initial={{ y: -100 }}
      animate={{ y: 0 }}
      transition={{ duration: 0.5 }}
      style={{
        position: "fixed",
        top: 0,
        left: 0,
        right: 0,
        zIndex: 100,
        padding: "1.5rem 0",
        transition: "all 0.3s ease",
        background: scrolled ? "rgba(5, 5, 5, 0.8)" : "transparent",
        backdropFilter: scrolled ? "blur(12px)" : "none",
        borderBottom: scrolled ? "1px solid rgba(255, 255, 255, 0.05)" : "none",
      }}
    >
      <div className="container" style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
        <a href="#" style={{ fontSize: "1.5rem", fontWeight: 700 }}>
          Dharumar<span className="text-gradient">.dev</span>
        </a>
        <ul style={{ display: "flex", gap: "2rem" }}>
          {navLinks.map((link) => (
            <li key={link.name}>
              <a 
                href={link.href} 
                style={{ 
                  fontWeight: 500, 
                  color: "var(--text-muted)", 
                  transition: "color 0.3s ease" 
                }}
                onMouseEnter={(e) => e.currentTarget.style.color = "var(--accent-cyan)"}
                onMouseLeave={(e) => e.currentTarget.style.color = "var(--text-muted)"}
              >
                {link.name}
              </a>
            </li>
          ))}
        </ul>
      </div>
    </motion.nav>
  );
}
