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


public class SaveNoteServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SaveNoteServlets() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content  = request.getParameter("content");
			
			Session s = FactoryProvider.getfactory().openSession();
			
			Transaction tx =  s.beginTransaction();
			Note n = new Note(  title,content,new Date());
			s.save(n);
			tx.commit();
//			Note n1 = (Note)s.get(Note.class, n.getId());
//			System.out.println(n1.getTitle());
			 
			System.out.println(content +" " + title);
			
			
			System.out.println("Successful");
			
			s.close();
			response.setContentType("text/html");
			PrintWriter print = response.getWriter();
//			out.println("<h1>Note added Successfully!</h1>");
	        print.println("<h1 style='text-align:center'>Note added Successfully!</h1>");
	        print.println("<h1 style='text-align:center'><a href= 'showNotes.jsp'>View All Notes</a></h1>");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
