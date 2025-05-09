import gifAnimation.*;

GifMaker gifExport;
float t = 0;
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(800, 400);
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();
  
  // Initialize 500 particles
  for(int i = 0; i < 500; i++) {
    particles.add(new Particle());
  }
  
  // GIF setup (change filename as needed)
  gifExport = new GifMaker(this, "waveform.gif");
  gifExport.setRepeat(0); // Infinite loop
  gifExport.setQuality(255);
  gifExport.setDelay(33); // 30fps
}

void draw() {
  background(0);
  
  // Draw waveform
  drawWaveform();
  
  // Update and display particles
  for(Particle p : particles) {
    p.update();
    p.display();
  }
  
  // Record 4 seconds (120 frames)
  if(frameCount <= 120) {
    gifExport.addFrame();
  } else {
    gifExport.finish();
    println("GIF saved!");
    noLoop();
  }
  
  t += 0.05;
}

void drawWaveform() {
  beginShape();
  for(float x = 0; x <= width; x += 5) {
    float y = height/2 + sin(x*0.02 + t)*80 + noise(x*0.1, t)*50;
    fill(map(x, 0, width, 0, 360), 80, 100);
    ellipse(x, y, 8, 8);
  }
  endShape();
}

class Particle {
  PVector pos;
  PVector vel;
  color c;
  float lifespan;
  
  Particle() {
    reset();
  }
  
  void reset() {
    pos = new PVector(random(width), random(height));
    vel = PVector.random2D().mult(random(0.5, 2));
    c = color(random(360), 80, 100, 150);
    lifespan = random(100, 200);
  }
  
  void update() {
    pos.add(vel);
    lifespan -= 1.5;
    
    // Add Perlin noise motion
    vel.x += map(noise(pos.x*0.01, t), 0, 1, -0.1, 0.1);
    vel.y += map(noise(pos.y*0.01, t), 0, 1, -0.1, 0.1);
    
    if(lifespan < 0) reset();
  }
  
  void display() {
    fill(c, lifespan);
    ellipse(pos.x, pos.y, map(lifespan, 0, 200, 2, 8), map(lifespan, 0, 200, 2, 8));
  }
}
