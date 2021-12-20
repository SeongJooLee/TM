package com.hk.tm;


import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
 
@Service
public class KakaoPay {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
    public String kakaoPayReady(String title, String name, String headCount, String price) {
 
//    	String headCountStr = Integer.toString(headCount);
//    	String priceStr = Integer.toString(price);
        RestTemplate restTemplate = new RestTemplate();
        
        System.out.println("받은 값 : "+title+"|||"+name+"|||"+headCount+"|||"+price);
        
        // 서버로 요청할 Header
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK" + " b35936c88d90573a13525f1103fdde5f");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "관리자");
        params.add("partner_user_id", "이성주");
        params.add("item_name", title);
        params.add("quantity", headCount);
        params.add("total_amount", price);
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8888/tm/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8888/tm/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8888/tm/kakaoPaySuccessFail");
 
        

        
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
        	kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    @ResponseBody
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
 
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "b35936c88d90573a13525f1103fdde5f");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "관리자");
        params.add("partner_user_id","이성주");
        params.add("pg_token", pg_token);
        
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            System.out.println("여기 들어왓어? 1");
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            
            System.out.println("여기 들어왓어? 2");
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
        	System.out.println("오류1번실행");
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
        	System.out.println("오류2번실행");
            e.printStackTrace();
        }
        
        return null;
    }
    
}
 

