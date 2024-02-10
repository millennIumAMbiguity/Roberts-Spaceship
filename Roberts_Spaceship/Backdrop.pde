public class Backdrop
{
	PVector[] zones = new PVector[10];
	Star[] stars;

	void setZones(){
		for (int i = 0; i < zones.length; ++i) {
			zones[i] = new PVector(sWidth/10*i,sWidth - (sWidth/10*((zones.length-1)-i)));
		}
		spawnStars();
	}

	void spawnStars(){
		stars = new Star[(sWidth/10)];
		for (int i = 0; i < zones.length; ++i) {
			for (int j = 0; j < stars.length/10; ++j) {
				new Star(zones[i]);
			}

		}
	}
}