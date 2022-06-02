package Util;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class CityInfoParser {
	public static void readFiles() throws FileNotFoundException, IOException {
		InputStream is = CityInfoParser.class.getClassLoader().getResourceAsStream("/LA_County_Cities.csv");
		try (BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
		    
			String line;
			boolean colName = false;
		    try {
				while ((line = br.readLine()) != null) {
				    String[] values = line.split(",");
				    if(!colName) {
				    	colName = true;
				    	CityInfoParser.colNames = Arrays.asList(values);
				    	continue;
				    }
				    if (values.length > 1) {
					    City c = new City(values[0], values[2]+values[3], values[4]+values[5], values[6]+values[7]);
					    CityInfoParser.records.add(c);
				    }
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return;
	}
	
	public static ArrayList<City> getCities(String cityName){
		ArrayList<City> cityList = new ArrayList<> ();
		if (cityName != null) {
			for (City c: CityInfoParser.records) {
				if (c.getName().toLowerCase().contains(cityName.toLowerCase())) {
					cityList.add(c);
				}
			}
		}
		return cityList;
	}
	
	private static List<String> colNames = new ArrayList<> ();
	public static List<City> records = new ArrayList<> ();
}

