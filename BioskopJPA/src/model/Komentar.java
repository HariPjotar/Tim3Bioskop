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

	private String komentar;

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

	public String getKomentar() {
		return this.komentar;
	}

	public void setKomentar(String komentar) {
		this.komentar = komentar;
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