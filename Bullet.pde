class Bullet extends Gameobject{

	public Bullet(int collisionLayer, PVector velocity, PVector position, color bulletColor){
		this.collisionLayer = collisionLayer;
		this.position = position;
		this.velocity = velocity;
		objColor = bulletColor;
		collisionSize = 2;
		hp = new Health(1, 0);
	}

	void draw() {
		stroke(objColor);
		rect(position.x-0.5f, position.y-1, 1, 3);
	}
	
}