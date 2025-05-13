---
title: Homework 9a
published_at: 2025-05-09
snippet: Run LLMs locally to help me brainstorm some ideas for AT3 and discuss about it. Then use Processing to make a gif.
disable_html_sanitization: true
allow_math: true
---

# Run LLMs locally to help me brainstorm some ideas for AT3 and discuss about it.

I pick three LLMs Claude, Llama and Deepseek. Both of them help me generate a lot of ideas. As for the domain, repertoire, and values of the communities of practice you are thinking of engaging. I plan to do a collaborative composition platform which users could edit or create music base on the web and communicate each other through notes or drums. It builds a platform that allow artists to share stems/loops/ideas for others to remix, creating branching creative lineages. As for the repertoire, users are allowed to structure discussions around musical ideas where participants can propose variations and track the evolution of concepts. The value of this is that users could learn basic knowledge of making music, or they could make the music they want. There's no restriction about what kind of music users are gonna do or what note what key they need to do. Freedom of expressing their thoughts is the biggest value in this community.

LLMs form some interesting way to use code to engage in this community.
Like interactive music visualizer: Build a simple web-based visualizer that responds to music input with dynamic shapes, colors, and animations.
Use libraries like p5.js or Tone.js for audio analysis and visualization.
Allow users to customize the visual parameters in real-time.
Or kinda like chord progression generator: Create a tool that generates chord progressions based on user-selected keys, moods, or genres.
Implement music theory algorithms to ensure harmonic coherence.
Add features like chord suggestions and inversions.

As for the feasibility of making it into real, I think it is workable to make a simple version. If I wanna make a complete version, it both needs front-end and back-end technologies, the front-end is responsible for UX/UI, interactive experience, while the back-end is responsible for data storage and running and mobilising data and other complex tasks. So in this case, for AT 3 I would probably just simulate the existing user data and let the user create their own user to interact with these existing ‘users’.

As for different LLMs, they have different benefits. Like Claude is good at forming codes, so everytime I ask it about the thoughts and the example and it will form a lot of code example for me. As for deepseek, it is better for text-based question, everytime I ask it to give me an example it still give like a text talking about how to realize it in code way but not actually give me the code. As for Llama, it gave me both code way and text way. Like text of the answer and some analysis then is the code of some simple example.

# Use Processing to make a gif

<iframe 
  id="coding_train_video" 
  src="https://www.youtube.com/embed/HF9D6fwEmA4" 
  title="YouTube video player" 
  frameborder="0" 
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
  referrerpolicy="strict-origin-when-cross-origin" 
  allowfullscreen>
</iframe>

In the tutorial, I saw how to get a quick start on a simple gif animation in Processing, and then I did something like a DNA rotation. Throughout this exploration, I think the most difficult part was the embedding of the markup file, as I couldn't import the gif directly, nor could I successfully import the video. Finally, I got a solution by asking Deepseek, which was to put a /embed/ in the middle of the URL.
