public class WaveFormationUnit extends Wave{


	PVector[] parts;
	int[] partsId;

	WaveFormationUnit(int wave) {
		super(wave);

		units = new Enemy[(int)sqrt(wave)*10+1];

		parts = new PVector[(units.length*8)/(128)+1];
		partsId = new int[parts.length];

		for (int i = 0; i < parts.length; ++i) {
			parts[i] = velocity.copy();
		}

		for(int i =0; i < units.length; i++) {
			units[i] = new Enemy(new PVector((i%2==0?width/2+((i*8)%32)+4:width/2-((i*8)%32)-4), -((i*8)/32)*16 - ((i*8)/(128))*128), 
				parts[(i*8)/(128)], 
				this,3);
			partsId[(i*8)/(128)] = i;
		}
	}

	void draw() {
		//debug draw
		super.draw();
		text("Wave.WaveFormationUnit", position.x, position.y);
		text(units.length, position.x, position.y+8);
	}

	void move() {
		position.add(velocity);

		for (int i = 0; i < parts.length; ++i) {

			//only move when inside of screen
			if (units[partsId[i]].position.y < 0)
				continue;
			/*
			if (!units[partsId[i]].exist)
				if (partsId[i] > 0)
					partsId[i]--;
			parts[i].x = sin((units[partsId[i]].position.y-width/4)/32f)*5f;
				*/
			parts[i].x = sin((position.y+i*128+64)/32f)*width/280;
		}

	}

	void action() {

		for (Enemy obj : units) {
			if(obj.exist)
				obj.fire();
		}

	}


}