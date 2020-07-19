package com.quanyou.utility;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.quanyou.po.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		//执行完毕返回前拦截
		}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		//处理过程中执行拦截
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		//在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
				//返回false则不执行拦截
		//获取request.getSession().setAttribute()的值是：
		//request.getSession().getAttribute("属性名称"); 
        User u=(User) request.getSession().getAttribute("user");
        if(u==null) {
        	//登录失败，跳转到登录页
			response.sendRedirect(request.getContextPath());
			System.out.println("你的请求被拦截了，请先登录...");
			return false;
        }else {
        	//登陆成功，不拦截
			return true;
        }
	


	}

}
