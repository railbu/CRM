package crm.action.cusManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import crm.model.DataLibrary;
import crm.service.DataService;

@Controller
@Scope("request")
public class DataAction extends ActionSupport implements Preparable,ModelDriven<DataLibrary> {

	private static final long serialVersionUID = 1L;
	
	@Autowired private DataService dataService;
	
	private DataLibrary data;
	private Long dataid;
	private List<DataLibrary> datalist;
	
	private String dataType;
	private String dataName;
	private String dataValue;
	private String dataRemark;
	
	//分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 10;
	
	private Map<String,Object> mp;
	
	public String list(){
		
		try{
			int count = dataService.countAll();
			pageCount = count/pageSize+(count%pageSize==0?0:1);
			
			//设置leftPage 和 nextPage
			lastPage = currentPage == 1?1:currentPage-1;
			nextPage = currentPage == pageCount?currentPage:currentPage+1;
			
			
			System.out.println("pageCount="+pageCount);
			for(int i=1;i<=pageCount;i++){
				pages.add(i);
			}
				
			datalist = dataService.findByPage((currentPage-1)*pageSize, pageSize);
			
			return "list";
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "list";
	}
	
    public String search(){
		
		try{
			int count = dataService.countByCriteria(dataType, dataName, dataValue);
			pageCount = count/pageSize+(count%pageSize==0?0:1);
			
			//设置leftPage 和 nextPage
			lastPage = currentPage == 1?1:currentPage-1;
			nextPage = currentPage == pageCount?currentPage:currentPage+1;
			
			
			System.out.println("pageCount="+pageCount);
			for(int i=1;i<=pageCount;i++){
				pages.add(i);
			}
				
			datalist =  dataService.findByCriteria(dataType, dataName, dataValue, (currentPage-1)*pageSize, pageSize);
			
			return "list";
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "list";
	}
    
    public boolean saveValidation(){
		if(StringUtils.isEmpty(data.getName()))
		{
			super.addFieldError("name","条目不能为空！");
			return false;
		}
		
		if(StringUtils.isEmpty(data.getType()))
		{
			super.addFieldError("type","类别不能为空！");
			return false;
		}
		
		if(StringUtils.isEmpty(data.getValue()))
		{
			super.addFieldError("value","值不能为空！");
			return false;
		}
		return true;
	}
    
    public String save(){
    	
    	if(!saveValidation())
			return "add";
    	
    	try{
    		System.out.println("dataRemark="+dataRemark);
    		if(this.dataRemark==null){
    			this.data.setRemark("否");
    		}else{
    			this.data.setRemark("是");
    		}
    		this.dataService.save(this.data);
    		return list();
    	}catch(Exception e){
    		e.printStackTrace();
			System.out.println(e.getMessage());
    	}
    	return list();
    }
    
    public String edit(){
    	try{
    		this.data = this.dataService.findDataById(dataid);
    		if(data.getRemark().equals("否"))
    		{
    			super.addFieldError("no", "该条目不可被编辑");
    			return list();
    		}
    	}catch(Exception e){
    		e.getMessage();
			e.printStackTrace();
    	}
    	return "edit";
    }
    
    public String delete(){
    	try{
    		dataService.delete(dataid);
    		return list();
    	}catch(Exception e){
    		e.printStackTrace();
			System.out.println(e.getMessage());
    	}
    	return list();
    }
    
    //自动补全用的返回Json的方法 该方法没有成功 见下面第二个方法
    public String findReg(){
    	String term = "";
    	try {
			term = new String(ServletActionContext.getRequest().getParameter("term").getBytes("ISO8859-1"),"UTF-8");
			System.out.println("term"+term);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("从URL获取数据出错"+e.getMessage());
		}
    	
    	mp = new HashMap<String,Object>();
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
//    	List<String> list = new ArrayList<String>();
    	List<String> types = null;
    	try{
    		types = dataService.findAllType();
    	}catch(Exception e){
    		System.out.println(e.getMessage());
    		e.printStackTrace();
    	}
    	
    	int count = 0;
    	System.out.println("大小"+types.size());
    	for(int i = 0;i < types.size();i++){
    		System.out.println("type"+i+types.get(i));
    		
    		String tt = types.get(i);
    		if(tt.contains(term)){
    			Map<String,Object> tmp = new HashMap<String,Object>();
    			tmp.put("id", count);
    			tmp.put("name", tt);
    			list.add(tmp);
    			count++;
    		}
    	}
    	System.out.println("count"+count);
    	mp.put("rows", list);
    	mp.put("totalCont", count);
    	return "success";
    }
    
    public String findReg2(){
    	String term = "";
    	try {
			term = new String(ServletActionContext.getRequest().getParameter("term").getBytes("ISO8859-1"),"UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("从URL获取数据出错"+e.getMessage());
		}
    	
    	List<String> types = null;
    	try{
    		types = dataService.findAllType();
    	}catch(Exception e){
    		System.out.println(e.getMessage());
    		e.printStackTrace();
    	}
    	String res = "[";
    	int cnt = 0;
    	for(int i=0;i<types.size();i++){
    		String ts = types.get(i);
    		if(ts.contains(term)){
	    		if(cnt != 0)    		
	    			res += (",\""+ts+"\"");
	    		else
	    			res += ("\""+ts+"\"");
	    		cnt++;
    		}
    	}
    	res += "]";
    	
    	HttpServletResponse hsr = ServletActionContext.getResponse();
    	PrintWriter pw = null;
    	
		try {
			hsr.setHeader("Content-type", "text/html;charset=UTF-8");  
			hsr.setCharacterEncoding("UTF-8"); 
			pw = hsr.getWriter();
			pw.write(res);
	    	pw.flush();
	    	pw.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("向外写入数据出错");
			e.printStackTrace();
		}
    	
    	return null;
    }
    
    public List<DataLibrary> getDatalist(){
    	return datalist;
    }
    
    public DataLibrary getData(){
    	return data;
    }
    
    
	@Override
	public DataLibrary getModel() {
		// TODO Auto-generated method stub
		return this.data;
	}
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		prepareModel();
	}
	private void prepareModel(){
		if(this.dataid != null)
			this.data = this.dataService.getDataLibrary(dataid);
		else
			this.data = new DataLibrary();
	}

	public Long getDataid() {
		return dataid;
	}

	public void setDataid(Long dataid) {
		this.dataid = dataid;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getDataValue() {
		return dataValue;
	}

	public void setDataValue(String dataValue) {
		this.dataValue = dataValue;
	}

	public List<Integer> getPages() {
		return pages;
	}

	public void setPages(List<Integer> pages) {
		this.pages = pages;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getDataRemark() {
		return dataRemark;
	}

	public void setDataRemark(String dataRemark) {
		this.dataRemark = dataRemark;
	}

	public Map<String,Object> getMp() {
		return mp;
	}

	public void setMp(Map<String,Object> mp) {
		this.mp = mp;
	}

	
}
