package com.notenest.dao;

import com.notenest.bean.NoteBean;
import com.notenest.util.DBUtil;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class NoteDAO {

    // Get all notes
    public static List<NoteBean> getAllNote() throws SQLException {
        List<NoteBean> notes = new ArrayList<>();
        String query = "SELECT * FROM Note";  // Ensure 'notes' matches your table name
        
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                NoteBean note = new NoteBean();
                note.setNoteId(rs.getInt("note_id"));
                note.setFileName(rs.getString("file_name"));
                note.setFilePath(rs.getString("file_path"));
                note.setUploaderId(rs.getInt("uploader_id"));
                note.setSubject(rs.getString("subject"));
                note.setUploadDate(rs.getDate("upload_date").toLocalDate());
                note.setNoteDescription(rs.getString("note_description"));
                note.setNoteTitle(rs.getString("note_title"));
                note.setThumbnailPath(rs.getString("thumbnail_path"));

                notes.add(note);
            }
        }
        return notes;
    }

    // Get notes by uploader ID
    public List<NoteBean> getNotesByUploaderId(int uploaderId) throws SQLException {
        List<NoteBean> notes = new ArrayList<>();
        String query = "SELECT * FROM notes WHERE uploader_id = ?";
        
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setInt(1, uploaderId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    NoteBean note = new NoteBean();
                    note.setNoteId(rs.getInt("noteId"));
                    note.setFileName(rs.getString("file_name"));
                    note.setFilePath(rs.getString("file_path"));
                    note.setUploaderId(rs.getInt("uploader_id")); // Changed to int
                    note.setSubject(rs.getString("subject"));
                    note.setUploadDate(rs.getDate("upload_date").toLocalDate());
                    note.setNoteDescription(rs.getString("note_description"));
                    note.setNoteTitle(rs.getString("note_title"));
                    notes.add(note);
                }
            }
        }
        return notes;
    }

    // Insert a new note
    public void uploadNote(NoteBean note) throws SQLException {
        String query = "INSERT INTO Note (file_name, file_path, uploader_id, subject, upload_date, note_description, note_title, thumbnail_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setString(1, note.getFileName());
            stmt.setString(2, note.getFilePath());
            stmt.setInt(3, note.getUploaderId()); // Changed to setInt for int type
            stmt.setString(4, note.getSubject());
            stmt.setDate(5, Date.valueOf(note.getUploadDate()));
            stmt.setString(6, note.getNoteDescription());
            stmt.setString(7, note.getNoteTitle());
            stmt.setString(8, note.getThumbnailPath());

            stmt.executeUpdate();
        }
    }

    // Get a note by ID
    public NoteBean getNoteById(int noteId) throws SQLException {
        NoteBean note = null;
        String query = "SELECT * FROM Note WHERE note_id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setInt(1, noteId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    note = new NoteBean();
                    note.setNoteId(rs.getInt("note_id"));
                    note.setFileName(rs.getString("file_name"));
                    note.setFilePath(rs.getString("file_path"));
                    note.setUploaderId(rs.getInt("uploader_id")); // Changed to int
                    note.setSubject(rs.getString("subject"));
                    note.setUploadDate(rs.getDate("upload_date").toLocalDate());
                    note.setNoteDescription(rs.getString("note_description"));
                    note.setNoteTitle(rs.getString("note_title"));
                }
            }
        }
        return note;
    }

    // Delete based on note_id
    public boolean deleteNoteById(int noteId) throws SQLException {
        String query = "DELETE FROM Note WHERE note_id = ?";
        
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setInt(1, noteId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        }
        
    }
    
 // Retrieve file path based on note_id
    public String getNoteFilePath(int noteId) throws SQLException {
        String query = "SELECT file_path FROM Note WHERE note_id = ?";
        
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setInt(1, noteId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("file_path");
                }
            }
        }
        return null; // Return null if no file path is found
    }
    
 // Update metadata of a note
    public void editNoteMetadata(int noteId, String subject, String noteDescription, String noteTitle) throws SQLException {
        // Base query
        StringBuilder queryBuilder = new StringBuilder("UPDATE Note SET ");
        boolean isFirst = true;

        // Dynamically construct the query based on non-null parameters
        if (subject != null) {
            queryBuilder.append("subject = ?");
            isFirst = false;
        }
        if (noteDescription != null) {
            if (!isFirst) queryBuilder.append(", ");
            queryBuilder.append("note_description = ?");
            isFirst = false;
        }
        if (noteTitle != null) {
            if (!isFirst) queryBuilder.append(", ");
            queryBuilder.append("note_title = ?");
        }

        queryBuilder.append(" WHERE note_id = ?");

        // If no updates are required, simply return
        if (isFirst) {
            return; // No parameters to update
        }

        // Convert StringBuilder to String
        String query = queryBuilder.toString();

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            // Set parameters dynamically
            int paramIndex = 1;
            if (subject != null) {
                stmt.setString(paramIndex++, subject);
            }
            if (noteDescription != null) {
                stmt.setString(paramIndex++, noteDescription);
            }
            if (noteTitle != null) {
                stmt.setString(paramIndex++, noteTitle);
            }
            stmt.setInt(paramIndex, noteId);

            // Execute the update
            stmt.executeUpdate();
        }
    }


}
