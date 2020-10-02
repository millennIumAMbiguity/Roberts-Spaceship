public class DistanceConverter
{
	float km = 1000f;
	int kmLimit = 10;

	float mile = 10000f;
	int mileLimit = 10;

	String convertDistance(){
		if(dist/mile > mileLimit)
			return nf(dist/mile,0,2) + " miles";
		else if(dist/km > kmLimit)
			return nf(dist/km,0,2) + " km";
		else
			return dist + " m";
	}
}