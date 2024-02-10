
void drawGameUI(){
	dist = sHeight + (int)(time/30) - (int)ghostScene.get(0).position.y;
	distScore = dist/500;
	textAlign(LEFT);
	textSize(12);
	
	text("Distance: "+distConverter.convertDistance(), offsetFromSide,spacing);
	text("Lives: " + player.hp.hitPoints, offsetFromSide, spacing*2);
	text("Wave: " + max(stats.wave,0), offsetFromSide, spacing*3);

	textAlign(CENTER);
	textSize(20);
	if (scoreScoll < score){
		scoreScoll += max(score-scoreScoll,0)/32f+0.0075f;
		if (scoreScoll > score)
			scoreScoll = score;
		text((int)scoreScoll+distScore, sWidthHalf, spacing*2);
	} 
	else {
		text(score+distScore, sWidthHalf, spacing*2);
	}

	if(int(max(waveController.spawnNextWave -time,0)) > 0){
		textAlign(CENTER);
		textSize(14);
		if (waveController.willSpawn)
			text("Next wave in " + (int)max(waveController.spawnNextWave - time,0)/1000+ "s" , sWidthHalf, spacing*5);
	}
}


void drawGameOverScreenUI() {
	fill(0xFFFFFFFF);
	textAlign(CENTER);
	textSize(32);
	text("Game Over", sWidthHalf, sHeightHalf - (spacing * 3));
	if(score > data.oldScore) {
		textSize(11);
		text("NEW HIGHSCORE!", sWidthHalf, sHeightHalf - (spacing) * 2 + 3);
	}
	textSize(15);
	text("Final score: " + score, sWidthHalf, sHeightHalf - (spacing));

	fill(0xFF718EA4);
	if(data.oldScore > 0) {
		textSize(11);
		text("Personal best: "+ data.oldScore, sWidthHalf, sHeightHalf - 2);
		textSize(15);
	}

	//stats
	textAlign(RIGHT);
	text("Distance: ", sWidthHalf, sHeightHalf + (spacing*2));
	text("Kills: ", sWidthHalf, sHeightHalf + (spacing*3));
	text("kills/max kills: ", sWidthHalf, sHeightHalf + (spacing*4));
	text("Shoots Fired: ", sWidthHalf, sHeightHalf + (spacing*5));
	text("Hit Ratio: ", sWidthHalf, sHeightHalf + (spacing*6));
	text("Wave: ", sWidthHalf, sHeightHalf + (spacing*7));
	text("Kills/sec: ", sWidthHalf, sHeightHalf + (spacing*8));
    text("Times Took Damage: ", sWidthHalf, sHeightHalf + (spacing*9));
    text("Wave Cleares: ", sWidthHalf, sHeightHalf + (spacing*10));

	textAlign(LEFT);
	text(distConverter.convertDistance() + (dist > data.oldDist ? " (new best)" : ""), sWidthHalf, sHeightHalf + (spacing*2));
	text(stats.kills + (stats.kills > data.oldKills ? " (new best)" : ""), sWidthHalf, sHeightHalf + (spacing*3));
	text(nf((float)stats.kills / stats.enemiesSeen * 100,0,2) + "%", sWidthHalf, sHeightHalf + (spacing*4));
	text(stats.shootsFired, sWidthHalf, sHeightHalf + (spacing*5));
	text(nf((float)(stats.shootsFired-stats.shootsMis) / stats.shootsFired * 100,0,2) + "%", sWidthHalf, sHeightHalf + (spacing*6));
	text(stats.wave + (stats.wave > data.oldWaves ? " (new best)" : ""), sWidthHalf, sHeightHalf + (spacing*7));
	text(nf(stats.kills/(stats.gameTime/1000f),0,2) + " kps", sWidthHalf, sHeightHalf + (spacing*8));
    text(stats.timesTookDamage, sWidthHalf, sHeightHalf + (spacing*9));
    text(stats.wavesCleared, sWidthHalf, sHeightHalf + (spacing*10));
}