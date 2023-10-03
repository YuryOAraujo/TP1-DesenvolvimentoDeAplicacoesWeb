package yoa.cardiology.hospital.logic;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import yoa.cardiology.hospital.dao.ExamDAO;
import yoa.cardiology.hospital.model.Exam;

import java.io.ByteArrayInputStream;
import java.io.IOException;

public class DownloadPDF implements Logic {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        long id = Long.parseLong(request.getParameter("id"));
        Exam exam = new ExamDAO().obtainExamById(id);

        if (exam != null && exam.getPdfData() != null) {
            try {
                ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(exam.getPdfData());
                PdfReader pdfReader = new PdfReader(byteArrayInputStream);

                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline; filename=exam.pdf");

                PdfDocument pdfDoc = new PdfDocument(pdfReader, new PdfWriter(response.getOutputStream()));
                Document document = new Document(pdfDoc);

                document.close();
                pdfDoc.close();
                pdfReader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "generateReportList.jsp";
    }
}
