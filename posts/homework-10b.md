---
title: Homework 10b
published_at: 2025-05-20
snippet: choose a scripting language workflow out of the options and discuss about it.
disable_html_sanitization: true
allow_math: true
---

# Create a script that demonstrates what I have learned.

![Art From Code(R)](/static/250520/Rplot.png)

https://www.youtube.com/watch?v=XHT1m-LKTVY

I found this tutorial to help me get started with R. I originally thought that this language was a one-time run after writing the whole thing, like javascript, but in fact I did it and nothing happened. I found out that I have to write it in console, and I have to run it after I write a part of it. I first Generate layered rectangles, then Create a plot, then save it and finally dump it out. It's more complicated than I thought.

# Discussion of Art From Code (R)

![Art From Code(R)](/static/250520/img2.jpg)

I can use R to create procedurally generated artworks by combining randomness, math, and visual libraries. And R has a goal for high resolution static compositing, scientific visual effects, data driven/data art, etc. They are better used for interactivity/animation if you are using p5 or processing.

Comparing to other creative scripting language, I think R's advantages include high quality charts, data manipulation, repeatability, but limited interactivity and low real-time performance. r is ideal for data art, personal portraits, or generating infographics. It also has support for PDF, SVG, and high-resolution PNG, so you can generate higher-resolution images. This makes it unsuitable for games, interactive devices or web-based art. Then the trouble is that unlike p5.js, R doesn't work in a browser. It requires RStudio or an exported workflow.

Scripted languages are where the code is interpreted line by line as it runs, while compiled languages are where the code is translated into machine code before it runs. The advantage of scripting languages is that you can write a few lines and then run them immediately, so they are very good for experimentation. Also Focus stays on what you're making, not how the machine runs it. The weakness of scripted languages is obvious, the code runs slower than compiled code because it is interpreted line by line. There is no type checking at compile time, so errors such as undefined variable display only at runtime.

It runs fast for a compiled language, especially for graphics, game engines, audio processing, simulation. It also catches errors before they occur - helping to prevent errors in large systems. This makes it ideal for performing arts, VR/AR, shaders, embedded art installations. The downside is that it is slow and requires more steps: Write -> Compile -> Fix Errors -> Run. Because of its detailed syntax it can be intimidating for artists or beginners.
