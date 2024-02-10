void intro() {
	noStroke();
	textAlign(CENTER);
	textSize(32);

	if (time < 5500){

		fill(color(255,255,255,max(time/1000f-1,0)*255*max(5-(time/1000f),0)));
		text("A Game Produced and Designed by", sWidthHalf, sHeightHalf);

	} 
	else {
		//stars
		for (Star star : starsInScene) {
			star.move();
		}
		//stars alpha
		fill(color(0,0,0,min(max(5-time/2000f,0.01),1)*255));
		rect(-1, 0, sWidth+1, sHeight);

		//game ui
		fill(color(113,147,164,max(time/2000f-11,0)*255));
		drawGameUI();

		fill(color(255,255,255,max(time/1000f-6,0)*255*max(10-(time/1000f),0)));
		text("Nicklas Hidesjö", sWidthHalf, sHeightHalf -32);
		text("and", sWidthHalf, sHeightHalf);
		text("Simon Jonasson", sWidthHalf, sHeightHalf + 32);

		fill(color(255,255,255,max(time/1000f-11,0)*255*max(14-(time/1000f),0)));
		text("Represents", sWidthHalf, sHeightHalf);

		fill(color(255,255,255,max(time/2000f-8,0)*255*max(11-(time/2000f),0)));
		textSize(48+sin(time/100f));
		text("Robert's Spaceship", sWidthHalf, sHeightHalf);
		textSize(16);
		text("Adventures in Another Solar System", sWidthHalf, sHeightHalf + 32);

		if (time > 24000){
			waveController.spawnNextWave = 25000;
			titleScreen = false;
		}
	}
}