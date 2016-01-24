package crm.model;

import java.util.Date;

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

//服务项目

@Entity
@Table(name="service_item")
public class ServiceItem {
	private Long id;
	private String type;
	private String summary;
	private String assignState;
	private User createPerson;
	private Date createTime;
	//被指派人
	private User assignedPerson;
	private Date assignTime;
	//指派人
	private User assignPerson;
	
	@Id
	@GeneratedValue(strategy =  GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getAssignState() {
		return assignState;
	}
	public void setAssignState(String assignState) {
		this.assignState = assignState;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="create_person")
	@Fetch(FetchMode.JOIN)
	public User getCreatePerson() {
		return createPerson;
	}
	public void setCreatePerson(User createPerson) {
		this.createPerson = createPerson;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="assigned_person")
	@Fetch(FetchMode.JOIN)
	public User getAssignedPerson() {
		return assignedPerson;
	}
	public void setAssignedPerson(User assignedPerson) {
		this.assignedPerson = assignedPerson;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="assign_person")
	@Fetch(FetchMode.JOIN)
	public User getAssignPerson() {
		return assignPerson;
	}
	public void setAssignPerson(User assignPerson) {
		this.assignPerson = assignPerson;
	}
	public Date getAssignTime() {
		return assignTime;
	}
	public void setAssignTime(Date assignTime) {
		this.assignTime = assignTime;
	}
	
	
}
