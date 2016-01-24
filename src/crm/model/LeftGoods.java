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
@Table(name="left_goods")
public class LeftGoods {
	
	private Long id;
	private String name;
	//仓库
	private String respoitory;
	//货位
	private String location;
	//产品
	private Goods goods;
	//件数
	private int numbers;
	//备注
	private String remark;
	
	@Id
	@GeneratedValue(strategy =  GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRespoitory() {
		return respoitory;
	}
	public void setRespoitory(String respoitory) {
		this.respoitory = respoitory;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="GOODS_ID")
	@Fetch(FetchMode.JOIN)
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	
	public int getNumbers() {
		return numbers;
	}
	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
