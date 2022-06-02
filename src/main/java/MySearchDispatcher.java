import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Util.City;
import Util.CityInfoParser;

import java.io.IOException;
import java.io.Serial;
import java.util.ArrayList;
import java.util.List;
/**
 * Servlet implementation class SearchDispatcher
 */

@WebServlet("/MySearchDispatcher")
public class MySearchDispatcher extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public MySearchDispatcher() {
    	
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext servletContext = getServletContext();
        // TODO get json file as stream, Initialize FakeYelpAPI by calling its initalize
        // method
    }
    

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO
    	response.setContentType("text/html");
		String cityName = request.getParameter("cityName");
		// store search criterias, all should be string
		HttpSession session = request.getSession(); // if we need to getSession or not
		session.setAttribute("searchBy", cityName);
		
		if (session.getAttribute("fileRead") == null || CityInfoParser.records.size() == 0) {
			CityInfoParser.readFiles();
			session.setAttribute("fileRead", true);
		}
		
		List<City> validCities = new ArrayList<City>();
		validCities = CityInfoParser.getCities(cityName);
		// System.out.print(validCities);
		session.setAttribute("searchResult", validCities);
		session.setAttribute("resultSize", validCities.size());
		// System.out.println(validCities.size());
		request.getRequestDispatcher("/search.jsp").include(request, response);
    }
    
    public void destroy() {
        // do nothing.
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}