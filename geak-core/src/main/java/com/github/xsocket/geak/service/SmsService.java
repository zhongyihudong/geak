package com.github.xsocket.geak.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

@Service
public interface SmsService {

  @Transactional
  JSONObject sendSms(String mobile, String content);
  
  @Transactional
  Integer sendCaptcha(String mobile);
  
  @Transactional
  Integer fetchCaptcha(String mobile);
  
  @Transactional
  boolean verifyCaptcha(String mobile, int captcha);
}
