void draw(){

	background(0);

	for (Gameobject obj : scene) {
		obj.move();
	}

	//scene.get(0).fire();

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