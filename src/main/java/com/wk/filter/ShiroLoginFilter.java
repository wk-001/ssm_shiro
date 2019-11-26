package com.wk.filter;

import com.alibaba.fastjson.JSON;
import com.wk.utils.ResultObj;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class ShiroLoginFilter extends FormAuthenticationFilter {
	
	/**
	 * 如果用户未登陆就回调这个方法
	 * 在请求controller之前判断是否登录，返回json，不进行重定向
	 */
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		//如果是ajax请求就返回json
		HttpServletResponse resp=(HttpServletResponse) response;
		//if(isAjax(request)){
			ResultObj resultObj = ResultObj.UNLOGIN;
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			PrintWriter out = resp.getWriter();
			out.write(JSON.toJSONString(resultObj));
			out.flush();
			out.close();
		/*}else{
			//非ajax请求重定向到登录页面
			resp.sendRedirect("/login/toLogin");
		}*/

		return false;
	}

	private boolean isAjax(ServletRequest request){
		String header = ((HttpServletRequest)request).getHeader("X-Requested-With");
		if("XMLHttpRequest".equalsIgnoreCase(header)){
			return true;
		}
		return false;
	}
}
