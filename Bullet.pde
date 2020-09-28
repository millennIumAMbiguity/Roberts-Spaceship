class Bullet extends Gameobject{

	public Bullet(int collisionLayer, PVector velocity, PVector position){
		this.collisionLayer = collisionLayer;
		this.position = position;
		this.velocity = velocity;
	}

	
}