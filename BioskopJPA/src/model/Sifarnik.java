package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the sifarnik database table.
 * 
 */
@Entity
@NamedQuery(name="Sifarnik.findAll", query="SELECT s FROM Sifarnik s")
public class Sifarnik implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int sifarnikID;

	private double cena;

	private String tip;

	//bi-directional many-to-one association to Projekcija
	@OneToMany(mappedBy="sifarnik")
	private List<Projekcija> projekcijas;

	public Sifarnik() {
	}

	public int getSifarnikID() {
		return this.sifarnikID;
	}

	public void setSifarnikID(int sifarnikID) {
		this.sifarnikID = sifarnikID;
	}

	public double getCena() {
		return this.cena;
	}

	public void setCena(double cena) {
		this.cena = cena;
	}

	public String getTip() {
		return this.tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public List<Projekcija> getProjekcijas() {
		return this.projekcijas;
	}

	public void setProjekcijas(List<Projekcija> projekcijas) {
		this.projekcijas = projekcijas;
	}

	public Projekcija addProjekcija(Projekcija projekcija) {
		getProjekcijas().add(projekcija);
		projekcija.setSifarnik(this);

		return projekcija;
	}

	public Projekcija removeProjekcija(Projekcija projekcija) {
		getProjekcijas().remove(projekcija);
		projekcija.setSifarnik(null);

		return projekcija;
	}

}