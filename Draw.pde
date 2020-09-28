void draw(){

	time = millis();
	background(0);

	for (Gameobject obj : ghostScene) {
		obj.move();
	}

	for (Gameobject obj : ghostScene) {
		obj.outOfBounds();
	}

	for (Gameobject obj : ghostScene) {
		obj.collision();
	}

	for (Gameobject obj : ghostScene) {
		obj.action();
	}

	for (Gameobject obj : ghostScene) {
		obj.draw();
	}


	//add new scene objects to scene
	ghostScene = new ArrayList<Gameobject>(scene);

}