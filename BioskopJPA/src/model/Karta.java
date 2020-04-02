package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the karta database table.
 * 
 */
@Entity
@NamedQuery(name="Karta.findAll", query="SELECT k FROM Karta k")
public class Karta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int kartaID;

	private String datum;

	//bi-directional many-to-one association to Projekcija
	@ManyToOne
	@JoinColumn(name="projekcijaID")
	private Projekcija projekcija;

	//bi-directional many-to-one association to Radnik
	@ManyToOne
	@JoinColumn(name="radnikID")
	private Radnik radnik;

	public Karta() {
	}

	public int getKartaID() {
		return this.kartaID;
	}

	public void setKartaID(int kartaID) {
		this.kartaID = kartaID;
	}

	public String getDatum() {
		return this.datum;
	}

	public void setDatum(String datum) {
		this.datum = datum;
	}

	public Projekcija getProjekcija() {
		return this.projekcija;
	}

	public void setProjekcija(Projekcija projekcija) {
		this.projekcija = projekcija;
	}

	public Radnik getRadnik() {
		return this.radnik;
	}

	public void setRadnik(Radnik radnik) {
		this.radnik = radnik;
	}

}