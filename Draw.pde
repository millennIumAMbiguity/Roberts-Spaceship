void draw()
{

	background(0);

	for (Gameobject obj : scene) {
		obj.draw();
	}

}