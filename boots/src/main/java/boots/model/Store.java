package boots.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name="stores")
public class Store implements Serializable{
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(length=45)
	private String name;
	@Column(length=45)
	private String address;
	@Column(length=45)
	private String telephone;
	@Column(length=45)
	private String email;
	@Column(length=45)
	private String rfc;
	@Column(length=45)
	private int yearOfConstruction;
	
	public Store(String name, String address, String telephone, String email, String rfc,
			int yearOfConstruction) {
		super();
		this.name = name;
		this.address = address;
		this.telephone = telephone;
		this.email = email;
		this.rfc = rfc;
		this.yearOfConstruction = yearOfConstruction;

	}

	public Store() {
		this("","","","","",0);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRfc() {
		return rfc;
	}

	public void setRfc(String rfc) {
		this.rfc = rfc;
	}

	public int getYearOfConstruction() {
		return yearOfConstruction;
	}

	public void setYearOfConstruction(int yearOfConstruction) {
		this.yearOfConstruction = yearOfConstruction;
	}

	@Override
	public String toString() {
		return "Store [id=" + id + ", name=" + name + ", address=" + address + ", telephone=" + telephone + ", email="
				+ email + ", rfc=" + rfc + ", yearOfConstruction=" + yearOfConstruction + "]";
	}

	
}
