class Box{

  Body body;
  float w;
  float h;

  Box(float x, float y) {
    w = (20);
    h = (20);    
    makeBody(new Vec2(x,y),w,h);
  }
//---------------------------------------------------------------------------
  void killBody() {
    box2d.destroyBody(body);
  }

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+w*h) {
      killBody();
      return true; 
    }
    return false;
  }
//---------------------------------------------------------------------------
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(255);

    rect(0, 0, w, h);
    popMatrix();
  }
//---------------------------------------------------------------------------
  void makeBody(Vec2 center, float w_, float h_) {

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    fill(255);
    
    sd.setAsBox(box2dW, box2dH); 

    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1.5;
    fd.friction = 0.1;
    fd.restitution = 1.2;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(random(0,50), random(0,-50)));
    body.setAngularVelocity(random(0, 10));
  }
}