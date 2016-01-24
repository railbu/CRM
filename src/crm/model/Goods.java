package crm.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="goods")
public class Goods {
	private Long id;
	private String name;
	//型号
	private String type;
	//等级/批次
	private String level;
	//单价
	private int price;
	//单位
	private String unit;
	//备注
	private String remark;
	//库存
	private Set<LeftGoods> leftGoods = new HashSet<LeftGoods>();
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="goods")
	@Cascade(CascadeType.SAVE_UPDATE)
	@OrderBy("id asc")
	public Set<LeftGoods> getLeftGoods() {
		return leftGoods;
	}
	public void setLeftGoods(Set<LeftGoods> leftGoods) {
		this.leftGoods = leftGoods;
	}
	
	
}
