package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateNoteServlet
 */
public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content  = request.getParameter("content");
			int id = Integer.parseInt(request.getParameter("note_id"));
			
			Session s = FactoryProvider.getfactory().openSession();
			
			Transaction tx =  s.beginTransaction();
			Note n = (Note)s.get(Note.class, id);
			n.setTitle(title);
			n.setContent(content);
			s.save(n);
			tx.commit();
	
			System.out.println(content +" " + title);
			System.out.println("Successful");
			s.close();
			response.setContentType("text/html");
			PrintWriter print = response.getWriter();
//			out.println("<h1>Note added Successfully!</h1>");
	        print.println("<h1 style='text-align:center'>Note Updated Successfully!</h1>");
	        print.println("<h1 style='text-align:center'><a href= 'showNotes.jsp'>View All Notes</a></h1>");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
