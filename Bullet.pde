class Bullet extends Gameobject{

	public Bullet(int collisionLayer, PVector velocity, PVector position){
		collisionLayer = this.collisionLayer;
		transform.position = position;
		transform.velocity = velocity;
	}

	
}