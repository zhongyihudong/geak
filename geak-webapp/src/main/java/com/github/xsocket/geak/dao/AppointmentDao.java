package com.github.xsocket.geak.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.github.xsocket.dao.BasicDao;
import com.github.xsocket.dao.BasicRelationDao;
import com.github.xsocket.dao.Pagination;
import com.github.xsocket.geak.entity.Appointment;
import com.github.xsocket.geak.entity.Business;

/**
 * 预约业务的数据访问对象。
 * 
 * @author MWQ
 */
@Repository
public interface AppointmentDao extends BasicDao<Appointment, Integer>, BasicRelationDao<Appointment, Business> {
  
  List<Appointment> selectByCompany(
      @Param("companyId") Integer companyId, 
      @Param("start") Date start,
      @Param("end") Date end, 
      Pagination page);
  
  List<Appointment> selectByBusiness(
      @Param("companyId") Integer companyId, 
      @Param("start") Date start,
      @Param("end") Date end, 
      @Param("business") Integer[] business,
      Pagination page);

}