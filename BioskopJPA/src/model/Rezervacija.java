package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the rezervacija database table.
 * 
 */
@Entity
@NamedQuery(name="Rezervacija.findAll", query="SELECT r FROM Rezervacija r")
public class Rezervacija implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int rezervacijaID;

	private int brojMesta;

	private int redMesta;

	//bi-directional many-to-one association to Korisnik
	@ManyToOne
	@JoinColumn(name="korisnikID")
	private Korisnik korisnik;

	//bi-directional many-to-one association to Projekcija
	@ManyToOne
	@JoinColumn(name="projekcijaID")
	private Projekcija projekcija;

	public Rezervacija() {
	}

	public int getRezervacijaID() {
		return this.rezervacijaID;
	}

	public void setRezervacijaID(int rezervacijaID) {
		this.rezervacijaID = rezervacijaID;
	}

	public int getBrojMesta() {
		return this.brojMesta;
	}

	public void setBrojMesta(int brojMesta) {
		this.brojMesta = brojMesta;
	}

	public int getRedMesta() {
		return this.redMesta;
	}

	public void setRedMesta(int redMesta) {
		this.redMesta = redMesta;
	}

	public Korisnik getKorisnik() {
		return this.korisnik;
	}

	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}

	public Projekcija getProjekcija() {
		return this.projekcija;
	}

	public void setProjekcija(Projekcija projekcija) {
		this.projekcija = projekcija;
	}

}