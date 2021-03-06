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

//客户提出过的服务

@Entity
@Table(name="customer_service")
public class Customer_service {
	private Long id;
	private ServiceItem serviceItem;
	private Customer customer;
	private String result;
	//处理时间
	private String serviceDeal;
	private Date dealTime;
	private Date createTime;
	private Date assignTime;
	private User createPerson;
	private int satisfication;
	private String serviceRequest;
	private String state;
	
	
	@Id
	@GeneratedValue(strategy =  GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="Service_Item")
	@Fetch(FetchMode.JOIN)
	public ServiceItem getServiceItem() {
		return serviceItem;
	}
	public void setServiceItem(ServiceItem serviceItem) {
		this.serviceItem = serviceItem;
	}
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="customer_id")
	@Fetch(FetchMode.JOIN)
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Date getDealTime() {
		return dealTime;
	}
	public void setDealTime(Date dealTime) {
		this.dealTime = dealTime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getAssignTime() {
		return assignTime;
	}
	public void setAssignTime(Date assignTime) {
		this.assignTime = assignTime;
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
	public int getSatisfication() {
		return satisfication;
	}
	public void setSatisfication(int satisfication) {
		this.satisfication = satisfication;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getServiceDeal() {
		return serviceDeal;
	}
	public void setServiceDeal(String serviceDeal) {
		this.serviceDeal = serviceDeal;
	}
	public String getServiceRequest() {
		return serviceRequest;
	}
	public void setServiceRequest(String serviceRequest) {
		this.serviceRequest = serviceRequest;
	}
	
	
}
