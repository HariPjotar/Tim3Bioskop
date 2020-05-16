package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


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

	private int brUlaznica;

	//bi-directional many-to-one association to Mesta
	@OneToMany(mappedBy="rezervacija")
	private List<Mesta> mestas;

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

	public int getBrUlaznica() {
		return this.brUlaznica;
	}

	public void setBrUlaznica(int brUlaznica) {
		this.brUlaznica = brUlaznica;
	}

	public List<Mesta> getMestas() {
		return this.mestas;
	}

	public void setMestas(List<Mesta> mestas) {
		this.mestas = mestas;
	}

	public Mesta addMesta(Mesta mesta) {
		getMestas().add(mesta);
		mesta.setRezervacija(this);

		return mesta;
	}

	public Mesta removeMesta(Mesta mesta) {
		getMestas().remove(mesta);
		mesta.setRezervacija(null);

		return mesta;
	}
	
	public String stampajMesta() {
		List<Mesta> mestas = this.mestas;
		String s = "";
		for (Mesta m : mestas) {
			s += m.toString();
			s += " ";
		}
		return s;
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