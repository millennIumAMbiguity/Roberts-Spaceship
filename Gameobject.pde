public class Gameobject {

	Transform transform;

	float collisionSize;

	void draw(){

	}

	boolean collision(Gameobject obj){
		return  transform.position.dist(obj.transform.position) < collisionSize;
	}

}