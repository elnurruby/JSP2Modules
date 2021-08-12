package com.company.resume;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.*;
@WebFilter(filterName = "JSPFileFilter",urlPatterns = {"*"})
public class SecurityFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        try {
            if (!request.getRequestURI().contains("/login") && request.getSession().getAttribute("loggedInUser") == null) {
                response.sendRedirect("login");
            } else {
                chain.doFilter(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
