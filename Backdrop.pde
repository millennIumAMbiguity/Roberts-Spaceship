public class Backdrop
{
	PVector[] zones = new PVector[10];
	Star[] stars;

	void setZones(){
		for (int i = 0; i < zones.length; ++i) {
			zones[i] = new PVector(width/10*i,width - (width/10*((zones.length-1)-i)));
		}
		spawnStars();
	}

	void spawnStars(){
		stars = new Star[(width/10)];
		for (int i = 0; i < zones.length; ++i) {
			for (int j = 0; j < stars.length/10; ++j) {
				new Star(zones[i]);
			}

		}
	}
}