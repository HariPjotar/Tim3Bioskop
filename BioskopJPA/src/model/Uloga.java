package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the uloga database table.
 * 
 */
@Entity
@NamedQuery(name="Uloga.findAll", query="SELECT u FROM Uloga u")
public class Uloga implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int ulogaID;

	private String imeUloge;

	//bi-directional many-to-one association to Korisnik
	@OneToMany(mappedBy="uloga")
	private List<Korisnik> korisniks;

	public Uloga() {
	}

	public int getUlogaID() {
		return this.ulogaID;
	}

	public void setUlogaID(int ulogaID) {
		this.ulogaID = ulogaID;
	}

	public String getImeUloge() {
		return this.imeUloge;
	}

	public void setImeUloge(String imeUloge) {
		this.imeUloge = imeUloge;
	}

	public List<Korisnik> getKorisniks() {
		return this.korisniks;
	}

	public void setKorisniks(List<Korisnik> korisniks) {
		this.korisniks = korisniks;
	}

	public Korisnik addKorisnik(Korisnik korisnik) {
		getKorisniks().add(korisnik);
		korisnik.setUloga(this);

		return korisnik;
	}

	public Korisnik removeKorisnik(Korisnik korisnik) {
		getKorisniks().remove(korisnik);
		korisnik.setUloga(null);

		return korisnik;
	}

}