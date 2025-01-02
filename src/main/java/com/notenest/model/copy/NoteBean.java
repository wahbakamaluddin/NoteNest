package com.notenest.model.copy;

import java.time.LocalDate;

public class NoteBean {
    private int noteId; // Optional: Primary key if using a database
    private String fileName;
    private String filePath;
    private int uploaderId;
    private String subject;
    private LocalDate uploadDate;
    private String noteDescription;
    private String noteTitle;
    private int totalLike;

    // Getters and Setters

    public int getId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public int getUploaderId() {
        return uploaderId;
    }

    public void setUploaderId(int uploaderId) {
        this.uploaderId = uploaderId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public LocalDate getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(LocalDate uploadDate) {
        this.uploadDate = uploadDate;
    }
    
    public String getNoteDescription() {
        return noteDescription;
    }

    public void setNoteDescription(String noteDescription) {
        this.noteDescription = noteDescription;
    }
    
    public String getNoteTitle() {
        return noteTitle;
    }

    public void setNoteTitle(String noteTitle) {
        this.noteTitle = noteTitle;
    }

    
    public int getTotalLike() {
        return totalLike;
    }

    public void setTotalLike(int totalLike) {
        this.totalLike = totalLike;
    }



    @Override
    public String toString() {
        return "Note{" +
                "noteId=" + noteId +
                ", fileName='" + fileName + '\'' +
                ", filePath='" + filePath + '\'' +
                ", uploaderId='" + uploaderId + '\'' +
                ", subject='" + subject + '\'' +
                ", uploadDate=" + uploadDate +
                ", noteDescription='" + noteDescription + '\'' +
                ", noteTitle='" + noteTitle + '\'' +
                ", totalLike=" + totalLike +
                '}';
    }

}
