package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.domain.LoginDAO;
import model.domain.LoginService;
import model.domain.datainfo.LoginDTO;


@WebServlet("/login")
public class LoginController extends HttpServlet {
    public LoginController() {
        super();
    }
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	process(request, response);
    }

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		signup(request,response);
//		String command = request.getParameter("command");
//		
//		if(command.equals("signup")) {
//			signup(request,response);
//		}
	}
	public void signup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("1234");
		String url = "showError.jsp";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");	
//		String root = request.getParameter("root");	
//		String aggre = request.getParameter("aggre");	
		
		LoginDTO login = new LoginDTO(id,pw,email);
		
		try {
			request.setAttribute("probonoProjectAll", LoginDAO.addLogin(login));
			url = "index.html";
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
			s.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	

}
