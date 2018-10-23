package login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String check = request.getParameter("check");
		String url = request.getParameter("url");
		
		PrintWriter out = response.getWriter();
		
		
		
		if(id!=null && pwd!=null && id.equals("ssy") && pwd.equals("11")) {
			
			if(check!=null&&check.equals("on")) {
				Cookie cookie_id = new Cookie("cookie_id", id);
				Cookie cookie_check = new Cookie("cookie_check", "checked");
				
				response.addCookie(cookie_id);
				response.addCookie(cookie_check);
			
			}
			else {
				System.out.println("여기1");
				Cookie cookie_id = new Cookie("cookie_id", "");
				Cookie cookie_check = new Cookie("cookie_check", "");
				
				cookie_id.setMaxAge(0);
				cookie_check.setMaxAge(0);
				
				response.addCookie(cookie_id);
				response.addCookie(cookie_check);
				
			}
			request.getSession().setAttribute("power", "user");
			response.sendRedirect(url);
		}else {
			
			System.out.println("여기2");
			Cookie cookie_id = new Cookie("cookie_id", "");
			Cookie cookie_check = new Cookie("cookie_check", "");
			
			cookie_id.setMaxAge(0);
			cookie_check.setMaxAge(0);
			
			response.addCookie(cookie_id);
			response.addCookie(cookie_check);
			
			response.sendRedirect("board.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
