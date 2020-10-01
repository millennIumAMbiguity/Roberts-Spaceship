public class DistanceConverter{

	float km = 1000f;
	int kmLimit = 10;

	float mile = 10000f;
	int mileLimit = 10;

	String convertDistance(){
		if(dist/km > kmLimit)
			return "Distance: " + nf(dist/km,0,2) + " km";
		else if(dist/mile > mileLimit)
			return "Distance: " + nf(dist/mile,0,2) + " miles";
		else
			return "Distance: " + dist + " m";
	}
}