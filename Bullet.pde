class Bullet extends Gameobject{

	public Bullet(int collisionLayer, PVector velocity, PVector position, color bulletColor){
		this.collisionLayer = collisionLayer;
		this.position = position;
		this.velocity = velocity;
		objColor = bulletColor;
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