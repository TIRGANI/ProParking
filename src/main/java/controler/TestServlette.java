package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Section;

import service.SectionService;

public class TestServlette extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SectionService sc = new SectionService();

	public TestServlette() {
		super();
		// TODO Auto-generated constructor stub
	}

//
	protected void methode(HttpServletRequest request, HttpServletResponse response) {
		String op = request.getParameter("op").toString();

		if (op != null) {
			if (op.equals("ajouter")) {
				String code = request.getParameter("code").toString();
				int idetage =Integer.parseInt(request.getParameter("etage"));
				Section s = new Section(code,idetage);
				//System.out.println(sc.findAll().toString());
				int cpt = 0;
				for (Section cc : sc.findAll()) {
					if (cc.getCode().toString().equals(code.toString())) {
						cpt++;
					}
				}
				if (cpt == 0) {
					if (sc.create(s)) {

						try {
							response.sendRedirect("/pages/ui-features/section.jsp");
						} catch (IOException e) {

							e.printStackTrace();
						}
					} else {
						// response.getWriter().print("Erreur Section Non Enregistrer !!! ");
					}
				} else {
					try {
						response.getWriter().print("Erreur Section Non Enregistrer Section déjat existes !!! ");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			} else if (op.equals("delete")) {
				// System.out.println(op);
				int id = Integer.parseInt(request.getParameter("id"));
				sc.delete(sc.findById(id));
				try {
					response.sendRedirect("/pages/ui-features/section.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (op.equals("update")) {
				// System.out.println(op);
				int id = Integer.parseInt(request.getParameter("id"));
				Section s = sc.findById(id);
				try {
					response.sendRedirect("/pages/ui-features/section.jsp?op=ip&id=" + s.getId()
							+ "&code=" + s.getCode());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//logout
			else if (op.equals("logout")) {
				HttpSession session;
				session = request.getSession();
				session.removeAttribute("user");
				session.invalidate();
	            session=null;
				try {
					response.sendRedirect("/Login.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//
			 else if (op.equals("modpro")) {
				 
					if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
						int id = Integer.parseInt(request.getParameter("id"));
						String code = request.getParameter("code");
						int idetage =Integer.parseInt(request.getParameter("etage"));
						Section sf = sc.findById(id);
						sf.setCode(code);
						sf.setEtage(idetage);
						//System.out.println(sf.toString());
						if (sc.update(sf)) {
							try {
								response.sendRedirect("/pages/ui-features/section.jsp");
							} catch (IOException e) {

								e.printStackTrace();
							}
						}

					}

				}
			//
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// processRequest(request, response);
		methode(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		methode(request, response);
	}

}
