package com.wk.filter;

import com.alibaba.fastjson.JSON;
import com.wk.utils.ResultObj;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class ShiroLoginFilter extends FormAuthenticationFilter {
	
	/**
	 * 如果用户未登陆就回调这个方法
	 */
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		HttpServletResponse resp=(HttpServletResponse) response;
		ResultObj resultObj = ResultObj.UNLOGIN;
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter out = resp.getWriter();
		out.write(JSON.toJSONString(resultObj));
		out.flush();
		out.close();
		return false;
	}
}
