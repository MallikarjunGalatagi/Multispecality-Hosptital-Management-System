package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.PrescriptionDAO;
import com.hospital_management.model.Prescription;
import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DownloadPrescriptionServlet")
public class DownloadPrescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DownloadPrescriptionServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int prescriptionId = Integer.parseInt(request.getParameter("id"));

        PrescriptionDAO prescriptionDAO = new PrescriptionDAO();
        Prescription prescription = prescriptionDAO.getPrescriptionById(prescriptionId);

        if (prescription == null) {
            response.getWriter().println("Prescription not found.");
            return;
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition",
                "attachment; filename=prescription_" + prescriptionId + ".pdf");

        try {
            Document document = new Document();

            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();

            document.add(new Paragraph("========================================"));
            document.add(new Paragraph("      HOSPITAL MANAGEMENT SYSTEM"));
            document.add(new Paragraph("         Medical Prescription"));
            document.add(new Paragraph("========================================"));
            document.add(new Paragraph(" "));

            document.add(new Paragraph("Prescription ID : " + prescription.getPrescriptionId()));
            document.add(new Paragraph("Patient Name    : " + prescription.getPatientName()));
            document.add(new Paragraph("Doctor Name     : " + prescription.getDoctorName()));
            document.add(new Paragraph("Appointment ID  : " + prescription.getAppointmentId()));

            document.add(new Paragraph(" "));
            document.add(new Paragraph("----------------------------------------"));
            document.add(new Paragraph("Diagnosis"));
            document.add(new Paragraph("----------------------------------------"));
            document.add(new Paragraph(prescription.getDiagnosis()));

            document.add(new Paragraph(" "));
            document.add(new Paragraph("----------------------------------------"));
            document.add(new Paragraph("Medicines"));
            document.add(new Paragraph("----------------------------------------"));
            document.add(new Paragraph(prescription.getMedicines()));

            document.add(new Paragraph(" "));
            document.add(new Paragraph("----------------------------------------"));
            document.add(new Paragraph("Dosage Instructions"));
            document.add(new Paragraph("----------------------------------------"));
            document.add(new Paragraph(prescription.getDosageInstructions()));

            document.add(new Paragraph(" "));
            document.add(new Paragraph("----------------------------------------"));
            document.add(new Paragraph("Remarks"));
            document.add(new Paragraph("----------------------------------------"));
            document.add(new Paragraph(prescription.getRemarks()));

            document.add(new Paragraph(" "));
            document.add(new Paragraph("========================================"));
            document.add(new Paragraph("          Get Well Soon!"));
            document.add(new Paragraph("========================================"));

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}