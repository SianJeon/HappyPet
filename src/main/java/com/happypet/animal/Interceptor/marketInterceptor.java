package com.happypet.animal.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class marketInterceptor implements HandlerInterceptor {
  
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requsetURL = request.getRequestURL().toString();
//        System.out.println(requsetURL);
        HttpSession session =  request.getSession();
        
        String gotoLoginPage = "/login";
        request.setAttribute("acVo", session.getAttribute("loginUser"));

        if(session.getAttribute("loginUser") == null)
        {
        	if(requsetURL.contains("/market/cart"))
        	{
                System.out.println("pre Handle faild _cart checked session");
                response.sendRedirect(gotoLoginPage);
        	}
            else if(requsetURL.contains("/market/order"))
            {
                System.out.println("pre Handle faild _order checked session");
                response.sendRedirect(gotoLoginPage);
            }
            else if(requsetURL.contains("/market/order"))
            {
                response.sendRedirect(gotoLoginPage);
            }
            else if(requsetURL.contains("/market/orderList"))
            {
                response.sendRedirect(gotoLoginPage);
            }
            return false;
        }
        else
        {
            System.out.println("pre Handle success _ ");
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)throws Exception {
            
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }

    
	
}
