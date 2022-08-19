package com.koreate.betty.domain.member.resolver;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.koreate.betty.domain.member.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginArgumentResolver implements HandlerMethodArgumentResolver {
	
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		log.info("**Call** class = {}, method = {}",getClass().getName(),"supportsParameter");
		
		boolean hasTestAnnotation = parameter.hasParameterAnnotation(Login.class);
		boolean hasMemberType = Member.class.isAssignableFrom(parameter.getParameterType());
		
		return hasTestAnnotation && hasMemberType;
	}
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		log.info("**Call** class = {}, method = {}",getClass().getName(),"resolveArgument");
		HttpServletRequest request = (HttpServletRequest)webRequest.getNativeRequest();
		Member vo = Member.builder().build();
		return vo;
	}
}