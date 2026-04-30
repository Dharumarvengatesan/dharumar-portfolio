"use client";

import { motion } from "framer-motion";

// ── SVG Icon Definitions ──────────────────────────────────────────────────────

const FlutterIcon = ({ size = 48 }: { size?: number }) => (
  <svg width={size} height={size} viewBox="0 0 48 48" fill="none">
    <polygon points="14,6 34,6 48,20 28,20" fill="#54C5F8" opacity="0.9" />
    <polygon points="14,42 34,42 48,28 28,28" fill="#01579B" opacity="0.9" />
    <polygon points="28,20 14,34 28,34 42,20" fill="#29B6F6" opacity="0.9" />
    <polygon points="14,34 28,34 21,41 7,41" fill="#0D47A1" opacity="0.9" />
  </svg>
);

const AndroidIcon = ({ size = 48 }: { size?: number }) => (
  <svg width={size} height={size} viewBox="0 0 48 48" fill="none">
    <circle cx="15" cy="14" r="2" fill="#78C257" />
    <circle cx="33" cy="14" r="2" fill="#78C257" />
    <path
      d="M8 20 C8 14 40 14 40 20 L40 34 C40 36.2 38.2 38 36 38 L34 38 L34 43 C34 44.6 32.6 46 31 46 C29.4 46 28 44.6 28 43 L28 38 L20 38 L20 43 C20 44.6 18.6 46 17 46 C15.4 46 14 44.6 14 43 L14 38 L12 38 C9.8 38 8 36.2 8 34 Z"
      fill="#78C257"
    />
    <path d="M8 20 L40 20 L40 30 L8 30 Z" fill="#5AA83C" />
    <line x1="10" y1="13" x2="4" y2="7" stroke="#78C257" strokeWidth="2.5" strokeLinecap="round" />
    <line x1="38" y1="13" x2="44" y2="7" stroke="#78C257" strokeWidth="2.5" strokeLinecap="round" />
  </svg>
);

const AppleIcon = ({ size = 48 }: { size?: number }) => (
  <svg width={size} height={size} viewBox="0 0 48 48" fill="none">
    <path
      d="M32 4 C32 8 29 11 25 11.5 C25 7.5 28 4 32 4Z"
      fill="#555"
    />
    <path
      d="M38 17 C35.5 14.5 32 13 29 13 C26.5 13 24.5 14 22.5 14 C20.5 14 18.2 13 15.5 13 C10.5 13 6 17.5 6 24.5 C6 35 12 44 17 44 C19 44 20.5 42.5 23 42.5 C25.5 42.5 26.8 44 29 44 C34.5 44 40 36 42 29.5 C39.5 28.5 36 25.5 36 21.5 C36 19 37 17.8 38 17Z"
      fill="#666"
    />
  </svg>
);

const MobileIcon = ({ size = 48 }: { size?: number }) => (
  <svg width={size} height={size} viewBox="0 0 48 48" fill="none">
    <rect x="12" y="3" width="24" height="42" rx="4" ry="4" fill="none" stroke="currentColor" strokeWidth="2.5" />
    <line x1="12" y1="10" x2="36" y2="10" stroke="currentColor" strokeWidth="2" />
    <line x1="12" y1="38" x2="36" y2="38" stroke="currentColor" strokeWidth="2" />
    <circle cx="24" cy="43" r="1.5" fill="currentColor" />
    <rect x="20" y="5.5" width="8" height="2" rx="1" fill="currentColor" opacity="0.6" />
  </svg>
);

const WebIcon = ({ size = 48 }: { size?: number }) => (
  <svg width={size} height={size} viewBox="0 0 48 48" fill="none">
    <circle cx="24" cy="24" r="20" fill="none" stroke="currentColor" strokeWidth="2.5" />
    <ellipse cx="24" cy="24" rx="9" ry="20" fill="none" stroke="currentColor" strokeWidth="2" />
    <line x1="4" y1="24" x2="44" y2="24" stroke="currentColor" strokeWidth="2" />
    <path d="M8 15 Q24 19 40 15" fill="none" stroke="currentColor" strokeWidth="2" />
    <path d="M8 33 Q24 29 40 33" fill="none" stroke="currentColor" strokeWidth="2" />
  </svg>
);

// ── Icon Pool ─────────────────────────────────────────────────────────────────

interface FloatingIcon {
  id: number;
  Icon: React.FC<{ size?: number }>;
  size: number;
  x: string;   // left %
  y: string;   // top %
  duration: number;
  delay: number;
  floatY: number;
  rotate: number;
  opacity: number;
  color: string;
}

const ICONS: FloatingIcon[] = [
  // Flutter icons (blue family)
  { id: 1,  Icon: FlutterIcon, size: 56, x: "5%",  y: "8%",  duration: 7,  delay: 0,   floatY: 20, rotate: 15,  opacity: 0.18, color: "#54C5F8" },
  { id: 2,  Icon: FlutterIcon, size: 40, x: "88%", y: "18%", duration: 9,  delay: 1,   floatY: 25, rotate: -10, opacity: 0.14, color: "#54C5F8" },
  { id: 3,  Icon: FlutterIcon, size: 64, x: "45%", y: "55%", duration: 11, delay: 2,   floatY: 18, rotate: 20,  opacity: 0.10, color: "#29B6F6" },
  { id: 4,  Icon: FlutterIcon, size: 36, x: "72%", y: "82%", duration: 8,  delay: 3.5, floatY: 22, rotate: -15, opacity: 0.16, color: "#54C5F8" },

  // Android icons (green)
  { id: 5,  Icon: AndroidIcon, size: 52, x: "20%", y: "25%", duration: 10, delay: 0.5, floatY: 28, rotate: 8,   opacity: 0.15, color: "#78C257" },
  { id: 6,  Icon: AndroidIcon, size: 44, x: "80%", y: "60%", duration: 8,  delay: 2.5, floatY: 20, rotate: -12, opacity: 0.13, color: "#78C257" },
  { id: 7,  Icon: AndroidIcon, size: 38, x: "60%", y: "12%", duration: 12, delay: 1.5, floatY: 15, rotate: 5,   opacity: 0.12, color: "#5AA83C" },

  // Apple/iOS icons (grey)
  { id: 8,  Icon: AppleIcon,  size: 50, x: "35%", y: "75%", duration: 9,  delay: 1,   floatY: 24, rotate: -8,  opacity: 0.14, color: "#888888" },
  { id: 9,  Icon: AppleIcon,  size: 42, x: "92%", y: "40%", duration: 11, delay: 3,   floatY: 18, rotate: 10,  opacity: 0.12, color: "#999999" },
  { id: 10, Icon: AppleIcon,  size: 36, x: "15%", y: "65%", duration: 7,  delay: 4,   floatY: 22, rotate: -5,  opacity: 0.13, color: "#777777" },

  // Mobile icons (indigo)
  { id: 11, Icon: MobileIcon, size: 48, x: "55%", y: "35%", duration: 10, delay: 2,   floatY: 26, rotate: 6,   opacity: 0.13, color: "#7c3aed" },
  { id: 12, Icon: MobileIcon, size: 36, x: "3%",  y: "45%", duration: 8,  delay: 0.8, floatY: 20, rotate: -10, opacity: 0.15, color: "#0ea5e9" },
  { id: 13, Icon: MobileIcon, size: 54, x: "75%", y: "5%",  duration: 12, delay: 1.8, floatY: 30, rotate: 12,  opacity: 0.11, color: "#7c3aed" },

  // Web icons (cyan)
  { id: 14, Icon: WebIcon,    size: 52, x: "28%", y: "90%", duration: 11, delay: 0.3, floatY: 22, rotate: -15, opacity: 0.13, color: "#0ea5e9" },
  { id: 15, Icon: WebIcon,    size: 44, x: "65%", y: "68%", duration: 9,  delay: 2.2, floatY: 18, rotate: 8,   opacity: 0.14, color: "#7c3aed" },
  { id: 16, Icon: WebIcon,    size: 38, x: "42%", y: "20%", duration: 7,  delay: 3.8, floatY: 25, rotate: -6,  opacity: 0.12, color: "#0ea5e9" },
];

// ── Component ─────────────────────────────────────────────────────────────────

export default function BackgroundAnimation() {
  return (
    <div
      style={{
        position: "fixed",
        inset: 0,
        zIndex: 0,
        pointerEvents: "none",
        overflow: "hidden",
      }}
      aria-hidden="true"
    >
      {ICONS.map((item) => (
        <motion.div
          key={item.id}
          style={{
            position: "absolute",
            left: item.x,
            top: item.y,
            color: item.color,
            opacity: item.opacity,
            filter: "blur(0.4px)",
          }}
          animate={{
            y: [0, -item.floatY, 0, item.floatY * 0.5, 0],
            rotate: [0, item.rotate, 0, -item.rotate * 0.6, 0],
            scale: [1, 1.06, 1, 0.96, 1],
          }}
          transition={{
            duration: item.duration,
            delay: item.delay,
            repeat: Infinity,
            ease: "easeInOut",
          }}
        >
          <item.Icon size={item.size} />
        </motion.div>
      ))}
    </div>
  );
}
