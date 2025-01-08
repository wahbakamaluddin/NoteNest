package com.notenest.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.time.LocalDate;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;

import com.notenest.bean.NoteBean;
import com.notenest.dao.NoteDAO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.pdmodel.PDPage;


public class NoteService {
	//    private static final String UPLOAD_DIR = "/Volumes/kstone1tb/degree/Sem5/SKJ3013 Adv. Java/Project/uploads";
	private static final String UPLOAD_DIR = "upload/pdf";
	private static final String THUMBNAIL_DIR = "upload/thumbnail";

	public static String uploadNote(Part filePart, ServletContext context) throws IOException {
		if (filePart == null || filePart.getSubmittedFileName() == null) {
			throw new IllegalArgumentException("Invalid file part or file name.");
		}

		// Get the original file name
		String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

		// Determine the upload directory
		String uploadDir = context.getRealPath("/") + UPLOAD_DIR;
		//        String uploadDir = UPLOAD_DIR + File.separator;
		File uploadDirFile = new File(uploadDir);
		if (!uploadDirFile.exists()) {
			if (!uploadDirFile.mkdirs()) {
				throw new IOException("Failed to create upload directory: " + uploadDir);
			}
		}

		// Initialize file path with the original file name
		String filePath = uploadDir + File.separator + originalFileName;
		File file = new File(filePath);

		// Handle potential overwrites by appending a counter to the file name
		int counter = 1;
		String newFileName = originalFileName;
		while (file.exists()) {
			// Append counter before the file extension
			newFileName = originalFileName.replaceFirst("(\\.[^.]+)?$", "_" + counter + "$1");
			filePath = uploadDir + File.separator + newFileName;
			file = new File(filePath);
			counter++;
		}

		// Write the file to disk
		filePart.write(filePath);
		String relativeFilePath = "/" + UPLOAD_DIR + "/" + newFileName;
		System.out.println(filePath);
		return relativeFilePath; // Return the stored file's full path
	}

	//	public static String generateThumbnail(String storedFilePath, ServletContext context) throws IOException {
	//		// Path for thumbnail folder
	//		String thumbnailDir = context.getRealPath("/") + THUMBNAIL_DIR;
	//		File thumbnailDirFile = new File(thumbnailDir);
	//		if (!thumbnailDirFile.exists()) {
	//			if (!thumbnailDirFile.mkdirs()) {
	//				throw new IOException("Failed to create thumbnail directory: " + thumbnailDir);
	//			}
	//		}

	//        // Extract file name
	//        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	//
	//        // Create an InputStream from the Part (this avoids saving the file on disk)
	//        InputStream inputStream = filePart.getInputStream();
	//
	//        // Load the PDF document from the InputStream (PDFBox 3.x method)
	//        try (PDDocument document = PDDocument.load(inputStream)) {  // Load PDF from InputStream
	//            // Create a PDFRenderer object to render the first page
	//            PDFRenderer pdfRenderer = new PDFRenderer(document);
	//            BufferedImage image = pdfRenderer.renderImageWithDPI(0, 150); // Render first page at 150 DPI
	//
	//            // Save the thumbnail as an image
	//            String thumbnailFileName = fileName.replace(".pdf", ".png");
	//            String thumbnailPath = thumbnailDir + File.separator + thumbnailFileName;
	//            ImageIO.write(image, "PNG", new File(thumbnailPath));
	//
	//            // Return the thumbnail folder path
	//            String relativeFilePath = "/" + THUMBNAIL_DIR + "/" + thumbnailFileName;
	//            return relativeFilePath;
	//        } catch (IOException e) {
	//            throw new IOException("Error while generating thumbnail", e);
	//        }
	//    }

	public static String generateThumbnail(String storedFilePath, ServletContext context) throws IOException {
		// Path for thumbnail folder
		String thumbnailDir = context.getRealPath("/") + THUMBNAIL_DIR;
		File thumbnailDirFile = new File(thumbnailDir);
		if (!thumbnailDirFile.exists()) {
			if (!thumbnailDirFile.mkdirs()) {
				throw new IOException("Failed to create thumbnail directory: " + thumbnailDir);
			}
		}

		// Extract the file name from the stored file path
		String fileName = Paths.get(storedFilePath).getFileName().toString();

		// Full path of the stored PDF file
		String fullStoredFilePath = context.getRealPath("/") + storedFilePath;

		// Load the PDF document from the stored file
		try (PDDocument document = PDDocument.load(new File(fullStoredFilePath))) {
			// Create a PDFRenderer object to render the first page
			PDFRenderer pdfRenderer = new PDFRenderer(document);
			BufferedImage image = pdfRenderer.renderImageWithDPI(0, 150); // Render first page at 150 DPI

			// Save the thumbnail as an image
			String thumbnailFileName = fileName.replace(".pdf", ".png");
			String thumbnailPath = thumbnailDir + File.separator + thumbnailFileName;
			ImageIO.write(image, "PNG", new File(thumbnailPath));

			// Return the relative path to the thumbnail
			return "/" + THUMBNAIL_DIR + "/" + thumbnailFileName;
		} catch (IOException e) {
			throw new IOException("Error while generating thumbnail", e);
		}
	}




	public static NoteBean createNoteBean(String fileName, int uploaderId, String subject, String filePath, String noteDescription, String noteTitle, String thumbnailPath) {
		NoteBean note = new NoteBean();
		note.setFileName(fileName);
		note.setUploaderId(uploaderId);
		note.setSubject(subject);
		note.setUploadDate(LocalDate.now());
		note.setFilePath(filePath);
		note.setNoteDescription(noteDescription); // Set the note description
		note.setNoteTitle(noteTitle); // Set the note title
		note.setThumbnailPath(thumbnailPath);
		System.out.println("note in NoteService" + note);
		System.out.println("thumbnailPath in NoteService" + note.getThumbnailPath());
		return note;
	}

	public boolean deleteNoteById(int noteId) throws Exception {

		NoteDAO noteDAO = new NoteDAO();

		String filePath = noteDAO.getNoteFilePath(noteId);
		String thumbnailPath = noteDAO.getNoteThumbnailPath(noteId);

		// Delete both files
		deleteFile(filePath, "Note file not found.", "Failed to delete the note file.");
		deleteFile(thumbnailPath, "Thumbnail file not found.", "Failed to delete the thumbnail file.");

		// Remove the metadata from the database
		return noteDAO.deleteNoteById(noteId);

	}

	private void deleteFile(String filePath, String notFoundMessage, String deleteFailMessage) throws Exception {
		if (filePath == null || filePath.isEmpty()) {
			return;
		}

		File file = new File(filePath);
		if (file.exists() && !file.delete()) {
			throw new Exception(deleteFailMessage);
		}
	}
}

