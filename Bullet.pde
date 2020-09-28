class Bullet extends Gameobject{

	public Bullet(int collisionLayer, PVector velocity){
		collisionLayer = this.collisionLayer;
		transform.velocity = velocity;
	}

	
}