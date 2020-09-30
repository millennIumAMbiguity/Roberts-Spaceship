class Bullet extends Gameobject{

	public Bullet(int collisionLayer, PVector velocity, PVector position, color bulletColor){
		this.collisionLayer = collisionLayer;
		this.position = position;
		this.velocity = velocity;
		objColor = bulletColor;
		collisionSize = 2;
		hp = new Health(1, 0);
		if (collisionLayer == 2)
			objColor = 0xFFD4886A;
		else
			objColor = 0xFF718EA4;
	}

	void draw() {
		fill(objColor);
		noStroke();
		rect(position.x-1f, position.y-2, 2, 5);
	}
	
}