package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import beans.Place;
import beans.Section;
import beans.AfficherPlace;
import beans.Etage;
import service.EtageService;
import service.PlaceService;
import service.SectionService;

public class PlaceServellet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PlaceService ps = new PlaceService();

	public PlaceServellet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void methode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//
		String op = request.getParameter("op").toString();

		if (op != null) {
			// ajouter place a l'aide de ajax
			if (op.equals("ajouter")) {
				String Numéro = request.getParameter("numero").toString();
				String Type = request.getParameter("type").toString();
				int idsection = Integer.parseInt(request.getParameter("section").toString());
				Place s = new Place(Numéro, Type, idsection);
				int cpt = 0;
				for (Place cc : ps.findAll()) {
					if (cc.getNumero().toString().equals(Numéro.toString())) {
						cpt++;
					}
				}

				// test d'existence de place
				if (cpt == 0) {
					if (ps.create(s)) {

						JSONObject simplejp = new JSONObject();
						response.setContentType("application/json");
						List<Place> placess = ps.findAll();
						Gson json = new Gson();
						response.getWriter().print(json.toJson(placess));
					} else {
					}
				} else {
					try {
						response.getWriter().print("Erreur Place Non Enregistrer Place déjat existes !!! ");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

				// supprimer place
			} else if (op.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				ps.delete(ps.findById(id));
				try {
					response.sendRedirect("/pages/ui-features/Place.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
				//
			} else if (op.equals("update")) {
				int id = Integer.parseInt(request.getParameter("id"));
				Place s = ps.findById(id);
				try {
					response.sendRedirect("/pages/ui-features/Place.jsp?op=ip&id=" + s.getId() + "&numero="
							+ s.getNumero() + "&type=" + s.getType() + "&section=" + s.getIdsection());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			else if (op.equals("modpro")) {

				if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {

					int id = Integer.parseInt(request.getParameter("id"));
					String Numero = request.getParameter("numero");
					String type = request.getParameter("type");
					String section = request.getParameter("section");
					Place pl = ps.findById(id);
					pl.setNumero(Numero);
					pl.setType(type);
					pl.setIdsection(Integer.parseInt(section));
					if (ps.update(pl)) {
						JSONObject simplejp = new JSONObject();
						response.setContentType("application/json");
						List<Place> placess = ps.findAll();
						Gson json = new Gson();
						response.getWriter().print(json.toJson(placess));
					}

				}

			} else if (op.equals("etat")) {
				int id = Integer.parseInt(request.getParameter("id"));
				Place pl = ps.findById(id);
				if (pl.getEtat().equals("Occupee")) {
					pl.setEtat("Vide");
				} else {
					pl.setEtat("Occupee");
				}
				if (ps.update(pl)) {

					JSONObject simplejp = new JSONObject();
					response.setContentType("application/json");
					List<Place> placess = ps.findAll();
					Gson json = new Gson();
					response.getWriter().print(json.toJson(placess));
				}
			}
			// affcicher etage pour graph etage
			else if (op.equals("parckM")) {
				EtageService sc = new EtageService();
				List<Etage> etages = sc.findAll();

				JSONArray arr = new JSONArray();
				for (Etage et : etages) {
					arr.add(et.getCode());
				}

				JSONObject simplejp = new JSONObject();
				response.setContentType("application/json");

				Gson json = new Gson();
				// System.out.println(json.toJson(arr));
				response.getWriter().print(json.toJson(arr));

			}

			// affiche section pour graph section
			else if (op.equals("parck")) {
				SectionService sc = new SectionService();
				List<Section> sections = sc.findAll();

				JSONArray arr = new JSONArray();
				for (Section sect : sections) {
					arr.add(sect.getCode());
				}

				JSONObject simplejp = new JSONObject();
				response.setContentType("application/json");

				Gson json = new Gson();
				// System.out.println(json.toJson(arr));
				response.getWriter().print(json.toJson(arr));

			}
			// afficher l'etat d'occupation pour chaque section
			else if (op.equals("parckpro")) {
				JSONArray arr = new JSONArray();
				SectionService ms = new SectionService();
				List<Section> sectionss = ms.findAll();
				EtageService mss = new EtageService();

				List<Etage> etages = mss.findAll();

				for (Section section : sectionss) {
					int etat = 0;
					int cpt = 0;
					
						PlaceService pss = new PlaceService();
						List<Place> places = ps.findAll();

						for (Place p : places) {
							if (p.getIdsection() == section.getId()) {
								cpt++;
								if (p.getEtat().equals("Occupee")) {
									etat++;
								}
							}
						}
						if (cpt == 0) {
							arr.add(0);
						}

						else {
							arr.add(etat * 100 / cpt);
							
						}

					}
				//System.out.println(arr);
				JSONObject simplejp = new JSONObject();
				response.setContentType("application/json");

				Gson json = new Gson();
				// System.out.println("nbr place par chaque section : " + json.toJson(arr));
				response.getWriter().print(json.toJson(arr));

			}
			// afficher etat d'occupation pour chaque Etage
			else if (op.equals("parkEtage")) {

				JSONArray arr = new JSONArray();
				SectionService ms = new SectionService();
				List<Section> sectionss = ms.findAll();
				EtageService mss = new EtageService();

				List<Etage> etages = mss.findAll();
				for (Etage etage : etages) {

					int etat = 0;
					int cpt = 0;
					
					for (Section section : sectionss) {

						if (section.getEtage() == etage.getId()) {
							PlaceService pss = new PlaceService();
							List<Place> places = ps.findAll();

							for (Place p : places) {
								if (p.getIdsection() == section.getId()) {
									cpt++;
									if (p.getEtat().equals("Occupee")) {
										etat++;
									}
								}
							}

						}

					}
					
					if (cpt == 0) {
						arr.add(0);
					}
					
					else {
						arr.add(etat * 100 / cpt);
					}

				}

				JSONObject simplejp = new JSONObject();
				response.setContentType("application/json");

				Gson json = new Gson();
				// System.out.println("nbr place par chaque section : " + json.toJson(arr));
				response.getWriter().print(json.toJson(arr));

			}
// tafficher graphe pour etat du parking
			else if (op.equals("parcketatrest")) {
				SectionService sc = new SectionService();
				List<Section> sections = sc.findAll();
				PlaceService ps = new PlaceService();
				JSONArray arr = new JSONArray();
				//
				SectionService ms = new SectionService();
				int cpt = 0;
				int etat = 0;
				List<Section> sectionss = ms.findAll();
				for (Section section : sectionss) {

					List<Place> places = ps.findAll();

					for (Place p : places) {
						if (p.getIdsection() == section.getId()) {
							cpt++;
							if (p.getEtat().equals("Occupee")) {
								etat++;
							}
						}
					}

				}

				JSONObject simplejp = new JSONObject();
				response.setContentType("application/json");

				Gson json = new Gson();

				response.getWriter().print(json.toJson(etat));

			}
//
			else if (op.equals("parcketat")) {
				SectionService sc = new SectionService();
				List<Section> sections = sc.findAll();
				PlaceService ps = new PlaceService();
				JSONArray arr = new JSONArray();
				//
				SectionService ms = new SectionService();
				int cpt = 0;
				int etat = 0;
				List<Section> sectionss = ms.findAll();
				for (Section section : sectionss) {

					List<Place> places = ps.findAll();

					for (Place p : places) {
						if (p.getIdsection() == section.getId()) {
							cpt++;

							etat++;

						}
					}

				}
				JSONObject simplejp = new JSONObject();
				response.setContentType("application/json");

				Gson json = new Gson();

				response.getWriter().print(json.toJson(etat));

			}
//
			else if (op.equals("trier")) {

				JSONObject simplejp = new JSONObject();
				response.setContentType("application/json");
				SectionService sc = new SectionService();
				List<Place> placess = ps.findAll();
				List<AfficherPlace> aff = new JSONArray();
				for (Place place : ps.findAll()) {
					AfficherPlace g = new AfficherPlace();
					g.setId(place.getId());
					g.setNumero(place.getNumero());
					g.setType(place.getType());
					g.setEtat(place.getEtat());
					for (Section sg : sc.findAll()) {
						if (place.getIdsection() == sg.getId()) {
							g.setIdsection(sg.getCode());
						}
					}
					aff.add(g);
				}
				Gson json = new Gson();

				response.getWriter().print(json.toJson(aff));
			}
		}
		//
	}

	//
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		methode(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		methode(request, response);
	}
}
