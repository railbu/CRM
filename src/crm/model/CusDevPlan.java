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

//客户开发计划表

@Entity
@Table(name="cus_dev_Plan")
public class CusDevPlan {
	private Long id;
	private SaleOpportunity saleOpp;
	private Date createTime;
	
	@Id
	@GeneratedValue(strategy =  GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="SALE_OPP")
	@Fetch(FetchMode.JOIN)
	public SaleOpportunity getSaleOpp() {
		return saleOpp;
	}
	public void setSaleOpp(SaleOpportunity saleOpp) {
		this.saleOpp = saleOpp;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	private String content;
	private String result;
}
