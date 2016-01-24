package crm.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="order_form")
public class OrderForm {
	private Long id;
	//订单编号
	private String orderNum;
	private Customer customer;
	private Date createDate;
	//送货地址
	private String address;
	private String state;
	private int priceCount;
	private Set<OrderGoods> orderGoods = new HashSet<OrderGoods>();
	@Id
	@GeneratedValue(strategy =  GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CUSTOMER_ID")
	@Fetch(FetchMode.JOIN)
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPriceCount() {
		return priceCount;
	}
	public void setPriceCount(int priceCount) {
		this.priceCount = priceCount;
	}
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="orderForm")
	@Cascade(CascadeType.SAVE_UPDATE)
	@OrderBy("id asc")
	public Set<OrderGoods> getOrderGoods() {
		return orderGoods;
	}
	
	public void setOrderGoods(Set<OrderGoods> orderGoods) {
		
		this.orderGoods = orderGoods;
	}
	
	public void addOrderGoods(OrderGoods orderGoods){
		orderGoods.setOrderForm(this);
		this.orderGoods.add(orderGoods);
	}
	
	
}
