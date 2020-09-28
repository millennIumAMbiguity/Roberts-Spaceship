void draw(){

	background(0);

	for (Gameobject obj : scene) {
		obj.move();
	}

	for (Gameobject obj : scene) {
		//obj.outOfBounds();
	}

	for (Gameobject obj : scene) {
		obj.fire();
	}

	for (Gameobject obj : scene) {
		obj.draw();
	}


	//add new scene objects to scene
	scene = new ArrayList<Gameobject>(ghostScene);

}