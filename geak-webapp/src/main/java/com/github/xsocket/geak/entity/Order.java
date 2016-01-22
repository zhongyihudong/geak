package com.github.xsocket.geak.entity;

import java.util.Date;
import java.util.List;

/**
 * 极客业务订单实体，表示极客业务的一次接待。
 * 
 * @author MWQ
 */
public class Order extends AbstractEntity {

  private static final long serialVersionUID = -2524184861533136798L;
  
  /** 关联的预约信息 */
  protected Appointment appointment = new Appointment();
  /** 进场时间 */
  protected Date entranceDatetime;
  /** 退场时间 */
  protected Date exitDatetime;
  /** 订单客户 */
  protected Customer customer;
  /** 订单客户类型，青年、少年、老年... */
  protected String customerType;
  /** 订单客户总人数 */
  protected Integer customerCount;
  /** 订单状态 */
  protected String state;
  /** 订单业务 */
  protected Business business;
  /** 订单所属公司(门店) */
  protected Company company;
  /** 该订单参与的活动 */
  protected List<OrderPromotion> promotions;
  /** 该订单的支付记录 */
  protected List<OrderPayment> payments;

  public Appointment getAppointment() {
    return appointment;
  }

  public void setAppointment(Appointment appointment) {
    this.appointment = appointment;
  }

  public Date getEntranceDatetime() {
    return entranceDatetime;
  }

  public void setEntranceDatetime(Date entranceDatetime) {
    this.entranceDatetime = entranceDatetime;
  }

  public Date getExitDatetime() {
    return exitDatetime;
  }

  public void setExitDatetime(Date existDatetime) {
    this.exitDatetime = existDatetime;
  }

  public Customer getCustomer() {
    return customer;
  }

  public void setCustomer(Customer customer) {
    this.customer = customer;
  }

  public String getCustomerType() {
    return customerType;
  }

  public void setCustomerType(String customerType) {
    this.customerType = customerType;
  }

  public Integer getCustomerCount() {
    return customerCount;
  }

  public void setCustomerCount(Integer customerCount) {
    this.customerCount = customerCount;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

  public Business getBusiness() {
    return business;
  }

  public void setBusiness(Business business) {
    this.business = business;
  }

  public Company getCompany() {
    return company;
  }

  public void setCompany(Company company) {
    this.company = company;
  }

  public List<OrderPromotion> getPromotions() {
    return promotions;
  }

  public void setPromotions(List<OrderPromotion> promotions) {
    this.promotions = promotions;
  }

  public List<OrderPayment> getPayments() {
    return payments;
  }

  public void setPayments(List<OrderPayment> payments) {
    this.payments = payments;
  }

}