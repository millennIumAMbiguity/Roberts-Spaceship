public class Data {
	
	final String dataPath = "savedata.json";
	
	boolean init = false;
	
	public int oldScore = 0;
	public int oldDist  = 0;
	public int oldKills = 0;
	public int oldWaves = 0;

	int storedScore = 0;
	int storedDist  = 0;
	int storedKills = 0;
	int storedWaves = 0;
	
	public void storeScore() {
		
		if (!init) {
			loadScore();
		}
		
		JSONObject json = new JSONObject();
		
		json.put("score", storedScore = max(score, oldScore));
		json.put("dist" , storedDist  = max(dist, oldDist));
		json.put("kills", storedKills = max(stats.kills, oldKills));
		json.put("waves", storedWaves = max(stats.wavesCleared, oldWaves));
		
		saveJSONObject(json, dataPath);
	}
	
	public void loadScore() {
		if (init) {
			oldScore = storedScore;
			oldDist  = storedDist ;
			oldKills = storedKills;
			oldWaves = storedWaves;
			return;
		}
		
		try {
			JSONObject json = loadJSONObject(dataPath);
			
			oldScore = storedScore = json.getInt("score");
			oldDist  = storedDist  = json.getInt("dist" );
			oldKills = storedKills = json.getInt("kills");
			oldWaves = storedWaves = json.getInt("waves");
		} catch(Exception e) { }
		
		init = true;
	}
	
}
