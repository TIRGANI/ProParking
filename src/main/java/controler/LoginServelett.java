package controler;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import beans.AfficherPlace;
import beans.Place;
import beans.Section;
import beans.Users;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import service.SectionService;
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
				response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/Parking.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (cpt == 0) {
			int msg = 0;
			try {
				response.sendRedirect("/TIRGANI_parking_V00/Login.jsp?msg=" + msg);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/*
	 * public void users(HttpServletRequest request, HttpServletResponse response) {
	 * String op = request.getParameter("op"); UsersService sc = new UsersService();
	 * if (op != null) { if (op.equals("update")) { //
	 * response.sendRedirect("/TIRGANI_parking_V00/Login.jsp");
	 * 
	 * if (request.getParameter("id") != null &&
	 * !request.getParameter("id").equals("")) { int id =
	 * Integer.parseInt(request.getParameter("id")); String log =
	 * request.getParameter("login"); String email = request.getParameter("email");
	 * String pass = request.getParameter("password"); String role =
	 * request.getParameter("role"); Users sf = sc.findById(id); sf.setLogin(login);
	 * sf.setEmail(email); sf.setPassword(password); sf.setRole(role); session =
	 * request.getSession(); session.setAttribute("user", sf); //
	 * System.out.println(sf.toString()); if (sc.update(sf)) { //
	 * response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/section.jsp");
	 * // response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/Users.jsp");
	 * //
	 * response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/section.jsp");
	 * 
	 * }
	 * 
	 * } } } }
	 */
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		methode(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
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
				//session = request.getSession();
				//session.setAttribute("user", sf);
				// System.out.println(sf.toString());
				if (sc.update(sf)) {
					// response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/section.jsp");
					 response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/Users.jsp");
					// response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/section.jsp");

				}

			}
		}
		else if (request.getParameter("op") != null && request.getParameter("op").equals("ajou")) {
			
			UsersService sc = new UsersService();
			
			//	int id = Integer.parseInt(request.getParameter("id"));
				String log = request.getParameter("login");
				String email = request.getParameter("email");
				String pass = request.getParameter("password");
				String role = request.getParameter("role");
				Users sf = new Users(log,email,pass,role);
				//System.out.println("sf");
				//session = request.getSession();
				//session.setAttribute("user", sf);
				// System.out.println(sf.toString());
			//	System.out.println(sf);
				if (sc.create(sf)) {
				//	System.out.println(sf);
					// response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/section.jsp");
					 response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/Users.jsp");
					// response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/section.jsp");

				}

			
		}
		else if (request.getParameter("op") != null && request.getParameter("op").equals("delete")) {
		//System.out.println(request.getParameter("op"));
			UsersService sc = new UsersService();
			if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
				int id = Integer.parseInt(request.getParameter("id"));
				Users sf = sc.findById(id);
			//	 System.out.println(id);
				if (sc.delete(sf)) {
					//System.out.println("bie n delt");
					// response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/section.jsp");
					 response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/Users.jsp");
					// response.sendRedirect("/TIRGANI_parking_V00/pages/ui-features/section.jsp");

				}

			}
		}
		else methode(request, response);
	}

}
