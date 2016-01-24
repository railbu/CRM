package crm.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
@Table(name="customer")
public class Customer {
	private Long id;
	private String name;
	private Location location;
	private User user;
	private Rank rank;
	private int satisfication;
	private int credit;
	private String address;
	private String zipcode;
	private String phone;
	private String fax;
	private String website;
	private String businessLicence;
	//法人
	private String corporation;
	private String property;
	private String SalesVolume;
	private String bankName;
	private String bankAccount;
	//地址登记号
	private String NumAddress;
	//国税登记号
	private String NTRU;
	//上次购货时间
	private String lastShoppingTime;
	private String state;
	//流失原因
	private String reasonOfLost;
	private String rank2;
	//确认流失时间
	private Date timeOfLost;
	
	private Set<Contact> contacts = new HashSet<Contact>();
	private Set<Measure> measures = new HashSet<Measure>();
	private Set<OrderForm> orderForms = new HashSet<OrderForm>();
	private Set<ContactRecord> contactRecords = new HashSet<ContactRecord>();
	
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
	
	@Enumerated(EnumType.STRING)
	public Location getLocation() {
		return location;
	}
	public void setLocation(Location location) {
		this.location = location;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="USERS_ID")
	@Fetch(FetchMode.JOIN)
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	@Enumerated(EnumType.STRING)
	public Rank getRank() {
		return rank;
	}
	public void setRank(Rank rank) {
		this.rank = rank;
	}
	
	public int getSatisfication() {
		return satisfication;
	}
	public void setSatisfication(int satisfication) {
		this.satisfication = satisfication;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getBusinessLicence() {
		return businessLicence;
	}
	public void setBusinessLicence(String businessLicence) {
		this.businessLicence = businessLicence;
	}
	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getSalesVolume() {
		return SalesVolume;
	}
	public void setSalesVolume(String salesVolume) {
		SalesVolume = salesVolume;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	public String getNumAddress() {
		return NumAddress;
	}
	public void setNumAddress(String numAddress) {
		NumAddress = numAddress;
	}
	public String getNTRU() {
		return NTRU;
	}
	public void setNTRU(String nTRU) {
		NTRU = nTRU;
	}
	public String getLastShoppingTime() {
		return lastShoppingTime;
	}
	public void setLastShoppingTime(String lastShoppingTime) {
		this.lastShoppingTime = lastShoppingTime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getReasonOfLost() {
		return reasonOfLost;
	}
	public void setReasonOfLost(String reasonOfLost) {
		this.reasonOfLost = reasonOfLost;
	}
	public String getRank2() {
		return rank2;
	}
	public void setRank2(String rank2) {
		this.rank2 = rank2;
	}
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="customer")
	@Cascade(CascadeType.SAVE_UPDATE)
	@OrderBy("id asc")
	public Set<Contact> getContacts() {
		return contacts;
	}
	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	} 
	
	public void addContact(Contact contact){
		contact.setCustomer(this);
		this.contacts.add(contact);
	}
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="customer")
	@Cascade(CascadeType.SAVE_UPDATE)
	@OrderBy("createDate asc")
	public Set<OrderForm> getOrderForms() {
		return orderForms;
	}
	public void setOrderForms(Set<OrderForm> orderForms) {
		this.orderForms = orderForms;
	}
	
	public void addOrderForm(OrderForm orderForm) {
		orderForm.setCustomer(this);
		this.orderForms.add(orderForm);
	}
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="customer")
	@Cascade(CascadeType.SAVE_UPDATE)
	@OrderBy("id asc")
	public Set<Measure> getMeasures() {
		return measures;
	}
	public void setMeasures(Set<Measure> measures) {
		this.measures = measures;
	}
	public void addMeasure(Measure measure) {
		measure.setCustomer(this);
		this.measures.add(measure);
	}
	public Date getTimeOfLost() {
		return timeOfLost;
	}
	public void setTimeOfLost(Date timeOfLost) {
		this.timeOfLost = timeOfLost;
	}
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="customer")
	@Cascade(CascadeType.SAVE_UPDATE)
	@OrderBy("ctime desc")
	public Set<ContactRecord> getContactRecords() {
		return contactRecords;
	}
	public void setContactRecords(Set<ContactRecord> contactRecords) {
		this.contactRecords = contactRecords;
	}
	public void addContactRecord(ContactRecord contactRecord) {
		contactRecord.setCustomer(this);
		this.contactRecords.add(contactRecord);
	}
}




