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
@Table(name="order_goods")
public class OrderGoods {
	private Long id;
	private Goods goods;
	private OrderForm orderForm;
	private int count;
	private int priceCount;
	
	@Id
	@GeneratedValue(strategy =  GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="GOODS_ID")
	@Fetch(FetchMode.JOIN)
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="ORDERFORM_ID")
	@Fetch(FetchMode.JOIN)
	public OrderForm getOrderForm() {
		return orderForm;
	}
	public void setOrderForm(OrderForm orderForm) {
		this.orderForm = orderForm;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPriceCount() {
		return priceCount;
	}
	public void setPriceCount(int priceCount) {
		this.priceCount = priceCount;
	}
	
	
}
