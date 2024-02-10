class Powerup extends Gameobject
{
    Powerup(PVector pos){
        position = pos;
        velocity.y = scrollSpeed;

		collisionLayer = 4;
		objColor = 0xFF277554;
		objStrokeColor = 0xFF499273;
    }

    void draw() {
		stroke(objStrokeColor);
		fill(objColor);

		beginShape();
		vertex(position.x, -2 + position.y);
		vertex( 4 + position.x, -4 + position.y);
		vertex( 2 + position.x, position.y);
		vertex( 4 + position.x, 4 + position.y);
		vertex( 0 + position.x, 2 + position.y);
		vertex( -4 + position.x, 4 + position.y);
		vertex( -2 + position.x, 0 + position.y);
		vertex( -4 + position.x, -4 + position.y);
		endShape(CLOSE);
	}

	void outOfBounds(){
        if (position.y > height+collisionSize) {
            removeFromScene();
        }
	}
}