public class Health {
	int hitPoints;
	int maxHP;

	Health(int hp){
		hitPoints = maxHP = hp;
	}

	boolean add(int hp){
		if (hitPoints < maxHP){
			hitPoints+=hp;
			return false;
		}
		return true;
	}

	boolean sub(int hp){
		hitPoints-=hp;
		if (hitPoints < 1){
			return true;
		}
		return false;
	}
}