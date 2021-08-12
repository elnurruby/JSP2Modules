package com.company.resume;

import com.company.bean.*;
import dao.inter.*;
import main.dao.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.*;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    UserDaoInter userDao = Context.instanceUserDAO();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email =request.getParameter("email");
        String password =request.getParameter("password");
        User u = userDao.getUserByEmailAndPassword(email,password);
        if (u==null){
            response.sendRedirect("error?msg=UserNotFound");
        }else{
            request.getSession().setAttribute("loggedInUser",u);
            response.sendRedirect("users");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
}
