package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the komentar database table.
 * 
 */
@Entity
@NamedQuery(name="Komentar.findAll", query="SELECT k FROM Komentar k")
public class Komentar implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int komentarID;

	private String datumKom;

	private String datumOc;

	private String komentar;

	private int ocena;

	//bi-directional many-to-one association to Film
	@ManyToOne
	@JoinColumn(name="filmID")
	private Film film;

	//bi-directional many-to-one association to Korisnik
	@ManyToOne
	@JoinColumn(name="korisnikID")
	private Korisnik korisnik;

	public Komentar() {
	}

	public int getKomentarID() {
		return this.komentarID;
	}

	public void setKomentarID(int komentarID) {
		this.komentarID = komentarID;
	}

	public String getDatumKom() {
		return this.datumKom;
	}

	public void setDatumKom(String datumKom) {
		this.datumKom = datumKom;
	}

	public String getDatumOc() {
		return this.datumOc;
	}

	public void setDatumOc(String datumOc) {
		this.datumOc = datumOc;
	}

	public String getKomentar() {
		return this.komentar;
	}

	public void setKomentar(String komentar) {
		this.komentar = komentar;
	}

	public int getOcena() {
		return this.ocena;
	}

	public void setOcena(int ocena) {
		this.ocena = ocena;
	}

	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public Korisnik getKorisnik() {
		return this.korisnik;
	}

	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}
	
}