package Util;

public class City {
	private String name, pop, pcInc, household;
	
	public City(String name, String pop, String pcInc, String household) {
		this.name = name.replace("\"", "");
		this.pop = pop.replace("\"", "");
		this.pcInc = pcInc.replace("\"", "");
		this.household = household.replace("\"", "");
	}

	public String getName() {
		return name;
	}

	public String getPop() {
		return pop;
	}

	public String getPcInc() {
		return pcInc;
	}

	public String getHousehold() {
		return household;
	}

	
	public String toString() {
		return this.getName() + " " + this.getPcInc();
	}
}
