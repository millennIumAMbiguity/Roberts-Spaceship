class Bullet extends Gameobject{

	public Bullet(int collisionLayer, PVector velocity, PVector position){
		this.collisionLayer = collisionLayer;
		this.position = position;
		this.velocity = velocity;
		collisionSize = 2;
		hp = new Health(1, 0);
		objColor = 0xFF718EA4;
	}

	void draw() {
		fill(objColor);
		noStroke();
		rect(position.x-0.5f, position.y-1, 1, 3);
	}
	
}