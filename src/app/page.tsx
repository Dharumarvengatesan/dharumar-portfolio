import Navbar from "@/components/Navbar";
import Hero from "@/components/Hero";
import About from "@/components/About";
import Skills from "@/components/Skills";
import Experience from "@/components/Experience";
import Projects from "@/components/Projects";
import Contact from "@/components/Contact";

export default function Home() {
  return (
    <main style={{ minHeight: "100vh", position: "relative" }}>
      {/* Background decorations */}
      <div style={{
        position: "fixed",
        top: "-10%",
        left: "-10%",
        width: "50%",
        height: "50%",
        background: "radial-gradient(circle, rgba(0, 240, 255, 0.05) 0%, rgba(0, 0, 0, 0) 70%)",
        zIndex: -1,
        pointerEvents: "none"
      }}></div>
      <div style={{
        position: "fixed",
        bottom: "-10%",
        right: "-10%",
        width: "50%",
        height: "50%",
        background: "radial-gradient(circle, rgba(138, 43, 226, 0.05) 0%, rgba(0, 0, 0, 0) 70%)",
        zIndex: -1,
        pointerEvents: "none"
      }}></div>

      <Navbar />
      <Hero />
      <About />
      <Skills />
      <Experience />
      <Projects />
      <Contact />
    </main>
  );
}
