package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the mesta database table.
 * 
 */
@Entity
@NamedQuery(name="Mesta.findAll", query="SELECT m FROM Mesta m")
public class Mesta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int mestoID;

	private int brojMesta;

	private int redMesta;

	//bi-directional many-to-one association to Rezervacija
	@OneToMany(mappedBy="mesta")
	private List<Rezervacija> rezervacijas;

	public Mesta() {
	}

	public int getMestoID() {
		return this.mestoID;
	}

	public void setMestoID(int mestoID) {
		this.mestoID = mestoID;
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

	public List<Rezervacija> getRezervacijas() {
		return this.rezervacijas;
	}

	public void setRezervacijas(List<Rezervacija> rezervacijas) {
		this.rezervacijas = rezervacijas;
	}

	public Rezervacija addRezervacija(Rezervacija rezervacija) {
		getRezervacijas().add(rezervacija);
		rezervacija.setMesta(this);

		return rezervacija;
	}

	public Rezervacija removeRezervacija(Rezervacija rezervacija) {
		getRezervacijas().remove(rezervacija);
		rezervacija.setMesta(null);

		return rezervacija;
	}

}