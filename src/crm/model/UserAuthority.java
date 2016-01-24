package crm.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="user_authority")
public class UserAuthority {
	private Long id;
	private int power;
	private Authority authority;
	private String onoff;
	
	@Id
	@GeneratedValue(strategy =  GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="AUTHORITY_ID")
	@Fetch(FetchMode.JOIN)
	public Authority getAuthority() {
		return authority;
	}
	public void setAuthority(Authority authority) {
		this.authority = authority;
	}
	public String getOnoff() {
		return onoff;
	}
	public void setOnoff(String onoff) {
		this.onoff = onoff;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	
	
}
