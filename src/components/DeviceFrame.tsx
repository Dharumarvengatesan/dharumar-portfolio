import React from "react";

export default function DeviceFrame({ children }: { children: React.ReactNode }) {
  return (
    <div style={{
      width: "280px",
      height: "560px",
      border: "12px solid #1a1a1a",
      borderRadius: "36px",
      position: "relative",
      backgroundColor: "#000",
      boxShadow: "0 25px 50px -12px rgba(0, 0, 0, 0.5), 0 0 0 1px rgba(255,255,255,0.1)",
      overflow: "hidden",
      margin: "0 auto"
    }}>
      {/* Notch */}
      <div style={{
        position: "absolute",
        top: 0,
        left: "50%",
        transform: "translateX(-50%)",
        width: "120px",
        height: "24px",
        backgroundColor: "#1a1a1a",
        borderBottomLeftRadius: "16px",
        borderBottomRightRadius: "16px",
        zIndex: 10
      }}></div>
      
      {/* Content */}
      <div style={{ width: "100%", height: "100%", overflowY: "auto", position: "relative" }}>
        {children}
      </div>
    </div>
  );
}
