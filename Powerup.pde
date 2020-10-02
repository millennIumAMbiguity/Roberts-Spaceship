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
		ellipse(position.x, position.y, collisionSize, collisionSize);
	}

	void outOfBounds(){
        if (position.y > height+collisionSize) {
            removeFromScene();
        }
	}
}