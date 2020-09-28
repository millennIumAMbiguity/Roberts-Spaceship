public class Input_Handler {

	public boolean fire;

	void keyPressed(){
		if(key == " "){
			fire = true;
		}
	}

	void keyReleased(){
		if(key == " "){
			fire = false;
		}
	}

}