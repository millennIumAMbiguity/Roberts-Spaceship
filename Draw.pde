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
	for (Gameobject obj : newSceneItems) {
		obj.id = scene.size();
		scene.add(obj);
	}
	newSceneItems = new ArrayList<Gameobject>();

}