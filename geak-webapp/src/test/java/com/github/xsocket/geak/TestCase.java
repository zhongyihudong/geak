package com.github.xsocket.geak;

import java.math.BigDecimal;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.github.xsocket.geak.entity.Business;
import com.github.xsocket.geak.entity.Company;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:spring/test/mybatis-test-context.xml",
  "classpath:spring/jdbc/transaction-context.xml", "classpath:spring/jdbc/mybatis-context.xml" }) // 加载配置文件
public class TestCase {

  @Test
  public void test() {
    System.err.println(String.format("前边的 %d 后边的", new BigDecimal(12345.1231).intValue()));
    
    Company c = new Company();
    c.setId(1);
    c.setName("company");
    
    Business b = new Business();
    b.setId(2);
    b.setName("business");
    b.setCompany(c);
    
    System.err.println(JSON.toJSONString(b));
  }
}