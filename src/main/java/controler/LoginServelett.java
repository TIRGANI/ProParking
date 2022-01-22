
package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Users;
import service.UsersService;

/**
 * Servlet implementation class LoginServelett
 */

public class LoginServelett extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServelett() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void methode(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		Users currentus = new Users();
		UsersService us = new UsersService();
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		int cpt = 0;
		for (Users user : us.findAll()) {
			if (user.getLogin().equals(login) && user.getPassword().equals(password)) {
				session = request.getSession();
				currentus = us.findByLogin(login);
				currentus.setEtat("1");
				us.update(currentus);
				// System.out.println(currentus);
				cpt++;
				session.setAttribute("user", currentus);

			}
		}
		if (cpt > 0) {
			try {
				response.sendRedirect("/pages/ui-features/Parking.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (cpt == 0) {
			int msg = 0;
			try {
				response.sendRedirect("/Login.jsp?msg=" + msg);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				methode(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("op") != null && request.getParameter("op").equals("update")) {
		
			UsersService sc = new UsersService();
			if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
				int id = Integer.parseInt(request.getParameter("id"));
				String log = request.getParameter("login");
				String email = request.getParameter("email");
				String pass = request.getParameter("password");
				String role = request.getParameter("role");
				Users sf = sc.findById(id);
				sf.setLogin(log);
				sf.setEmail(email);
				sf.setPassword(pass);
				sf.setRole(role);
				if (sc.update(sf)) {
						 response.sendRedirect("/pages/ui-features/Users.jsp");
	
				}

			}
		}
		else if (request.getParameter("op") != null && request.getParameter("op").equals("ajou")) {
			
			UsersService sc = new UsersService();
			
				String log = request.getParameter("login");
				String email = request.getParameter("email");
				String pass = request.getParameter("password");
				String role = request.getParameter("role");
				Users sf = new Users(log,email,pass,role);
					if (sc.create(sf)) {
					 response.sendRedirect("/pages/ui-features/Users.jsp");
	
				}

			
		}
		else if (request.getParameter("op") != null && request.getParameter("op").equals("delete")) {
			UsersService sc = new UsersService();
			if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
				int id = Integer.parseInt(request.getParameter("id"));
				Users sf = sc.findById(id);
				if (sc.delete(sf)) {
					 response.sendRedirect("/pages/ui-features/Users.jsp");
		
				}

			}
		}
		else methode(request, response);
	}

}
