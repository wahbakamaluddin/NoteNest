package com.notenest.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;

import javax.servlet.ServletContext;
import javax.servlet.http.Part;

import com.notenest.bean.NoteBean;

public class NoteService {
//    private static final String UPLOAD_DIR = "/Volumes/kstone1tb/degree/Sem5/SKJ3013 Adv. Java/Project/uploads";
	private static final String UPLOAD_DIR = "upload/pdf";

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
        
    public static NoteBean createNoteBean(String fileName, int uploaderId, String subject, String filePath, String noteDescription, String noteTitle) {
        NoteBean note = new NoteBean();
        note.setFileName(fileName);
        note.setUploaderId(uploaderId);
        note.setSubject(subject);
        note.setUploadDate(LocalDate.now());
        note.setFilePath(filePath);
        note.setNoteDescription(noteDescription); // Set the note description
        note.setNoteTitle(noteTitle); // Set the note title
        return note;
    }

}
