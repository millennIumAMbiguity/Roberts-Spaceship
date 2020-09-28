void draw(){

	background(0);

	for (Gameobject obj : scene) {
		obj.move();
	}

	for (Gameobject obj : scene) {
		obj.draw();
	}

}