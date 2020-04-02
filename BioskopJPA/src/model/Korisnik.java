package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the korisnik database table.
 * 
 */
@Entity
@NamedQuery(name="Korisnik.findAll", query="SELECT k FROM Korisnik k")
public class Korisnik implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int korisnikID;

	private String email;

	private String ime;

	private String password;

	private String prezime;

	private String username;

	//bi-directional many-to-one association to Komentar
	@OneToMany(mappedBy="korisnik")
	private List<Komentar> komentars;

	//bi-directional many-to-one association to Rezervacija
	@OneToMany(mappedBy="korisnik")
	private List<Rezervacija> rezervacijas;

	public Korisnik() {
	}

	public int getKorisnikID() {
		return this.korisnikID;
	}

	public void setKorisnikID(int korisnikID) {
		this.korisnikID = korisnikID;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Komentar> getKomentars() {
		return this.komentars;
	}

	public void setKomentars(List<Komentar> komentars) {
		this.komentars = komentars;
	}

	public Komentar addKomentar(Komentar komentar) {
		getKomentars().add(komentar);
		komentar.setKorisnik(this);

		return komentar;
	}

	public Komentar removeKomentar(Komentar komentar) {
		getKomentars().remove(komentar);
		komentar.setKorisnik(null);

		return komentar;
	}

	public List<Rezervacija> getRezervacijas() {
		return this.rezervacijas;
	}

	public void setRezervacijas(List<Rezervacija> rezervacijas) {
		this.rezervacijas = rezervacijas;
	}

	public Rezervacija addRezervacija(Rezervacija rezervacija) {
		getRezervacijas().add(rezervacija);
		rezervacija.setKorisnik(this);

		return rezervacija;
	}

	public Rezervacija removeRezervacija(Rezervacija rezervacija) {
		getRezervacijas().remove(rezervacija);
		rezervacija.setKorisnik(null);

		return rezervacija;
	}

}