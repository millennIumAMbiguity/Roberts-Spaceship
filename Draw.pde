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

	if (!gameover)
	dist = height + (int)(time/30) - (int)ghostScene.get(0).position.y;
	text("score: " + score, 0, 16);
	text("distance: " + dist + "m", 0, 32);

	//add new scene objects to scene
	ghostScene = new ArrayList<Gameobject>(scene);
}