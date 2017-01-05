package org.springside.examples.quickstart.service.xmlconfig;                                                        
                                                                                                                     
import java.util.ArrayList;                                                                                          
import java.util.Date;                                                                                               
import java.util.List;                                                                                               
                                                                                                                     
import org.junit.Before;                                                                                             
import org.junit.Test;                                                                                               
import org.mockito.InjectMocks;                                                                                      
import org.mockito.MockitoAnnotations;                                                                               
//import org.springside.examples.quickstart.data.UserData;                                                             
import org.springside.examples.quickstart.entity.XmlConfig;                                                          
import org.springside.examples.quickstart.entity.XmlConfigDetail;                                                    
import org.springside.examples.quickstart.service.configXml.XmlConfigService;                                        
                                                                                                                     
public class XmlConfigServiceTest {                                                                                  
	@InjectMocks                                                                                                       
	private XmlConfigService xmlConfigService;                                                                         
	                                                                                                                   
	@Before                                                                                                            
	public void setUp() {                                                                                              
		MockitoAnnotations.initMocks(this);                                                                            
	}                                                                                                                  
	                                                                                                                   
	@Test                                                                                                              
	public void save(){                                                                                                
		XmlConfig entity = new XmlConfig();                                                                            
		entity.setCreateDate(new Date());                                                                              
		entity.setDescription("描述");                                                                                 
		entity.setTitle("标题");                                                                                       
		entity.setUpdateDate(new Date());                                                                              
		//entity.setUser(UserData.randomNewUser());                                                                      
		List<XmlConfigDetail> detail = new ArrayList<XmlConfigDetail>();                                               
		XmlConfigDetail it = new XmlConfigDetail();                                                                    
		it.setStepName("步骤1");                                                                                       
		it.setDescription("步骤一备注");                                                                               
		it.setOrderNum(1);                                                                                             
		it.setRequestContent("<a>sss</a>");                                                                            
		it.setResponseContent("<b>sfds</b>");                                                                          
		detail.add(it);                                                                                                
		                                                                                                               
		it = new XmlConfigDetail();                                                                                    
		it.setStepName("步骤1");                                                                                       
		it.setDescription("步骤一备注");                                                                               
		it.setOrderNum(1);                                                                                             
		it.setRequestContent("<a>sss</a>");                                                                            
		it.setResponseContent("<b>sfds</b>");                                                                          
		detail.add(it);                                                                                                
		                                                                                                               
		entity.setDetail(detail);                                                                                      
		                                                                                                               
		xmlConfigService.saveXmlConfig(entity);                                                                      
	}                                                                                                                  
}                                                                                                                    
