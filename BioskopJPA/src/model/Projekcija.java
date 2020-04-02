package model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the projekcija database table.
 * 
 */
@Entity
@NamedQuery(name="Projekcija.findAll", query="SELECT p FROM Projekcija p")
public class Projekcija implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int projekcijaID;

	private double cena;

	private String datum;

	private int slobodnaMesta;

	private String tip;

	private String vreme;

	//bi-directional many-to-one association to Karta
	@OneToMany(mappedBy="projekcija")
	private List<Karta> kartas;

	//bi-directional many-to-one association to Film
	@ManyToOne
	@JoinColumn(name="filmID")
	private Film film;

	//bi-directional many-to-one association to Sala
	@ManyToOne
	@JoinColumn(name="salaID")
	private Sala sala;

	//bi-directional many-to-one association to Rezervacija
	@OneToMany(mappedBy="projekcija")
	private List<Rezervacija> rezervacijas;

	public Projekcija() {
	}

	public int getProjekcijaID() {
		return this.projekcijaID;
	}

	public void setProjekcijaID(int projekcijaID) {
		this.projekcijaID = projekcijaID;
	}

	public double getCena() {
		return this.cena;
	}

	public void setCena(double cena) {
		this.cena = cena;
	}

	public String getDatum() {
		return this.datum;
	}

	public void setDatum(String datum) {
		this.datum = datum;
	}

	public int getSlobodnaMesta() {
		return this.slobodnaMesta;
	}

	public void setSlobodnaMesta(int slobodnaMesta) {
		this.slobodnaMesta = slobodnaMesta;
	}

	public String getTip() {
		return this.tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getVreme() {
		return this.vreme;
	}

	public void setVreme(String vreme) {
		this.vreme = vreme;
	}

	public List<Karta> getKartas() {
		return this.kartas;
	}

	public void setKartas(List<Karta> kartas) {
		this.kartas = kartas;
	}

	public Karta addKarta(Karta karta) {
		getKartas().add(karta);
		karta.setProjekcija(this);

		return karta;
	}

	public Karta removeKarta(Karta karta) {
		getKartas().remove(karta);
		karta.setProjekcija(null);

		return karta;
	}

	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public Sala getSala() {
		return this.sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}

	public List<Rezervacija> getRezervacijas() {
		return this.rezervacijas;
	}

	public void setRezervacijas(List<Rezervacija> rezervacijas) {
		this.rezervacijas = rezervacijas;
	}

	public Rezervacija addRezervacija(Rezervacija rezervacija) {
		getRezervacijas().add(rezervacija);
		rezervacija.setProjekcija(this);

		return rezervacija;
	}

	public Rezervacija removeRezervacija(Rezervacija rezervacija) {
		getRezervacijas().remove(rezervacija);
		rezervacija.setProjekcija(null);

		return rezervacija;
	}
	
	public void racunanjeCene() {
		String tip = this.tip;
		if (tip.equalsIgnoreCase("pretpremijera")) {
			this.cena = 550.00;
		}
		if (tip.equalsIgnoreCase("premijera")) {
			this.cena = 470.00;
		}
		else {
			this.cena = 350.00;
		}
	}

}