package it.unisa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.crypto.spec.SecretKeySpec;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import it.unisa.model.AccountModelDS;
import it.unisa.utils.Utility;
import it.unisa.model.AccountUtente;
import it.unisa.model.Album;
import it.unisa.model.AlbumModelDS;
import it.unisa.model.BraniModelDS;
import it.unisa.model.Brano;
import it.unisa.model.Carrello;
import it.unisa.model.CarrelloModelDS;
import it.unisa.model.Playlist;
import it.unisa.model.PlaylistModelDS;
import it.unisa.model.Podcast;
import it.unisa.model.PodcastModelDS;
import it.unisa.model.Profilo;
import it.unisa.model.ProfiloModelDS;



//SERVLET

@WebServlet("/select")
public class SelectUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();//stampa solo caratteri
		
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
		
		ProfiloModelDS model1 = new ProfiloModelDS(ds);
		AccountModelDS model = new AccountModelDS(ds);
		PlaylistModelDS model2 = new PlaylistModelDS(ds);
		CarrelloModelDS model3 = new CarrelloModelDS(ds);
		AlbumModelDS model4 = new AlbumModelDS(ds);
		BraniModelDS model5 = new BraniModelDS(ds);
		PodcastModelDS model6 = new PodcastModelDS(ds);
		
		response.setContentType("text/html");//tipo di file
		
		SecretKeySpec key, key1;
		String encryptedPassword;
		AccountUtente m;
		
		HttpSession currentSession = request.getSession();
		
		String name = request.getParameter("nickname");
		String pas = request.getParameter("password");
		
		ArrayList<String> lplay = new ArrayList<String>();
		ArrayList<Carrello> car = new ArrayList<Carrello>();
		ArrayList<Album> prA = new ArrayList<Album>();
		ArrayList<Brano> prB = new ArrayList<Brano>();
		ArrayList<Podcast> prP = new ArrayList<Podcast>();
		
		try {
			
			Profilo pr = model1.doRetrieveByKey(name);
			
		if((name.length()<1)||(pas.length()<1) ){
			request.setAttribute("presente", true);
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response); //reindiriziamo alla view
			return;
			}
		else {
			
			Collection<AccountUtente> au =  model.doRetrieveAll();
			 for(Iterator<AccountUtente> aa = au.iterator();aa.hasNext();) {
				 AccountUtente el = (AccountUtente)aa.next();
				 //if((el.getNickname().equals(name))&&(el.getPassword().equals(pas))) {
				 
				//decriptiamo la password per controllare se � giusta
				 byte[] salt = new String("12345678").getBytes();
			        int iterationCount = 40000;
			        int keyLength = 128;
			        
			        key = Encryption.createSecretKey(pas.toCharArray(), salt, iterationCount, keyLength);
					 String originalPassword = pas;
				        System.out.println("Original password: " + originalPassword);
						encryptedPassword = Encryption.encrypt(originalPassword, key);
						 System.out.println("Encrypted password: " + encryptedPassword);
						 String decryptedPassword;
						 if(Encryption.decrypt(el.getPassword(), key)!=null) {
							 decryptedPassword = Encryption.decrypt(el.getPassword(), key);
							 System.out.println("Decrypted password: " + decryptedPassword);
			
							 if((decryptedPassword.equals(pas))&&(el.getNickname().equals(name))) {
			
								 System.out.println(" entra");
						
								 currentSession.setMaxInactiveInterval(60*60);
								 currentSession.setAttribute("acc", name);
								 currentSession.setAttribute("p", pr);
				
								 //recupero lista playlist
								 Collection<Playlist> p = model2.doRetrieveAll();
								 for(Iterator<Playlist> i = p.iterator();i.hasNext();) {
									 Playlist ele = (Playlist)i.next();
									 if(ele.getNomeUtente().equals(name)) {
										 if(!lplay.contains(ele.getNome())) {
											 lplay.add(ele.getNome());
										 }
						
									 }
								 }
				
								 //recupero carrello
								 Collection<Carrello> c = model3.doRetrieveAll();
								 if(c==null) {
									 request.setAttribute("vuoto", true);
								 }
								 for(Iterator<Carrello> i = c.iterator();i.hasNext();) {
									 Carrello ele = (Carrello)i.next();
									 if(ele.getUtente().equals(name)) {
										 car.add(ele);
									 }
								 }
				
								 //recupero prodotti
				
								 Collection<Album> a = model4.doRetrieveAll();
								 for(Iterator<Album> i = a.iterator(); i.hasNext();) {
									 Album al = (Album)i.next();
									 if(al.getDat()!=null) {
										 prA.add(al);
									 }
								 }
				
								 Collection<Brano> b = model5.doRetrieveAll();
								 for(Iterator<Brano> i = b.iterator(); i.hasNext();) {
									 Brano al = (Brano)i.next();
									 if(al.getDat()!=null) {
										 prB.add(al);
									 }
								 }
				
								 Collection<Podcast> po = model6.doRetrieveAll();
								 for(Iterator<Podcast> i = po.iterator(); i.hasNext();) {
									 Podcast al = (Podcast)i.next();
									 if(al.getDat()!=null) {
										 prP.add(al);
									 }
								 }
							 }
						 }
			 
				else {
					 request.setAttribute("presente", true);
						getServletContext().getRequestDispatcher("/login.jsp").forward(request, response); //reindiriziamo alla view
						return; 
				 }
			 }
		}		
			 
				currentSession.setAttribute("prA", prA);
				currentSession.setAttribute("prB", prB);
				currentSession.setAttribute("prP", prP);
				currentSession.setAttribute("conf", false);
				currentSession.setAttribute("carrello", car);
				currentSession.setAttribute("namep", lplay);
				
				getServletContext().getRequestDispatcher("/home.jsp").forward(request, response); //reindiriziamo alla view	
			
		
	}
			
			 catch(SQLException e){
			Utility.print(e);
			request.setAttribute("error", e.getMessage());
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (GeneralSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
	}
}
		
	
		

			
