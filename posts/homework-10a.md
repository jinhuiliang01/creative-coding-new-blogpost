---
title: Homework 10a
published_at: 2025-05-16
snippet: Discuss some questions to my AT 3.
disable_html_sanitization: true
allow_math: true
---

# Brainstorm a way I might incorporate WebRTC API or WebSockets API into my idea for AT3.

WebRTC is ideal for direct peer-to-peer communication, minimizing latency for live collaboration. WebSockets are better for broadcasting events, managing rooms, and persistence.

So I might incorporate both WebRTC API and Websockets API into my AT 3. WebSockets is for Signaling and Metadata. And it would handle room creation, user authentication, and version history. And use the server to negotiate WebRTC connections. Then WebRTC for Real-Time Music Data. Once peers are connected via WebSockets, switch to peer-to-peer WebRTC for low-latency note/audio sharing.

Example:

1. User A creates a room: WebSocket sends a room_created event to the server.
2. User B joins: WebSocket notifies User A, then WebRTC sets up a direct connection between A and B.
3. User A plays a note: Note data is sent via WebRTC to User B’s client.
4. User B adds a drum loop: WebSocket saves the updated track to the server, creating a new version.
5. User C forks the track: WebSocket creates a copy, and a new WebRTC group is formed for collaborators.

Here are the example code generated from Chatgpt:

Handles room creation, joining, and track updates:

```// server.js
const express = require("express");
const http = require("http");
const { Server } = require("socket.io");

const app = express();
const server = http.createServer(app);
const io = new Server(server);

const rooms = {}; // Stores active rooms

io.on("connection", (socket) => {
  // User A creates a room
  socket.on("create-room", (roomId) => {
    rooms[roomId] = { users: [socket.id], track: [] };
    socket.join(roomId);
    socket.emit("room-created", roomId);
  });

  // User B joins a room
  socket.on("join-room", (roomId) => {
    if (rooms[roomId]) {
      rooms[roomId].users.push(socket.id);
      socket.join(roomId);
      // Notify User A that B joined
      io.to(roomId).emit("user-joined", socket.id);
    }
  });

  // User B saves a new track version (e.g., drum loop)
  socket.on("update-track", (roomId, trackData) => {
    rooms[roomId].track = trackData;
    // Broadcast to all in the room
    io.to(roomId).emit("track-updated", trackData);
  });

  // User C forks a track
  socket.on("fork-track", (roomId, newRoomId) => {
    const originalTrack = rooms[roomId].track;
    rooms[newRoomId] = { users: [socket.id], track: [...originalTrack] };
    socket.emit("track-forked", newRoomId);
  });
});

server.listen(3000, () => {
  console.log("Socket.io server running on port 3000");
});
```

# What technical aspects would I need to learn about if I am to implement this?

1. Frontend Development: Web Audio API: Learn how to generate sounds programmatically (e.g., synthesizing notes from keyboard input).
2. Real-time Communication:
   For Web Sockets API I need to learn to set up a WebSocket server/client for: Room creation/joining, Broadcasting events, Syncing metadata (e.g., track titles, version history). As for WebRTC API I need to learn Peer-to-Peer Setup: Learn signaling to establish direct connections between users. And transmit low-latency note data
3. Backend Development: WebSocket connections (Socket.io), Database interactions.

Deepseek gave me the key libraries/tools to explore:
As for the frontend development, I might need to use Tone.js, Howler.js (audio), React/Vue (UI components), SimplePeer (WebRTC wrapper).
As for the backend development, I need to use Socket.io, Express.js, Redis (for real-time room state), PostgreSQL/MongoDB/Firebase (database).
As for the WebRTC, I need to use PeerJS (simplifies P2P setup) and Mediasoup (for SFU scaling).

# What else would I need to learn / do that would make this feasible?

Audio Engineering:

Learn how to generate sounds using the Web Audio API (e.g., oscillators, filters, envelopes).

Use libraries like Tone.js for pre-built instruments (piano, synths) and effects (reverb, delay).

Convert keyboard input (e.g., keydown events) to MIDI-like note values (e.g., C4, D#5).

WebRTC & WebSocket Architecture:

Build a server to exchange WebRTC handshake data (SDP offers, ICE candidates) between peers.

Use Socket.io or PeerJS Server for signaling.

# What would my project gain from such an incorporation?

1. Decentralized, Organic Collaboration (Like Mycelium Networks)

WebRTC: Enables peer-to-peer (P2P) connections, mirroring the mycelium’s decentralized structure. Users directly share notes/audio without relying on a central server, fostering spontaneous, rhizomatic creativity.

Example: When User A plays a note, it flows through the P2P network to User B, just as nutrients flow through mycelial hyphae. No central authority dictates the interaction—creativity emerges organically.

WebSockets: Manages room formation and group coordination, acting like the mycelium’s "binding" structure that supports growth while allowing autonomy.

Gain: A system where creativity is distributed, resilient, and adaptive—users can "branch" into new collaborations or merge ideas fluidly.

2. Emergent Collective Compositions

Real-Time Syncing (WebRTC): Users’ notes interact in real time, creating unpredictable, emergent harmonies. This mimics mycelial networks’ ability to generate complex, collective outcomes from simple local interactions.

Example: Two users improvising in a room might accidentally create a melody neither intended—a "fruit" of the network’s collective labor.

Versioning (WebSockets): When users fork tracks, they spawn new "hyphae" of creativity, iterating on shared ideas like mycelium adapting to environmental changes.

Gain: Compositions evolve through many hands, reflecting the community’s collective intelligence rather than individual genius.

3. Resilience and Adaptability

P2P Redundancy (WebRTC): If one user disconnects, others can keep collaborating, much like mycelium rerouting resources around damaged nodes.

Conflict Resolution (WebSockets): Use CRDTs (Conflict-Free Replicated Data Types) to resolve edits without central control, mirroring mycelium’s ability to self-organize.

Gain: The platform becomes antifragile—collaborations adapt to disruptions, and creativity persists even as users join/leave.
