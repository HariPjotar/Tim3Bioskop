package model;

public class Sediste implements Comparable<Sediste>{

	int red;
	int kolona;

	public Sediste(int red, int kolona) {
		super();
		this.red = red;
		this.kolona = kolona;
	}

	public int getRed() {
		return red;
	}

	public void setRed(int red) {
		this.red = red;
	}

	public int getKolona() {
		return kolona;
	}

	public void setKolona(int kolona) {
		this.kolona = kolona;
	}

	@Override
	public int compareTo(Sediste o) {

		if(this.red>o.red)
			return 1;
		else if (this.red<o.red)
			return -1;
		else {
			if (this.kolona>o.kolona){
				return 1;
			}else {
				return -1;
			}
		}
		
	}

	
}
