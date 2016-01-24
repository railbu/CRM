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

@Entity
@Table(name="sale_opportunity")
public class SaleOpportunity {
	private Long id;
	private String customerName;
	//机会来源
	private String source;
	private int successRate;
	//概要
	private String summary;
	private String contactName;
	private String contactPhone;
	private String description;
	//创建人
	private User createPerson;
	private Date createTime;
	private String assignState;
	private User assignPerson;
	private Date assignTime;
	private String developState;
	
	@Id
	@GeneratedValue(strategy =  GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public int getSuccessRate() {
		return successRate;
	}
	public void setSuccessRate(int successRate) {
		this.successRate = successRate;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CREATE_PERSON")
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
	public String getAssignState() {
		return assignState;
	}
	public void setAssignState(String assignState) {
		this.assignState = assignState;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="ASSIGN_PERSON")
	@Fetch(FetchMode.JOIN)
	public User getAssignPerson() {
		return assignPerson;
	}
	public void setAssignPerson(User assignPerson) {
		this.assignPerson = assignPerson;
	}
	public String getDevelopState() {
		return developState;
	}
	public void setDevelopState(String developState) {
		this.developState = developState;
	}
	public Date getAssignTime() {
		return assignTime;
	}
	public void setAssignTime(Date assignTime) {
		this.assignTime = assignTime;
	}
	
}
