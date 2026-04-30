"use client";

import { motion } from "framer-motion";
import Image from "next/image";
import DeviceFrame from "./DeviceFrame";

const projects = [
  {
    title: "PACT - Team Management",
    description: "Enterprise workflow and activity tracking application with push notifications, API integration, task workflows, and performance optimization.",
    tech: ["Flutter", "Dart", "REST API", "Push Notifications"],
    link: "https://play.google.com/store/apps/details?id=com.fortigrid.pact&pcampaignid=web_share",
    colorStart: "#2E3192",
    colorEnd: "#1BFFFF"
  },
  {
    title: "Action Tracker",
    description: "Enterprise workflow and activity tracking application with push notifications, API integration, task workflows, and performance optimization.",
    tech: ["Flutter", "Dart", "REST API", "Push Notifications"],
    link: "https://play.google.com/store/apps/details?id=com.action.tracker",
    colorStart: "#4A00E0",
    colorEnd: "#8E2DE2"
  },
  {
    title: "PACT Vehicle",
    description: "Vehicle management and tracking app with form workflows, API integration, and enterprise mobility features.",
    tech: ["Flutter", "State Management", "API Integration"],
    link: "https://play.google.com/store/apps/details?id=com.fortigrid.pact.vehicle",
    colorStart: "#D4145A",
    colorEnd: "#FBB03B"
  },
  {
    title: "True Art of Yoga",
    description: "Wellness application featuring authentication, subscription flow, content management, and responsive mobile UI.",
    tech: ["Flutter", "Firebase Auth", "UI/UX", "Payments"],
    link: "https://play.google.com/store/apps/details?id=studio.tangerinedesigns.trueartofyoga",
    colorStart: "#009245",
    colorEnd: "#FCEE21"
  },
  {
    title: "OPW Central",
    description: "Enterprise application with dashboards, notifications, backend integrations, and workflow automation.",
    tech: ["Flutter", "Provider", "Dashboards"],
    link: "https://play.google.com/store/apps/details?id=studio.tangerinedesigns.opwcentral",
    colorStart: "#662D8C",
    colorEnd: "#ED1E79"
  },
  {
    title: "PACT Task",
    description: "Task management system with notifications, user roles, and workflow tracking.",
    tech: ["Flutter", "Bloc/GetX", "Workflow"],
    link: "https://play.google.com/store/apps/details?id=com.fortigrid.pact.task",
    colorStart: "#00A8C5",
    colorEnd: "#FFFF7E"
  }
];

export default function Projects() {
  return (
    <section id="projects" style={{ padding: "5rem 0", background: "var(--bg-color)" }}>
      <div className="container">
        <motion.h2 
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.5 }}
          className="section-title"
        >
          Featured <span className="text-gradient">Apps</span>
        </motion.h2>

        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(320px, 1fr))", gap: "4rem", marginTop: "4rem", justifyItems: "center" }}>
          {projects.map((project, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: index * 0.1 }}
              whileHover={{ y: -10 }}
              style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: "1.5rem", maxWidth: "340px" }}
            >
              <DeviceFrame>
                <div style={{ 
                  width: "100%", 
                  height: "100%", 
                  background: `linear-gradient(135deg, ${project.colorStart}, ${project.colorEnd})`,
                  display: "flex",
                  flexDirection: "column",
                  alignItems: "center",
                  justifyContent: "center",
                  padding: "1.5rem",
                  textAlign: "center"
                }}>
                  <h4 style={{ color: "#fff", fontSize: "1.8rem", fontWeight: 800, textShadow: "0 2px 10px rgba(0,0,0,0.3)" }}>
                    {project.title}
                  </h4>
                  <div style={{ marginTop: "2rem", display: "flex", flexWrap: "wrap", justifyContent: "center", gap: "0.5rem" }}>
                    {project.tech.slice(0,2).map(t => (
                      <span key={t} style={{ fontSize: "0.75rem", color: "#fff", background: "rgba(0,0,0,0.4)", padding: "0.2rem 0.6rem", borderRadius: "20px" }}>
                        {t}
                      </span>
                    ))}
                  </div>
                </div>
              </DeviceFrame>
              
              <div className="glass" style={{ padding: "1.5rem", borderRadius: "16px", width: "100%", textAlign: "center" }}>
                <h3 style={{ fontSize: "1.3rem", fontWeight: 700, marginBottom: "0.5rem" }}>{project.title}</h3>
                <p style={{ color: "var(--text-muted)", fontSize: "0.9rem", marginBottom: "1.5rem" }}>{project.description}</p>
                
                <a 
                  href={project.link} 
                  target="_blank" 
                  rel="noopener noreferrer"
                  style={{ display: "inline-block", transition: "transform 0.2s ease" }}
                  onMouseEnter={(e) => e.currentTarget.style.transform = "scale(1.05)"}
                  onMouseLeave={(e) => e.currentTarget.style.transform = "scale(1)"}
                >
                  <Image 
                    alt="Get it on Google Play" 
                    src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" 
                    width={150}
                    height={48}
                    style={{ height: "48px", width: "auto" }}
                  />
                </a>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
