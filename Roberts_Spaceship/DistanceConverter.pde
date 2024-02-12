public class DistanceConverter
{
	float km = 1000;

	String convertDistance(){return convert(dist);}

	String convert(int d){
		float k = d/km;
		if(k >= 1000)
			return (int)(k) + " km";
		else if(k >= 100)
			return nf(k,0,1) + " km";
		else if(k >= 10)
			return nf(k,0,2) + " km";
		else
			return d + " m";
	}
}
