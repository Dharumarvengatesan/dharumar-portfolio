import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Dharumar V - Senior Flutter Developer",
  description: "Senior Flutter Developer with 6.5+ years experience building scalable cross-platform mobile applications using Flutter, Firebase, REST APIs, and clean architecture.",
  keywords: ["Flutter Developer", "Senior Developer", "Mobile App Developer", "Cross-platform", "Dart", "Firebase", "Dharumar V"],
  openGraph: {
    title: "Dharumar V - Senior Flutter Developer",
    description: "Senior Flutter Developer with 6.5+ years experience building scalable cross-platform mobile applications.",
    url: "https://dharumar-portfolio.vercel.app", // Replace with actual domain if different
    siteName: "Dharumar V Portfolio",
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "Dharumar V - Senior Flutter Developer",
    description: "Senior Flutter Developer with 6.5+ years experience building scalable cross-platform mobile applications.",
  }
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={inter.className}>{children}</body>
    </html>
  );
}
