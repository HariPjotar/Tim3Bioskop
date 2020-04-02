package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the radnik database table.
 * 
 */
@Entity
@NamedQuery(name="Radnik.findAll", query="SELECT r FROM Radnik r")
public class Radnik implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int radnikID;

	private byte admin;

	private String email;

	private String ime;

	private String password;

	private String prezime;

	private String username;

	//bi-directional many-to-one association to Karta
	@OneToMany(mappedBy="radnik")
	private List<Karta> kartas;

	public Radnik() {
	}

	public int getRadnikID() {
		return this.radnikID;
	}

	public void setRadnikID(int radnikID) {
		this.radnikID = radnikID;
	}

	public byte getAdmin() {
		return this.admin;
	}

	public void setAdmin(byte admin) {
		this.admin = admin;
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

	public List<Karta> getKartas() {
		return this.kartas;
	}

	public void setKartas(List<Karta> kartas) {
		this.kartas = kartas;
	}

	public Karta addKarta(Karta karta) {
		getKartas().add(karta);
		karta.setRadnik(this);

		return karta;
	}

	public Karta removeKarta(Karta karta) {
		getKartas().remove(karta);
		karta.setRadnik(null);

		return karta;
	}

}