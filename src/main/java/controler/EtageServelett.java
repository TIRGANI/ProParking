package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Etage;
import beans.Users;
import service.EtageService;
import service.UsersService;

/**
 * Servlet implementation class EtageServelett
 */
public class EtageServelett extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EtageServelett() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void methode(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String op = request.getParameter("op").toString();
		// System.out.println("op :"+op+" code : "+request.getParameter("code"));
		if (op.equals("ajou")) {

			EtageService sc = new EtageService();

			// int id = Integer.parseInt(request.getParameter("id"));
			String code = request.getParameter("code");

			Etage et = new Etage();

			et.setCode(code);
			// System.out.println(et);

			if (sc.create(et)) {
				response.sendRedirect("/pages/ui-features/etages.jsp");

			}

		}
		if (op.equals("delete")) {

			EtageService sc = new EtageService();

			int id = Integer.parseInt(request.getParameter("id"));
			Etage et = sc.findById(id);
			
			
			// System.out.println(et);

			if (sc.delete(et)) {
				response.sendRedirect("/pages/ui-features/etages.jsp");

			}

		}
		if (op.equals("update")) {

			EtageService sc = new EtageService();

			int id = Integer.parseInt(request.getParameter("id"));
			String code = request.getParameter("code");
			
			Etage et = sc.findById(id);
			et.setCode(code);
			
			

			if (sc.update(et)) {
				response.sendRedirect("/pages/ui-features/etages.jsp");

			}

		}

	}

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
		methode(request, response);
	}

}
