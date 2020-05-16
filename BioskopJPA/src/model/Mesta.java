package model;

import java.io.Serializable;
import javax.persistence.*;


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
	@ManyToOne
	@JoinColumn(name="rezervacijaID")
	private Rezervacija rezervacija;

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

	public Rezervacija getRezervacija() {
		return this.rezervacija;
	}

	public void setRezervacija(Rezervacija rezervacija) {
		this.rezervacija = rezervacija;
	}

	@Override
	public String toString() {
		return "[red:" + redMesta + ", broj:" + brojMesta + "]";
	}

}