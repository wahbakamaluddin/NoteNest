package com.notenest.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.security.Timestamp;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.notenest.bean.NoteBean;
import com.notenest.dao.NoteDAO;
import com.notenest.service.NoteService;
import com.google.gson.Gson;

/**
 * Servlet implementation class NoteController
 */
@WebServlet({"/getAllNote", "/addNote", "/deleteNote", "/editNote", "/viewNote/*"})
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB (threshold for writing files to disk)
	    maxFileSize = 1024 * 1024 * 10,      // 10MB (maximum file size)
	    maxRequestSize = 1024 * 1024 * 50    // 50MB (maximum request size)
	)
public class NoteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET requests (if needed)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String path = request.getServletPath();
    	
    	switch (path) {
        case "/viewNote":
            viewNote(request, response);
    	}
        // Handle GET requests here, if necessary
    }

    // Handle POST requests and route based on the action
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String path = request.getServletPath();

        switch (path) {
            case "/addNote":
                addNote(request, response);
                break;
            case "/deleteNote":
                deleteNote(request, response);
                break;
            case "/editNote":
                editNote(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + path);
        }
    }
    
    //GET methods
    private void viewNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String[] pathParts = request.getRequestURI().split("/");
        String noteIdParam = pathParts[pathParts.length - 1];
        if (noteIdParam == null || noteIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Note ID is required.");
            return;
        }

        try {
            int noteId = Integer.parseInt(noteIdParam);

            // Fetch the note details from the database
            NoteDAO noteDAO = new NoteDAO();
            NoteBean note = noteDAO.getNoteById(noteId); // Assume this method exists in NoteDAO

            if (note == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Note not found.");
                return;
            }

            // Set the note details in the request scope
            request.setAttribute("note", note);

            // Forward to the detailed page
            request.getRequestDispatcher("/viewNote.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Note ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while retrieving the note.");
        }
    }
    
    
    //POST methods//
    // Method to add a note
    private void addNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession(false); // Check for session existence
	    if (session == null || session.getAttribute("userId") == null) {
	        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User is not logged in.");
	        return;
	    }

	    try {
	    	
	    	// Retrieve metadata from upload.jsp HTTP POST
	    	Part filePart = request.getPart("file"); // File uploaded from the form
	    	int uploaderId = (int) session.getAttribute("userId"); // Retrieve user ID from session
	    	String subject = request.getParameter("subject"); // Subject from the form
	    	String fileName = filePart.getSubmittedFileName(); // Extract file name
	    	String noteTitle = request.getParameter("noteTitle"); // Note title from the form
	    	String noteDescription = request.getParameter("noteDescription"); // Note description from the form
	    	LocalDate currentDate = LocalDate.now(); // Current date for upload

	        // Save the uploaded file
	        String filePath = "";
			try {
				filePath = NoteService.uploadNote(filePart, request.getServletContext());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			   // Generate the thumbnail for the uploaded PDF file using the Part object
	        String thumbnailPath = "";
	        try {
	            thumbnailPath = NoteService.generateThumbnail(filePart, request.getServletContext());
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating the thumbnail.");
	            return;
	        }
	        System.out.println(thumbnailPath);
				        
	        // Add notebean
	        NoteBean note = NoteService.createNoteBean(fileName, uploaderId, subject, filePath, noteDescription, noteTitle, thumbnailPath);
	        // Add note metadata to database
	        System.out.println("Note int conttroller:  " + note);
	        NoteDAO noteDAO = new NoteDAO();
	        noteDAO.uploadNote(note);

	        // Set a success message in the session
	        session.setAttribute("successMessage", "File uploaded and metadata saved successfully.");

	        // Redirect to myupload.jsp after the note is uploaded successfully
	        response.sendRedirect("myupload.jsp");
	    } catch (Exception e) {
	        // Log the error (optional)
	        e.printStackTrace();

	        // Respond with an error message
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while uploading the file.");
	    }
	}
    
    // Method to delete a note
    private void deleteNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve the note ID from the request
            String noteIdParam = request.getParameter("noteId");
            if (noteIdParam == null || noteIdParam.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Note ID is required.");
                return;
            }
            
            int noteId = Integer.parseInt(noteIdParam);

            // Fetch the file path for the note from the database
            NoteDAO noteDAO = new NoteDAO();
            String filePath = noteDAO.getNoteFilePath(noteId);
            if (filePath == null || filePath.isEmpty()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Note not found.");
                return;
            }

            // Delete the file from the filesystem
            File file = new File(filePath);
            if (file.exists()) {
                if (!file.delete()) {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete the file from the filesystem.");
                    return;
                }
            }

            // Remove the metadata from the database
            boolean isDeleted = noteDAO.deleteNoteById(noteId);
            if (!isDeleted) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete the note metadata from the database.");
                return;
            }

            // Respond to client
            response.getWriter().println("Note deleted successfully.");
        } catch (NumberFormatException e) {
            // Handle invalid note ID format
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Note ID format.");
        } catch (Exception e) {
            // Log the error (optional)
            e.printStackTrace();

            // Respond with a generic error message
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while deleting the note.");
        }
    }

    // Method to edit a note
    private void editNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve parameters
            String noteIdParam = request.getParameter("noteId");
            String subject = request.getParameter("subject");
            String noteDescription = request.getParameter("noteDescription");
            String noteTitle = request.getParameter("noteTitle");

            // Validate inputs
            if (noteIdParam == null && subject == null && noteDescription == null && noteTitle == null ||
                noteIdParam.isEmpty() && subject.isEmpty() && noteDescription.isEmpty() && noteTitle.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "At least one field is filled");
                return;
            }

            int noteId = Integer.parseInt(noteIdParam);

            // Update the metadata using NoteDAO
            NoteDAO noteDAO = new NoteDAO();
            noteDAO.editNoteMetadata( noteId, subject, noteDescription, noteTitle);

            // Respond to the client

	        // Redirect to myupload.jsp after the note is uploaded successfully
	        response.sendRedirect("myupload.jsp");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Note ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating the note metadata.");
        }
    }
        
}


